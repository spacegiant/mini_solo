import 'package:json_annotation/json_annotation.dart';

import '../campaign_item.dart';
import '../journal_entry_types.dart';
import 'journal_entry.dart';

part 'mythic_entry.g.dart';

@JsonSerializable()
class MythicEntry extends CampaignItem {
  JournalEntry lines;
  String label;

  MythicEntry({
    required super.isFavourite,
    required this.lines,
    required this.label,
  });
// coverage:ignore-start
  factory MythicEntry.fromJson(Map<String, dynamic> json) =>
      _$MythicEntryFromJson(json);

  Map<String, dynamic> toJson() => _$MythicEntryToJson(this);

  @override
  JournalEntryTypes type = JournalEntryTypes.mythic;
// coverage:ignore-end
}
