import 'package:json_annotation/json_annotation.dart';
import 'group.dart';

part 'groups.g.dart';

// TODO: Is this needed?
@JsonSerializable(explicitToJson: true)
class Groups {
  List<Group> groups;

  Groups({
    required this.groups,
  });

  // coverage:ignore-start
  factory Groups.fromJson(Map<String, dynamic> json) => _$GroupsFromJson(json);

  Map<String, dynamic> toJson() => _$GroupsToJson(this);
// coverage:ignore-end
}
