import 'package:json_annotation/json_annotation.dart';

import 'campaign_data.dart';
import 'campaign_item.dart';

part 'app_settings_data.g.dart';

AppSettingsData initAppSettingsData() {
  return AppSettingsData(
    currentCampaign: '',
    randomTables: [],
    expandedList: [],
    groups: [],
  );
}

@JsonSerializable(explicitToJson: true)
class AppSettingsData {
  late String currentCampaign;
  late List<RandomTableEntry> randomTables;
  late List<String> expandedList;
  late List<String> groups;

  AppSettingsData({
    required this.currentCampaign,
    required this.randomTables,
    required this.expandedList,
    required this.groups,
  });

  // coverage:ignore-start
  factory AppSettingsData.fromJson(Map<String, dynamic> json) =>
      _$AppSettingsDataFromJson(json);

  Map<String, dynamic> toJson() => _$AppSettingsDataToJson(this);
// coverage:ignore-end
}

@JsonSerializable(explicitToJson: true)
class RandomTableEntry extends CampaignItem {
  final String title;
  final List<RandomTableRow> rows;

  RandomTableEntry({
    required super.isFavourite,
    required this.title,
    required this.rows,
  });
// coverage:ignore-start
  factory RandomTableEntry.fromJson(Map<String, dynamic> json) =>
      _$RandomTableEntryFromJson(json);

  Map<String, dynamic> toJson() => _$RandomTableEntryToJson(this);

  @override
  JournalEntryTypes type = JournalEntryTypes.randomTable;
// coverage:ignore-end
}

@JsonSerializable(explicitToJson: true)
class RandomTableRow {
  final String label;
  final int? weight;
  final String? otherRandomTable;

  RandomTableRow({
    required this.label,
    this.weight,
    this.otherRandomTable,
  });

  // coverage:ignore-start
  factory RandomTableRow.fromJson(Map<String, dynamic> json) =>
      _$RandomTableRowFromJson(json);

  Map<String, dynamic> toJson() => _$RandomTableRowToJson(this);

// coverage:ignore-end
}

@JsonSerializable(explicitToJson: true)
class RollTableResult extends CampaignItem {
  final String title;
  final int randomRoll;
  final String resultString;
  final int totalEntries;
  // final int lowerBounds;
  // final int upperBounds;
  final int weight;

  RollTableResult({
    required this.weight,
    required super.isFavourite,
    required this.title,
    required this.randomRoll,
    required this.resultString,
    required this.totalEntries,
    // required this.lowerBounds,
    // required this.upperBounds,
  });

  // coverage:ignore-start
  factory RollTableResult.fromJson(Map<String, dynamic> json) =>
      _$RollTableResultFromJson(json);

  Map<String, dynamic> toJson() => _$RollTableResultToJson(this);

  @override
  JournalEntryTypes type = JournalEntryTypes.rollTableResult;

// coverage:ignore-end
}
