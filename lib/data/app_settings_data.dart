import 'package:json_annotation/json_annotation.dart';

import '../features/action_lists/add_action_list_popup.dart';
import 'campaign_item.dart';
import 'journal_entry_types.dart';

part 'app_settings_data.g.dart';

AppSettingsData initAppSettingsData() {
  return AppSettingsData(
    currentCampaign: '',
    randomTables: [],
    expandedList: [],
    actionLists: [],
  );
}

@JsonSerializable(explicitToJson: true)
class AppSettingsData {
  late String currentCampaign;
  late List<RandomTable> randomTables;
  late List<String> expandedList;
  late List<ActionListEntry> actionLists;

  AppSettingsData({
    required this.currentCampaign,
    required this.randomTables,
    required this.expandedList,
    required this.actionLists,
  });

  // coverage:ignore-start
  factory AppSettingsData.fromJson(Map<String, dynamic> json) =>
      _$AppSettingsDataFromJson(json);

  Map<String, dynamic> toJson() => _$AppSettingsDataToJson(this);
// coverage:ignore-end
}

@JsonSerializable(explicitToJson: true)
class RandomTable extends CampaignItem {
  final String title;
  final List<RandomTableRow> rows;
  late bool isHidden;
  bool? showLinkOptions;

  RandomTable({
    required super.isFavourite,
    required this.title,
    required this.rows,
    this.isHidden = false,
    this.showLinkOptions = false,
  });
// coverage:ignore-start
  factory RandomTable.fromJson(Map<String, dynamic> json) =>
      _$RandomTableFromJson(json);

  Map<String, dynamic> toJson() => _$RandomTableToJson(this);

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
  late String title;
  late List<ActionRow> list;
  late bool isActive;
  late bool isHidden;

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
  JournalEntryTypes type = JournalEntryTypes.actionList;
// coverage:ignore-end
}

@JsonSerializable(explicitToJson: true)
class ActionRow {
  late ActionEditorType type;
  late String string;

  ActionRow({
    required this.type,
    required this.string,
  });

  // coverage:ignore-start
  factory ActionRow.fromJson(Map<String, dynamic> json) =>
      _$ActionRowFromJson(json);

  Map<String, dynamic> toJson() => _$ActionRowToJson(this);

// coverage:ignore-end
}
