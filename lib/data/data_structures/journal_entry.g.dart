// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journal_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JournalEntry _$JournalEntryFromJson(Map<String, dynamic> json) => JournalEntry(
      type: json['type'] as String,
      line1: json['line1'] as String?,
      line2: json['line2'] as String?,
      result: json['result'] as String,
    );

Map<String, dynamic> _$JournalEntryToJson(JournalEntry instance) =>
    <String, dynamic>{
      'type': instance.type,
      'line1': instance.line1,
      'line2': instance.line2,
      'result': instance.result,
    };
