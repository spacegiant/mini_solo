import 'package:json_annotation/json_annotation.dart';

import '../../views/journal/chooseControlWidget.dart';
import '../campaign_item.dart';
import '../journal_entry_types.dart';

part 'tracker_entry.g.dart';

@JsonSerializable()
class TrackerEntry extends CampaignItem {
  String label;
  int currentValue;
  int? minValue;
  int? maxValue;
  ControlTypeEnum controlType;

  TrackerEntry({
    required this.label,
    required this.currentValue,
    this.minValue,
    this.maxValue,
    required this.controlType,
  });

  // coverage:ignore-start
  factory TrackerEntry.fromJson(Map<String, dynamic> json) =>
      _$TrackerEntryFromJson(json);

  Map<String, dynamic> toJson() => _$TrackerEntryToJson(this);

  @override
  JournalEntryTypes type = JournalEntryTypes.tracker;
// coverage:ignore-end
}
