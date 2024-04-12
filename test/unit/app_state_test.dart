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
    expect(data.campaignData?.mythicData.chaosFactor, 5);
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

  group('Popup', () {
    test('getter popupLabel returns enum', () {
      final data = AppState();
      CampaignData campaignData = initCampaignDataData('test campaign name');
      data.setCampaignData(campaignData);

      expect(data.popupLabel, PopupLabels.chaos);
    });

    test('setPopupLabel sets the label', () {
      final data = AppState();
      CampaignData campaignData = initCampaignDataData('test campaign name');
      data.setCampaignData(campaignData);

      expect(data.popupLabel, PopupLabels.chaos);
      // data.setPopupLabel(PopupLabels.exploration);
      expect(data.popupLabel, PopupLabels.exploration);
    });

    test('getter showPopup returns bool', () {
      final data = AppState();
      CampaignData campaignData = initCampaignDataData('test campaign name');
      data.setCampaignData(campaignData);

      expect(data.showPopup, isFalse);
    });

    test('setter toggleShowPopup toggles bool', () {
      final data = AppState();
      CampaignData campaignData = initCampaignDataData('test campaign name');
      data.setCampaignData(campaignData);

      data.toggleShowPopup(PopupLabels.chaos);
      expect(data.showPopup, isTrue);
    });

    test('setter closePopup sets to false', () {
      final data = AppState();
      CampaignData campaignData = initCampaignDataData('test campaign name');
      data.setCampaignData(campaignData);

      expect(data.showPopup, isFalse);
      data.closePopup();
      expect(data.showPopup, isFalse);
      data.toggleShowPopup(PopupLabels.chaos);
      expect(data.showPopup, isTrue);
      data.closePopup();
      expect(data.showPopup, isFalse);
    });
  });

  group('ShowSettings', () {
    test('get showSettings returns bool', () {
      final data = AppState();
      CampaignData campaignData = initCampaignDataData('test campaign name');
      data.setCampaignData(campaignData);
      expect(data.showSettings, isFalse);
    });

    test('setter toggleShowSettings toggles bool', () {
      final data = AppState();
      CampaignData campaignData = initCampaignDataData('test campaign name');
      data.setCampaignData(campaignData);
      data.toggleShowSettings();
      expect(data.showSettings, isTrue);
    });
  });

  group('Use Journal', () {
    test('getter useJournal returns a bool', () {
      final data = AppState();
      CampaignData campaignData = initCampaignDataData('test campaign name');
      data.setCampaignData(campaignData);
      expect(data.useJournal, isTrue);
    });

    test('setting toggleUseJournal toggles bool', () {
      final data = AppState();
      CampaignData campaignData = initCampaignDataData('test campaign name');
      data.setCampaignData(campaignData);
      expect(data.useJournal, isTrue);
      data.toggleUseJournal();
      expect(data.useJournal, isFalse);
    });
  });

  group('Use Zocchi Dice', () {
    test('getter useZocchiDice returns a bool', () {
      final data = AppState();
      CampaignData campaignData = initCampaignDataData('test campaign name');
      data.setCampaignData(campaignData);
      expect(data.useZocchiDice, isFalse);
    });

    test('getter toggleUseZocchiDice toggles a bool', () {
      final data = AppState();
      CampaignData campaignData = initCampaignDataData('test campaign name');
      data.setCampaignData(campaignData);
      expect(data.useZocchiDice, isFalse);
      data.toggleUseZocchiDice();
      expect(data.useZocchiDice, isTrue);
    });
  });

  test('Adding Person creates a person record and a journal record', () {
    Person person = Person(
      isFavourite: false,
      firstName: 'Scooch',
      familyName: 'Adams',
    );

    final data = AppState();
    CampaignData campaignData = initCampaignDataData('test campaign name');
    data.setCampaignData(campaignData);
    expect(data.campaignData?.people.contains(person), isFalse);

    data.addPerson(person);
    expect(data.campaignData?.people.contains(person), isTrue);

    expect(
        data.campaignData?.journal
            .where((element) => element.id == person.id)
            .length,
        equals(1));
  });

  test('Adding Place creates a person record and a journal record', () {
    Place place = Place(
      isFavourite: false,
      name: 'Place name goes here',
    );

    final data = AppState();
    CampaignData campaignData = initCampaignDataData('test campaign name');
    data.setCampaignData(campaignData);
    expect(data.campaignData?.places.contains(place), isFalse);

    data.addPlace(place);
    expect(data.campaignData?.places.contains(place), isTrue);

    expect(
        data.campaignData?.journal
            .where((element) => element.id == place.id)
            .length,
        equals(1));
  });

  test('Adding Thing creates a person record and a journal record', () {
    Thing thing = Thing(
      isFavourite: false,
      name: 'Title of thing',
    );

    final data = AppState();
    CampaignData campaignData = initCampaignDataData('test campaign name');
    data.setCampaignData(campaignData);

    expect(data.campaignData?.things.contains(thing), isFalse);
    data.addThing(thing);
    expect(data.campaignData?.things.contains(thing), isTrue);
    expect(
        data.campaignData?.journal
            .where((element) => element.id == thing.id)
            .length,
        equals(1));
  });

  test('Adding Faction creates a person record and a journal record', () {
    Faction faction = Faction(
      isFavourite: false,
      name: 'Title of faction',
    );

    final data = AppState();
    CampaignData campaignData = initCampaignDataData('test campaign name');
    data.setCampaignData(campaignData);

    expect(data.campaignData?.factions.contains(faction), isFalse);
    data.addFaction(faction);
    expect(data.campaignData?.factions.contains(faction), isTrue);
    expect(
        data.campaignData?.journal
            .where((element) => element.id == faction.id)
            .length,
        equals(1));
  });

  test('Adding Clue creates a person record and a journal record', () {
    Clue clue = Clue(
      isFavourite: false,
      description: 'Clue description',
    );

    final data = AppState();
    CampaignData campaignData = initCampaignDataData('test campaign name');
    data.setCampaignData(campaignData);

    expect(data.campaignData?.clues.contains(clue), isFalse);
    data.addClue(clue);
    expect(data.campaignData?.clues.contains(clue), isTrue);
    expect(
        data.campaignData?.journal
            .where((element) => element.id == clue.id)
            .length,
        equals(1));
  });

  test('Adding Creature creates a person record and a journal record', () {
    Creature creature = Creature(
      isFavourite: false,
      title: 'Creature title',
    );

    final data = AppState();
    CampaignData campaignData = initCampaignDataData('test campaign name');
    data.setCampaignData(campaignData);

    expect(data.campaignData?.creatures.contains(creature), isFalse);
    data.addCreature(creature);
    expect(data.campaignData?.creatures.contains(creature), isTrue);
    expect(
        data.campaignData?.journal
            .where((element) => element.id == creature.id)
            .length,
        equals(1));
  });

  test('Adding Roll creates a person record and a journal record', () {
    Roll roll = Roll(
      isFavourite: false,
      result: 6,
      diceType: 'd6',
    );

    final data = AppState();
    CampaignData campaignData = initCampaignDataData('test campaign name');
    data.setCampaignData(campaignData);

    expect(data.campaignData?.rolls.contains(roll), isFalse);
    data.addRoll(roll);
    expect(data.campaignData?.rolls.contains(roll), isTrue);
    expect(
        data.campaignData?.journal
            .where((element) => element.id == roll.id)
            .length,
        equals(1));
  });
}
