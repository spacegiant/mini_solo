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
  String title;

  RandomTableEntry({
    required super.isFavourite,
    required this.title,
  });
// coverage:ignore-start
  factory RandomTableEntry.fromJson(Map<String, dynamic> json) =>
      _$RandomTableEntryFromJson(json);

  Map<String, dynamic> toJson() => _$RandomTableEntryToJson(this);

  @override
  JournalEntryTypes type = JournalEntryTypes.randomTable;
// coverage:ignore-end
}
