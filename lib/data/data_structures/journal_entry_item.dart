import 'package:json_annotation/json_annotation.dart';

import '../journal_entry_types.dart';

part 'journal_entry_item.g.dart';

@JsonSerializable(explicitToJson: true)
class JournalEntryItem {
  bool isFavourite;
  JournalEntryTypes type;
  String id;
  String? note;

  JournalEntryItem({
    required this.isFavourite,
    required this.type,
    required this.id,
    this.note,
  });

  // coverage:ignore-start
  factory JournalEntryItem.fromJson(Map<String, dynamic> json) =>
      _$JournalEntryItemFromJson(json);

  Map<String, dynamic> toJson() => _$JournalEntryItemToJson(this);
// coverage:ignore-end
}
