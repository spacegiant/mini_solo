import 'package:json_annotation/json_annotation.dart';

import 'campaign_item.dart';
import 'campaign_data.dart';

part 'generic_entry_item.g.dart';

@JsonSerializable(explicitToJson: true)
class GenericEntryItem extends CampaignItem {
  String? label;
  String title;
  String? detail;

  GenericEntryItem({
    required super.isFavourite,
    required super.type,
    required this.title,
    this.label,
    this.detail,
  });

  factory GenericEntryItem.fromJson(Map<String, dynamic> json) =>
      _$GenericEntryItemFromJson(json);

  Map<String, dynamic> toJson() => _$GenericEntryItemToJson(this);
}
