// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'label.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Label _$LabelFromJson(Map<String, dynamic> json) => Label(
      labelId: json['labelId'] as String,
      title: json['title'] as String,
      lines:
          (json['lines'] as List<dynamic>?)?.map((e) => e as String).toList(),
      labelLayout:
          $enumDecodeNullable(_$LabelLayoutEnumMap, json['labelLayout']),
    );

Map<String, dynamic> _$LabelToJson(Label instance) => <String, dynamic>{
      'labelId': instance.labelId,
      'title': instance.title,
      'lines': instance.lines,
      'labelLayout': _$LabelLayoutEnumMap[instance.labelLayout],
    };

const _$LabelLayoutEnumMap = {
  LabelLayout.vertical: 'vertical',
  LabelLayout.horizontal: 'horizontal',
};
