import 'package:json_annotation/json_annotation.dart';

import 'campaign_item.dart';
import 'campaign_data.dart';

part 'note_entry_item.g.dart';

@JsonSerializable(explicitToJson: true)
class NoteEntryItem extends CampaignItem {
  String detail;

  NoteEntryItem({
    required super.isFavourite,
    required this.detail,
  });

  // coverage:ignore-start
  factory NoteEntryItem.fromJson(Map<String, dynamic> json) =>
      _$NoteEntryItemFromJson(json);

  Map<String, dynamic> toJson() => _$NoteEntryItemToJson(this);

  @override
  JournalEntryTypes type = JournalEntryTypes.note;
// coverage:ignore-end
}
