// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Group _$GroupFromJson(Map<String, dynamic> json) => Group(
      groupId: json['groupId'] as String,
      label: json['label'] as String,
      controls: json['controls'],
      isExpanded: json['isExpanded'],
      isAppGroup: json['isAppGroup'],
      presetOrder: json['presetOrder'],
      sortBy: json['sortBy'],
    )..isActive = json['isActive'] as bool?;

Map<String, dynamic> _$GroupToJson(Group instance) => <String, dynamic>{
      'groupId': instance.groupId,
      'label': instance.label,
      'controls': instance.controls,
      'isExpanded': instance.isExpanded,
      'isActive': instance.isActive,
      'isAppGroup': instance.isAppGroup,
      'presetOrder': instance.presetOrder,
      'sortBy': _$SortByEnumMap[instance.sortBy]!,
    };

const _$SortByEnumMap = {
  SortBy.manual: 'manual',
  SortBy.aToZ: 'aToZ',
  SortBy.zToA: 'zToA',
};
