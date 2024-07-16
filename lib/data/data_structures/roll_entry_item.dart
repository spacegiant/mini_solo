import 'package:json_annotation/json_annotation.dart';

import '../../svg_icon.dart';
import '../campaign_item.dart';
import '../journal_entry_types.dart';
import 'dice_roll.dart';

part 'roll_entry_item.g.dart';

@JsonSerializable()
class RollEntryItem extends CampaignItem {
  List<DiceRoll> result;
  String label;
  SVGIcon? icon;

  RollEntryItem({
    required super.isFavourite,
    required this.result,
    this.label = 'Dice Roll',
    this.icon,
  });
// coverage:ignore-start
  factory RollEntryItem.fromJson(Map<String, dynamic> json) =>
      _$RollEntryItemFromJson(json);

  Map<String, dynamic> toJson() => _$RollEntryItemToJson(this);

  @override
  JournalEntryTypes type = JournalEntryTypes.roll;
// coverage:ignore-end
}
