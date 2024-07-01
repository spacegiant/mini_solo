import 'package:json_annotation/json_annotation.dart';

part 'group.g.dart';

enum SortBy { manual, aToZ, zToA }

@JsonSerializable()
class Group {
  String groupId; // unique, e.g group-458457648576486
  String label; // default/user defined 'Mythic GME', must be unique
  List<String> controls = []; // controls by id in order, alpha by default?
  bool? isExpanded = true; // true
  bool? isAppGroup = false; // Can't be deleted
  bool isActive = true; // true
  bool? isWrapped = false;
  int? color; // default
  List<String>?
      presetOrder; // used for Mythic Fate Chart. Can't reorder if exists.
  SortBy? sortBy = SortBy.aToZ;

  Group({
    required this.groupId,
    required this.label,
    required this.controls,
    this.isAppGroup,
    this.isExpanded,
    this.isWrapped,
    this.color,
    this.presetOrder,
    this.sortBy,
  });

  // coverage:ignore-start

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);

  Map<String, dynamic> toJson() => _$GroupToJson(this);
// coverage:ignore-end
}
