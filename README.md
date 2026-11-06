# Rumour

Anonymous, room-based chat. Enter a 6-digit room code, get a random identity
for that room, and chat in real time.

| **APK** | [Download APK](release/rumour-v1.0.0.apk) |
| **Demo video** | [Watch the full workflow](https://drive.google.com/file/d/1jRa_WcV8H5kr5WccNlfYti8fPXNEugLT/view?usp=sharing) |

## Features

- **Join a room** with a 6-digit code. Existing codes open the room; new codes create a room automatically.
- **Random identity per room, persisted for returning members** from `GET https://randomuser.me/api/`
  (e.g. *Montserrat Romero*, shown as `@MontserratRomero`). Names are unique
  within a room; returning users keep their identity and go straight to chat.
- **Real-time chat** on Cloud Firestore: Messages appear instantly; offline writes sync when connectivity returns, day separators, sender grouping, paginated history.
- **Dark & light mode** (toggle on the Join screen, saved).
- **Notifications** for new messages while the app is in the background.
- **Animations** throughout, plus shimmer/skeleton loading and clear error and
  empty states.

## Run

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs   # Freezed / JSON
flutter run
flutter test
flutter build apk --release
```

Firestore security rules: `firebase deploy --only firestore:rules`

## Tech stack

Flutter · Cloud Firestore · flutter_bloc (Cubit) · GetIt · Freezed +
json_serializable · Dio · shared_preferences · flutter_local_notifications ·
gen-l10n · bloc_test + mocktail

## Architecture

Feature-first clean architecture:

```
presentation (pages, widgets, cubits) → domain (entities, repository interfaces) ← data (DTOs, data sources, repository impls)
```

- **Cubits** hold all screen logic; pages only compose widgets.
- **Repositories** return `Result<T>` (`Ok` / `Err(Failure)`); Firebase and Dio
  errors are mapped to typed `Failure`s, which the UI turns into localized text.
- **DTOs** (Freezed + json_serializable) convert to **entities** via `toEntity()`.
- **Dependency injection:** every class gets its dependencies through its
  constructor. GetIt is used only in `core/di/injection.dart`,
  `app/router/app_router.dart` and `main.dart`.
- **Design system:** color/spacing/radius/size/motion tokens, Material
  `TextTheme` roles (`context.text.*`, `context.colors.*`), and all strings in
  `lib/core/l10n/arb/app_en.arb`.

**Flow**

```
Join Screen
    |
    v
Enter 6-digit code
    |
    v
JoinRoomCubit
    |
    v
Find or create room
    |
    v
Existing membership?
    |
    +---- Yes ----> Restore identity ----> Chat
    |
    +---- No -----> Generate random identity
                          |
                          v
                    Save membership
                          |
                          v
                         Chat
```

## Codebase structure

```
lib/
├── main.dart                 # bootstrap: Firebase, DI, splash
├── app/                      # MaterialApp, router (builds screens + cubits)
├── core/
│   ├── constants/            # app constants, Firestore paths
│   ├── di/                   # GetIt registrations
│   ├── error/                # exceptions, Failure, ErrorMapper
│   ├── l10n/                 # ARB strings, Failure → text
│   ├── network/              # Dio client
│   ├── services/             # notifications, app lifecycle, clipboard
│   ├── theme/                # design tokens, colour roles, text theme, ThemeData
│   ├── utils/                # Result, date formatting, Firestore converters
│   └── widgets/              # shared UI: buttons, loaders, animations, feedback
└── features/
    ├── room/                 # join, identity (randomuser.me), membership, header
    │   ├── data/             #   datasources · dtos · repositories
    │   ├── domain/           #   entities · repository interfaces · RoomCode rules
    │   └── presentation/     #   join/ · identity/ · room_info/ (cubit · view · widgets)
    ├── chat/                 # messages, pagination, composer, notifications
    │   ├── data/  domain/
    │   └── presentation/     #   cubit · models (ChatItem) · view · widgets
    ├── theme/                # light/dark mode
    └── user/                 # anonymous per-device user id
test/                         # cubit, repository and helper unit tests
firestore.rules               # security rules
```

## Cloud Firestore data structure

```
rooms/{roomCode}                      # e.g. "581200"
├── code:          string
├── memberCount:   number             # incremented only when a new membership is created
├── createdAt:     timestamp
├── lastMessageAt: timestamp | null
│
├── members/{userId}                  # userId = anonymous device UUID
│   ├── userId:   string
│   ├── alias:    string              # "Montserrat Romero"
│   ├── handle:   string              # "MontserratRomero"
│   └── joinedAt: timestamp
│
└── messages/{messageId}              # auto id
    ├── text:            string       # 1–1000 chars
    ├── senderId:        string       # → members/{userId}
    ├── senderAlias:     string
    ├── createdAt:       timestamp    # server time, used for ordering
    └── clientCreatedAt: timestamp    # device time, shown while pending
```

- **Join:** one transaction creates the room if needed, adds the member and
  increments `memberCount`.
- **Send:** one batch writes the message and updates `lastMessageAt`.
- **Reads:** latest 30 messages live (`orderBy createdAt desc`), older pages
  with `startAfter`. Only single-field indexes are needed.
- **Rules:** 6-digit codes only, members and messages are append-only, fields
  are whitelisted, and only room members can post.


## Notes

## Notes

- **Anonymous identity:** Each installation is assigned a UUID stored locally. Clearing app data or reinstalling generates a new identity.
- **Room restoration:** The app opens on the Join screen. Entering a previously joined room restores the existing alias and chat history.
- **Room creation:** Entering a new six-digit code automatically creates the room; existing codes join their corresponding rooms.
- **Sender color differentiation (beyond Figma):** Each participant's `@handle` is assigned one of seven colors using a deterministic hash of their user ID. Colors remain consistent across pagination and app restarts without requiring additional storage. The palette meets WCAG AA contrast requirements in both light and dark themes. Lime is reserved for the current user's messages; incoming message bubbles retain the original Figma styling.
