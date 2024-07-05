import '../utilities/id_generator.dart';

enum ResultEntryTypes {
  label,
  randomTable,
  actionList,
}

class ResultTypeData {
  final String identifier;
  final String label;

  ResultTypeData({
    required this.identifier,
    required this.label,
  });
}

Map<ResultEntryTypes, ResultTypeData> resultEntryTypeLabel = {
  ResultEntryTypes.label:
      ResultTypeData(identifier: 'label-result', label: 'Label Result'),
  ResultEntryTypes.randomTable: ResultTypeData(
      identifier: 'random-table-result', label: 'Random Table Result'),
  ResultEntryTypes.actionList: ResultTypeData(
      identifier: 'action-list-result', label: 'Action List Result'),
};

abstract class ResultEntry {
  abstract ResultEntryTypes type;
  late String id = genericId(resultEntryTypeLabel[type]!.identifier);
  late String title;

  ResultEntry({
    required this.title,
  });
}

class LabelResultEntry extends ResultEntry {
  @override
  ResultEntryTypes type = ResultEntryTypes.label;

  LabelResultEntry({required super.title});
}

class RandomTableResultEntry extends ResultEntry {
  @override
  ResultEntryTypes type = ResultEntryTypes.randomTable;

  RandomTableResultEntry({required super.title});
}

class ActionListResultEntry extends ResultEntry {
  @override
  ResultEntryTypes type = ResultEntryTypes.actionList;

  ActionListResultEntry({required super.title});
}

class ResultEntries {
  final List<ResultEntry> list;

  ResultEntries({
    required this.list,
  });
}

ResultEntries entries = ResultEntries(
  list: [
    LabelResultEntry(title: ''),
    RandomTableResultEntry(title: ''),
    ActionListResultEntry(title: ''),
  ],
);
