import 'package:json_annotation/json_annotation.dart';

import '../../svg_icon.dart';
import 'both_results.dart';

part 'dice_roll.g.dart';

@JsonSerializable()
class DiceRoll {
  BothResults result;
  String diceType;
  SVGIcon icon;

  DiceRoll({
    // required super.isFavourite,
    required this.result,
    required this.diceType,
    required this.icon,
  });
// coverage:ignore-start
  factory DiceRoll.fromJson(Map<String, dynamic> json) =>
      _$DiceRollFromJson(json);

  Map<String, dynamic> toJson() => _$DiceRollToJson(this);

// coverage:ignore-end
}
