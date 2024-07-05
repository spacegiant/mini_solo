// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_entries.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultTypeData _$ResultTypeDataFromJson(Map<String, dynamic> json) =>
    ResultTypeData(
      identifier: json['identifier'] as String,
      label: json['label'] as String,
    );

Map<String, dynamic> _$ResultTypeDataToJson(ResultTypeData instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'label': instance.label,
    };

ResultEntries _$ResultEntriesFromJson(Map<String, dynamic> json) =>
    ResultEntries(
      title: json['title'] as String,
      list: (json['list'] as List<dynamic>)
          .map((e) => ResultEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..id = json['id'] as String;

Map<String, dynamic> _$ResultEntriesToJson(ResultEntries instance) =>
    <String, dynamic>{
      'list': instance.list,
      'title': instance.title,
      'id': instance.id,
    };
