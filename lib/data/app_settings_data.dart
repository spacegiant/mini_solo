import 'package:json_annotation/json_annotation.dart';

import 'campaign_data.dart';
import 'campaign_item.dart';

part 'app_settings_data.g.dart';

AppSettingsData initAppSettingsData() {
  return AppSettingsData(
    currentCampaign: '',
    randomTables: [],
  );
}

@JsonSerializable(explicitToJson: true)
class AppSettingsData {
  late String currentCampaign;
  late List<RandomTableEntry> randomTables;

  AppSettingsData({
    required this.currentCampaign,
    required this.randomTables,
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
  // TODO: Convert to list of strings
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
  // TODO: Rename title to label
  final String title;
  final int? chance;
  final String? otherRandomTable;

  RandomTableRow({
    required this.title,
    this.chance,
    this.otherRandomTable,
  });

  // coverage:ignore-start
  factory RandomTableRow.fromJson(Map<String, dynamic> json) =>
      _$RandomTableRowFromJson(json);

  Map<String, dynamic> toJson() => _$RandomTableRowToJson(this);

// coverage:ignore-end
}
