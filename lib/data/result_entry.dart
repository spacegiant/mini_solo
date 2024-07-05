import 'package:json_annotation/json_annotation.dart';
import 'package:mini_solo/data/result_entries.dart';

import '../utilities/id_generator.dart';

part 'result_entry.g.dart';

@JsonSerializable()
class ResultEntry {
  final ResultEntryTypes type;
  // TODO can we remove the initialiser here?
  late String id = genericId(resultEntryTypeLabel[type]!.identifier);
  final String title;

  ResultEntry({
    required this.type,
    required this.title,
  }) {
    _initID();
  }

  void _initID() {
    id = genericId(resultEntryTypeLabel[type]!.identifier);
  }

  // coverage:ignore-start
  factory ResultEntry.fromJson(Map<String, dynamic> json) =>
      _$ResultEntryFromJson(json);

  Map<String, dynamic> toJson() => _$ResultEntryToJson(this);
// coverage:ignore-end
}
