import '../utilities/id_generator.dart';
import 'journal_entry_types.dart';

abstract class CampaignItem {
  bool? isFavourite = false;
  abstract JournalEntryTypes type;
  late String id = idGenerator(type);

  CampaignItem({
    this.isFavourite,
  }) {
    _initID();
  }

  void _initID() {
    id = idGenerator(type);
  }
}
