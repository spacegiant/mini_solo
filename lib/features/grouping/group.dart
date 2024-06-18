import 'dart:ui';

import 'package:json_annotation/json_annotation.dart';

part 'group.g.dart';

@JsonSerializable()
class Group {
  String groupId; // unique, e.g group-458457648576486
  String label; // default/user defined 'Mythic GME', must be unique
  List<String>? controls = []; // controls by id in order, alpha by default?
  bool? isExpanded = true; // true
  bool? isActive = true; // true
  bool? isAppGroup = false; // Can't be deleted
  // Color? colour; // default
  List<String>?
      presetOrder; // used for Mythic Fate Chart. Can't reorder if exists.

  Group({
    required this.groupId,
    required this.label,
    controls,
    isExpanded,
    isAppGroup,
    // this.colour,
    presetOrder,
  });

  // coverage:ignore-start

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);

  Map<String, dynamic> toJson() => _$GroupToJson(this);
// coverage:ignore-end
}
