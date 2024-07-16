import 'package:json_annotation/json_annotation.dart';

part 'journal_entry.g.dart';

@JsonSerializable()
class JournalEntry {
  late String type;
  late String? line1;
  late String? line2;
  late String result;

  JournalEntry({
    required this.type,
    this.line1,
    this.line2,
    required this.result,
  });

  // coverage:ignore-start
  factory JournalEntry.fromJson(Map<String, dynamic> json) =>
      _$JournalEntryFromJson(json);

  Map<String, dynamic> toJson() => _$JournalEntryToJson(this);
// coverage:ignore-end
}
