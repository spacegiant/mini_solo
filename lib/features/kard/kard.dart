import 'package:json_annotation/json_annotation.dart';
import 'package:mini_solo/data/campaign_item.dart';

import '../../data/journal_entry_types.dart';
import '../../views/journal/chooseControlWidget.dart';

part 'kard.g.dart';

enum LabelLayout { vertical, horizontal }

@JsonSerializable()
class Kard extends CampaignItem {
  final String title;
  final List<String>? lines;
  final LabelLayout? labelLayout;
  ControlTypeEnum controlType;

  Kard({
    required this.title,
    this.lines,
    this.labelLayout,
    required this.controlType,
  });

  // coverage:ignore-start

  factory Kard.fromJson(Map<String, dynamic> json) => _$KardFromJson(json);

  Map<String, dynamic> toJson() => _$KardToJson(this);

  @override
  JournalEntryTypes type = JournalEntryTypes.kard;
// coverage:ignore-end
}
