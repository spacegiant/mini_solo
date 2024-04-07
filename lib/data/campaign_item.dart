import '../utilities/id_generator.dart';
import 'campaign_data.dart';

abstract class CampaignItem {
  bool? isFavourite = false;
  JournalEntryTypes type;
  late String id = idGenerator(type);

  CampaignItem({
    this.isFavourite,
    required this.type,
    required this.id,
  });
}
