import 'package:json_annotation/json_annotation.dart';

import '../campaign_item.dart';
import '../journal_entry_types.dart';

part 'scratch_page_entry_item.g.dart';

@JsonSerializable()
class ScratchPageEntryItem extends CampaignItem {
  String title;
  String text;
  DateTime dateCreated;

  ScratchPageEntryItem({
    required super.isFavourite,
    required this.title,
    required this.text,
    required this.dateCreated,
  });
// coverage:ignore-start
  factory ScratchPageEntryItem.fromJson(Map<String, dynamic> json) =>
      _$ScratchPageEntryItemFromJson(json);

  Map<String, dynamic> toJson() => _$ScratchPageEntryItemToJson(this);

  @override
  JournalEntryTypes type = JournalEntryTypes.scratchPage;
// coverage:ignore-end
}
