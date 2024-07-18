// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Group _$GroupFromJson(Map<String, dynamic> json) => Group(
      groupId: json['groupId'] as String,
      label: json['label'] as String,
      controlsIDs:
          (json['controls'] as List<dynamic>).map((e) => e as String).toList(),
      isAppGroup: json['isAppGroup'] as bool?,
      isExpanded: json['isExpanded'] as bool?,
      isWrapped: json['isWrapped'] as bool?,
      color: (json['color'] as num?)?.toInt(),
      presetOrder: (json['presetOrder'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      sortBy: $enumDecodeNullable(_$SortByEnumMap, json['sortBy']),
    )..isActive = json['isActive'] as bool;

Map<String, dynamic> _$GroupToJson(Group instance) => <String, dynamic>{
      'groupId': instance.groupId,
      'label': instance.label,
      'controls': instance.controlsIDs,
      'isExpanded': instance.isExpanded,
      'isAppGroup': instance.isAppGroup,
      'isActive': instance.isActive,
      'isWrapped': instance.isWrapped,
      'color': instance.color,
      'presetOrder': instance.presetOrder,
      'sortBy': _$SortByEnumMap[instance.sortBy],
    };

const _$SortByEnumMap = {
  SortBy.manual: 'manual',
  SortBy.aToZ: 'aToZ',
  SortBy.zToA: 'zToA',
};
