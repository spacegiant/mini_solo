import 'package:mini_solo/data/app_state.dart';
import 'package:mini_solo/data/campaign_data.dart';
import 'package:mini_solo/utilities/mock_callback.dart';
import 'package:test/test.dart';

void main() {
  test('Init campaign data', () {
    final data = AppState();
    CampaignData campaignData = initCampaignDataData('test campaign name');
    data.setCampaignData(campaignData);
    expect(data.campaignData?.name, 'test campaign name');
    expect(data.campaignData?.mythic.chaosFactor, 5);
  });

  group('SaveCallback', () {
    test('saveCallbackExists', () {
      final data = AppState();
      CampaignData campaignData = initCampaignDataData('test campaign name');
      data.setCampaignData(campaignData);

      expect(data.saveCallbackExists, isFalse);
      data.setSaveCallback((data) {});
      expect(data.saveCallbackExists, isTrue);
    });

    test('setSaveCallback is called with saveCampaignDataToDisk', () {
      MockCallback mock = MockCallback();
      final data = AppState();
      CampaignData campaignData = initCampaignDataData('test campaign name');
      data.setCampaignData(campaignData);
      data.setSaveCallback((data) {
        mock.call();
      });
      data.saveCampaignDataToDisk();
      expect(mock.called(1), isTrue);
    });
  });

  group('General settings', () {
    test('getter currentCampaign returns expected String', () {
      final data = AppState();
      CampaignData campaignData = initCampaignDataData('test campaign name');
      data.setCampaignData(campaignData);
      expect(data.currentCampaign, 'test campaign name');
    });

    test('setCurrentCampaign sets the campaign name String', () {
      final data = AppState();
      CampaignData campaignData = initCampaignDataData('first');
      data.setCampaignData(campaignData);
      expect(data.currentCampaign, 'first');
      data.setCurrentCampaign('second');
      expect(data.currentCampaign, 'second');
    });

    test('get showFutureFeatures returns bool', () {
      final data = AppState();
      CampaignData campaignData = initCampaignDataData('test campaign name');
      data.setCampaignData(campaignData);
      expect(data.showFutureFeatures, isFalse);
    });

    test('get showFutureFeatures returns bool', () {
      final data = AppState();
      CampaignData campaignData = initCampaignDataData('test campaign name');
      data.setCampaignData(campaignData);
      // MAKE THIS PRIVATE
      expect(data.showFutureFeatures, isFalse);
    });

    test('toggleShowFutureFeatures toggles bool', () {
      final data = AppState();
      CampaignData campaignData = initCampaignDataData('test campaign name');
      data.setCampaignData(campaignData);
      data.toggleShowFutureFeatures();
      expect(data.campaignData?.settings.general.showFutureSettings, isTrue);
    });
  });

  group('Chaos Factor', () {
    test('getter chaosFactor returns value', () {
      final data = AppState();
      CampaignData campaignData = initCampaignDataData('test campaign name');
      data.setCampaignData(campaignData);

      expect(data.chaosFactor, 5);
    });

    test('increaseChaosFactor increases CF', () {
      final data = AppState();
      CampaignData campaignData = initCampaignDataData('test campaign name');
      data.setCampaignData(campaignData);

      data.increaseChaosFactor();

      expect(data.chaosFactor, 6);
    });

    test('decreaseChaosFactor decreases CF', () {
      final data = AppState();
      CampaignData campaignData = initCampaignDataData('test campaign name');
      data.setCampaignData(campaignData);

      data.decreaseChaosFactor();

      expect(data.chaosFactor, 4);
    });

    test('resetChaosFactor resets CF', () {
      final data = AppState();
      CampaignData campaignData = initCampaignDataData('test campaign name');
      data.setCampaignData(campaignData);

      data.decreaseChaosFactor();
      data.decreaseChaosFactor();
      data.decreaseChaosFactor();
      expect(data.chaosFactor, 2);
      data.resetChaosFactor();
      expect(data.chaosFactor, 5);
    });
  });
}
