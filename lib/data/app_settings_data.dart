import 'package:json_annotation/json_annotation.dart';

import 'campaign_data.dart';
import 'campaign_item.dart';

part 'app_settings_data.g.dart';

AppSettingsData initAppSettingsData() {
  return AppSettingsData(
    currentCampaign: '',
    randomTables: [],
    expandedList: [],
    actionList: [],
  );
}

@JsonSerializable(explicitToJson: true)
class AppSettingsData {
  late String currentCampaign;
  // TODO: Rename to RandomTables?
  late List<RandomTableEntry> randomTables;
  late List<String> expandedList;
  late List<ActionListEntry> actionList;

  AppSettingsData({
    required this.currentCampaign,
    required this.randomTables,
    required this.expandedList,
    required this.actionList,
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
  late bool isRandomTable;
  late bool isHidden;

  RandomTableEntry({
    required super.isFavourite,
    required this.title,
    required this.rows,
    this.isRandomTable = true,
    this.isHidden = false,
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
  late String label;
  late int? weight;
  late String? otherRandomTable;

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
class RollTableResults extends CampaignItem {
  final String title;
  final List<RollTableResult> results;

  RollTableResults({
    required this.title,
    required this.results,
  });

  // coverage:ignore-start
  factory RollTableResults.fromJson(Map<String, dynamic> json) =>
      _$RollTableResultsFromJson(json);

  Map<String, dynamic> toJson() => _$RollTableResultsToJson(this);

// coverage:ignore-end

  @override
  JournalEntryTypes type = JournalEntryTypes.rollTableResults;
}

@JsonSerializable(explicitToJson: true)
class RollTableResult {
  final String title;
  final int? randomRoll;
  final String resultString;
  final int? totalEntries;
  final int? weight;

  RollTableResult({
    required this.weight,
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

// coverage:ignore-end
}

@JsonSerializable(explicitToJson: true)
class ActionListEntry extends CampaignItem {
  final String title;
  final List<ActionRow> list;
  final bool isActive;
  final bool isHidden;

  ActionListEntry({
    required this.title,
    required this.list,
    required this.isActive,
    required this.isHidden,
  });

  // coverage:ignore-start
  factory ActionListEntry.fromJson(Map<String, dynamic> json) =>
      _$ActionListEntryFromJson(json);

  Map<String, dynamic> toJson() => _$ActionListEntryToJson(this);

  @override
  JournalEntryTypes type = JournalEntryTypes.randomTable;
// coverage:ignore-end
}

@JsonSerializable(explicitToJson: true)
class ActionRow {
  late String label;
  late String? otherEntryId;

  ActionRow({
    required this.label,
    this.otherEntryId,
  });

  // coverage:ignore-start
  factory ActionRow.fromJson(Map<String, dynamic> json) =>
      _$ActionRowFromJson(json);

  Map<String, dynamic> toJson() => _$ActionRowToJson(this);

// coverage:ignore-end
}
