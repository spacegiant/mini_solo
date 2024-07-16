import 'package:json_annotation/json_annotation.dart';

import '../campaign_data.dart';
import '../campaign_item.dart';
import '../journal_entry_types.dart';
import 'journal_entry.dart';

part 'oracle_entry.g.dart';

@JsonSerializable()
class OracleEntry extends CampaignItem {
  JournalEntry lines;
  String label;

  OracleEntry({
    required super.isFavourite,
    required this.lines,
    required this.label,
  });
// coverage:ignore-start
  factory OracleEntry.fromJson(Map<String, dynamic> json) =>
      _$OracleEntryFromJson(json);

  Map<String, dynamic> toJson() => _$OracleEntryToJson(this);

  @override
  JournalEntryTypes type = JournalEntryTypes.oracle;
// coverage:ignore-end
}
