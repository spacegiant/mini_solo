import 'dart:convert';

import 'package:mini_solo/data/campaign_data.dart';
import 'package:mini_solo/utilities/fix_json_data.dart';
import 'package:test/test.dart';

CampaignData initialCampaignData = baseCampaignData('test');
final initialDecodedData = convertCampaignToJSON(initialCampaignData);
const String jsonString = '{"name": "floop"}';
final testData = json.decode(jsonString);

void main() {
  test('fixJSONData', () {
    var fixedData = fixJSONData(initialDecodedData, testData);

    expect(fixedData['name'], 'floop');
    expect(fixedData['journal'], []);
  });
}
