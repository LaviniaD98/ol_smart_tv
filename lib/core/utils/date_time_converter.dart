import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

class DateTimeConverter extends JsonConverter<DateTime?, String?> {
  @override
  DateTime? fromJson(String? json) => json != null ? DateFormat('MMM d, yyyy, hh:mm:ss', 'en').parse(json) : null;

  @override
  String? toJson(DateTime? object) => object?.toIso8601String();

  const DateTimeConverter();
}