import 'package:mini_solo/data/campaign_data.dart';
import 'package:mini_solo/data/campaign_item.dart';
import 'package:test/test.dart';

class MyClass extends CampaignItem {
  MyClass({required super.type});

  String get superId => super.id;
}

void main() {
  test('id is set with generated id', () {
    MyClass campaignItem = MyClass(
      type: JournalEntryTypes.dialogue,
    );

    List<String> parts = campaignItem.superId.split('-');

    expect(parts[0], 'dialogue');
    expect(parts[1].length, 16);
  });
}
