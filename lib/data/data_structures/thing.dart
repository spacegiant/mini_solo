import 'package:json_annotation/json_annotation.dart';
import 'package:mini_solo/data/data_structures/person.dart';

import '../campaign_item.dart';
import '../journal_entry_types.dart';

part 'thing.g.dart';

@JsonSerializable()
class Thing extends CampaignItem {
  String name;
  Person? owner;
  String? detail;

  Thing({
    required super.isFavourite,
    required this.name,
    this.owner,
    this.detail,
  });

  @override
  JournalEntryTypes type = JournalEntryTypes.newThing;

  // coverage:ignore-start
  factory Thing.fromJson(Map<String, dynamic> json) => _$ThingFromJson(json);

  Map<String, dynamic> toJson() => _$ThingToJson(this);
// coverage:ignore-end
}
