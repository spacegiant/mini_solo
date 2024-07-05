import 'package:json_annotation/json_annotation.dart';
import 'package:mini_solo/data/result_entry.dart';

import '../utilities/id_generator.dart';

part 'result_entries.g.dart';

enum ResultEntryTypes {
  label,
  randomTable,
  // TODO: Is this needed?
  actionList,
}

@JsonSerializable()
class ResultTypeData {
  final String identifier;
  final String label;

  ResultTypeData({
    required this.identifier,
    required this.label,
  });

  // coverage:ignore-start
  factory ResultTypeData.fromJson(Map<String, dynamic> json) =>
      _$ResultTypeDataFromJson(json);

  Map<String, dynamic> toJson() => _$ResultTypeDataToJson(this);
// coverage:ignore-end
}

Map<ResultEntryTypes, ResultTypeData> resultEntryTypeLabel = {
  ResultEntryTypes.label:
      ResultTypeData(identifier: 'label-result', label: 'Label Result'),
  ResultEntryTypes.randomTable: ResultTypeData(
      identifier: 'random-table-result', label: 'Random Table Result'),
  ResultEntryTypes.actionList: ResultTypeData(
      identifier: 'action-list-result', label: 'Action List Result'),
};

@JsonSerializable()
class ResultEntries {
  final List<ResultEntry> list;
  final String title;
  late String id;

  ResultEntries({required this.title, required this.list}) {
    _initID();
  }

  void _initID() {
    id = genericId('result-entries');
  }

  // coverage:ignore-start
  factory ResultEntries.fromJson(Map<String, dynamic> json) =>
      _$ResultEntriesFromJson(json);

  Map<String, dynamic> toJson() => _$ResultEntriesToJson(this);
// coverage:ignore-end
}

ResultEntries entries = ResultEntries(
    list: [ResultEntry(type: ResultEntryTypes.actionList, title: 'title')],
    title: '');
