import 'package:json_annotation/json_annotation.dart';

import '../campaign_item.dart';
import '../journal_entry_types.dart';

part 'new_scene_entry.g.dart';

@JsonSerializable()
class NewSceneEntry extends CampaignItem {
  String label;

  NewSceneEntry({
    required this.label,
  });

  // coverage:ignore-start
  factory NewSceneEntry.fromJson(Map<String, dynamic> json) =>
      _$NewSceneEntryFromJson(json);

  Map<String, dynamic> toJson() => _$NewSceneEntryToJson(this);

  @override
  JournalEntryTypes type = JournalEntryTypes.newScene;
// coverage:ignore-end
}
