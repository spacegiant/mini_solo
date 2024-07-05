// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultEntry _$ResultEntryFromJson(Map<String, dynamic> json) => ResultEntry(
      type: $enumDecode(_$ResultEntryTypesEnumMap, json['type']),
      title: json['title'] as String,
    )..id = json['id'] as String;

Map<String, dynamic> _$ResultEntryToJson(ResultEntry instance) =>
    <String, dynamic>{
      'type': _$ResultEntryTypesEnumMap[instance.type]!,
      'id': instance.id,
      'title': instance.title,
    };

const _$ResultEntryTypesEnumMap = {
  ResultEntryTypes.label: 'label',
  ResultEntryTypes.randomTable: 'randomTable',
  ResultEntryTypes.actionList: 'actionList',
};
