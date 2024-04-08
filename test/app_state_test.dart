import 'package:mini_solo/data/app_state.dart';
import 'package:mini_solo/data/campaign_data.dart';
import 'package:test/test.dart';
import 'package:flutter/cupertino.dart';

void main() {
  group('Test AppState', () {
    test('Init campaign data', () {
      final data = AppState();
      CampaignData campaignData = initCampaignDataData('test campaign name');
      data.setCampaignData(campaignData);
      expect(data.campaignData?.name, 'test campaign name');
      expect(data.campaignData?.mythic.chaosFactor, 5);
    });

    test('get showFutureFeatures returns bool', () {
      final data = AppState();
      CampaignData campaignData = initCampaignDataData('test campaign name');
      data.setCampaignData(campaignData);
      expect(data.campaignData?.settings.general.showFutureSettings, false);
    });

    test('toggleShowFutureFeatures toggles bool', () {
      final data = AppState();
      CampaignData campaignData = initCampaignDataData('test campaign name');
      data.setCampaignData(campaignData);
      data.toggleShowFutureFeatures();
      expect(data.campaignData?.settings.general.showFutureSettings, true);
    });

    // test('setSaveCallback stores a callback that is run on saving data', () {
    //   final data = AppState();
    //   CampaignData campaignData = initCampaignDataData('test campaign name');
    //   data.setSaveCallback();
    // });
  });
}
