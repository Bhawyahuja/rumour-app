#!/usr/bin/env node
/**
 * Seeds a demo conversation (6 users, 20 messages) into a Rumour room.
 *
 * Usage (from tool/seed):
 *   npm install
 *   GOOGLE_APPLICATION_CREDENTIALS=./service-account.json node seed_room.js [roomCode]
 *
 * - roomCode defaults to 111111.
 * - Re-running replaces the seeded members/messages (real users who joined
 *   the room are left untouched).
 * - Uses the Admin SDK, which bypasses security rules, so messages can carry
 *   realistic past timestamps (yesterday evening → the last half hour).
 */
const admin = require('firebase-admin');

const PROJECT_ID = 'rumour-app-3c67e';
const ROOM = process.argv[2] || '111111';
const SEED_PREFIX = 'seed-user-';

if (!/^\d{6}$/.test(ROOM)) {
  console.error(`Room code must be 6 digits, got "${ROOM}".`);
  process.exit(1);
}

admin.initializeApp({ projectId: PROJECT_ID });
const db = admin.firestore();
const { Timestamp } = admin.firestore;

// Aliases in the same shape the app produces from randomuser.me.
const users = [
  { first: 'Montserrat', last: 'Romero' },
  { first: 'Lucas', last: 'Moreau' },
  { first: 'Emma', last: 'Fischer' },
  { first: 'Noah', last: 'Williams' },
  { first: 'Freya', last: 'Hansen' },
  { first: 'Aiden', last: 'Murphy' },
].map((u, i) => ({
  id: `${SEED_PREFIX}${i + 1}`,
  alias: `${u.first} ${u.last}`,
  handle: `${u.first}${u.last}`,
}));

const [montse, lucas, emma, noah, freya, aiden] = users;

// [sender, minutes offset from the conversation start, text]
const script = [
  // Yesterday evening
  [montse, 0, 'Hi all! I came to visit your city for the weekend. Suggest coffee shop for breakfast with family.'],
  [lucas, 3, 'Welcome! Visit a coffee shop on Amaranth St. Their pastries are unreal.'],
  [emma, 5, 'Second that. Go before 9 though, it gets packed on weekends.'],
  [montse, 7, 'Perfect, thank you! Is it okay with kids?'],
  [lucas, 9, 'Totally, they even have a small play corner at the back.'],
  [noah, 21, 'Also, if anyone is around tomorrow there is a street food market by the river 🙂'],
  [freya, 24, 'Ooh what time does it start?'],
  [noah, 25, 'Around 11, runs until late afternoon.'],
  [aiden, 32, 'Heads up: the bridge near the market is closed for repairs, take the north crossing.'],
  [freya, 34, 'Good to know, thanks!'],

  // Today — the last ~half hour before the script runs
  [montse, 14 * 60, 'Update: we tried the Amaranth St place. Best croissants I have ever had 😍'],
  [lucas, 14 * 60 + 2, 'Told you! Did you get the cardamom bun?'],
  [montse, 14 * 60 + 4, 'Yes! The kids finished it before I could take a photo.'],
  [emma, 14 * 60 + 10, 'Haha classic. Any plans for the rest of the day?'],
  [montse, 14 * 60 + 12, 'Thinking of the market Noah mentioned, then maybe a museum.'],
  [aiden, 14 * 60 + 15, 'The science museum is free on Saturdays, great for kids.'],
  [noah, 14 * 60 + 17, 'Market is already busy, the dumpling stall has a short queue right now.'],
  [freya, 14 * 60 + 20, 'On my way there too, might see you all 👋'],
  [emma, 14 * 60 + 22, 'Someone grab me a mango lassi please 🙏'],
  [montse, 14 * 60 + 25, 'This city is lovely, thanks everyone for the tips!'],
];

async function deleteSeeded(col, field) {
  const snap = await col.where(field, '>=', SEED_PREFIX).where(field, '<', `${SEED_PREFIX}~`).get();
  const batch = db.batch();
  snap.docs.forEach((d) => batch.delete(d.ref));
  if (!snap.empty) await batch.commit();
  return snap.size;
}

async function main() {
  const roomRef = db.collection('rooms').doc(ROOM);
  const members = roomRef.collection('members');
  const messages = roomRef.collection('messages');

  // Part 1 happens yesterday from 19:30; part 2 ("this morning") is anchored
  // to *now* so it always ends ~5 minutes ago — never in the future, which
  // would pin seeded messages below anything you send afterwards.
  const DAY2 = 14 * 60; // offsets >= this belong to part 2
  const lastOffset = script[script.length - 1][1];
  const yesterday = new Date();
  yesterday.setDate(yesterday.getDate() - 1);
  yesterday.setHours(19, 30, 0, 0);
  const day2Start = Date.now() - (lastOffset - DAY2 + 5) * 60000;
  const at = (minutes) =>
    Timestamp.fromDate(
      minutes >= DAY2
        ? new Date(day2Start + (minutes - DAY2) * 60000)
        : new Date(yesterday.getTime() + minutes * 60000),
    );

  // 1. Clean previous seed data.
  const removedMsgs = await deleteSeeded(messages, 'senderId');
  const removedMembers = await deleteSeeded(members, 'userId');

  // 2. Members.
  const batch = db.batch();
  users.forEach((u, i) => {
    batch.set(members.doc(u.id), {
      userId: u.id,
      alias: u.alias,
      handle: u.handle,
      joinedAt: at(-5 + i),
    });
  });

  // 3. Messages.
  script.forEach(([user, minutes, text]) => {
    const ts = at(minutes);
    batch.set(messages.doc(), {
      text,
      senderId: user.id,
      senderAlias: user.alias,
      createdAt: ts,
      clientCreatedAt: ts,
    });
  });
  await batch.commit();

  // 4. Room doc: keep any real members in the count.
  const realMembers = (await members.get()).docs.filter((d) => !d.id.startsWith(SEED_PREFIX)).length;
  const roomSnap = await roomRef.get();
  await roomRef.set(
    {
      code: ROOM,
      memberCount: users.length + realMembers,
      createdAt: roomSnap.exists && roomSnap.get('createdAt') ? roomSnap.get('createdAt') : at(-10),
      lastMessageAt: at(script[script.length - 1][1]),
    },
    { merge: true },
  );

  console.log(
    `Room ${ROOM}: removed ${removedMsgs} old seed messages / ${removedMembers} members, ` +
      `added ${users.length} members and ${script.length} messages ` +
      `(${users.length + realMembers} members total).`,
  );
}

main().then(
  () => process.exit(0),
  (err) => {
    console.error('Seeding failed:', err.message);
    process.exit(1);
  },
);
