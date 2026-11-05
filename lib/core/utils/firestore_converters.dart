import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

/// (De)serialises Firestore [Timestamp]s to [DateTime] inside DTOs.
class TimestampConverter implements JsonConverter<DateTime?, Object?> {
  const TimestampConverter();

  @override
  DateTime? fromJson(Object? json) => switch (json) {
        final Timestamp t => t.toDate(),
        final int ms => DateTime.fromMillisecondsSinceEpoch(ms),
        final String s => DateTime.tryParse(s),
        _ => null,
      };

  @override
  Object? toJson(DateTime? date) =>
      date == null ? null : Timestamp.fromDate(date);
}
