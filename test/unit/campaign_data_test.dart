import 'package:mini_solo/data/campaign_data.dart';
import 'package:mini_solo/views/journal/chooseControlWidget.dart';
import 'package:test/test.dart';

void main() {
  test('CampaignData', () {
    CampaignData campaignData = baseCampaignData('test campaign');
    expect(campaignData.runtimeType, CampaignData);
    expect(campaignData.name, 'test campaign');
  });

  test('Scratch', () {
    ScratchPageEntryItem scratchPageEntryItem = ScratchPageEntryItem(
      isFavourite: true,
      title: 'scratch title',
      text: 'scratch test',
      dateCreated: DateTime.now(),
    );
    expect(scratchPageEntryItem.isFavourite, true);
    expect(scratchPageEntryItem.title, 'scratch title');
    expect(scratchPageEntryItem.text, 'scratch test');
    expect(scratchPageEntryItem.dateCreated.runtimeType, DateTime);
    List<String> parts = scratchPageEntryItem.id.split('-');

    expect(parts[0], 'scratchPage');
    expect(parts[1].length, 16);
  });

  test('Tracker Entry', () {
    TrackerEntry trackerEntry = TrackerEntry(
      label: 'tracker entry test',
      minValue: 5,
      currentValue: 11,
      maxValue: 20,
      controlType: ControlTypeEnum.bar,
    );
    expect(trackerEntry.label, 'tracker entry test');
    expect(trackerEntry.minValue, 5);
    expect(trackerEntry.currentValue, 11);
    expect(trackerEntry.maxValue, 20);
    expect(trackerEntry.controlType, ControlTypeEnum.bar);

    List<String> parts = trackerEntry.id.split('-');

    expect(parts[0], 'tracker');
    expect(parts[1].length, 16);
  });

  test('NewSceneEntry', () {
    NewSceneEntry newSceneEntry = NewSceneEntry(label: 'new scene label');

    expect(newSceneEntry.label, 'new scene label');

    List<String> parts = newSceneEntry.id.split('-');

    expect(parts[0], 'newScene');
    expect(parts[1].length, 16);
  });

  test('GeneralSettingsData ', () {
    final GeneralSettingsData generalSettingsData = GeneralSettingsData(
      showFutureSettings: false,
      useJournal: false,
      useRegularDice: true,
      useZocchiDice: false,
      useFateDice: false,
      wrapDiceControls: true,
      useCoriolisDice: false,
      useD6Oracle: false,
      showMechanics: true,
      hiddenEntryTypes: [],
      diceActive: true,
      randomTableRecursionLimit: 3,
      useT2KDice: false,
      useAchtungCthulhuDice: false,
    );

    expect(generalSettingsData.showFutureSettings, false);
    expect(generalSettingsData.useJournal, false);
    expect(generalSettingsData.useZocchiDice, false);

    final GeneralSettingsData generalSettingsData2 = GeneralSettingsData(
      showFutureSettings: true,
      useJournal: true,
      useRegularDice: true,
      useZocchiDice: true,
      useFateDice: false,
      wrapDiceControls: true,
      useCoriolisDice: false,
      useD6Oracle: false,
      showMechanics: true,
      hiddenEntryTypes: [],
      diceActive: true,
      randomTableRecursionLimit: 3,
      useT2KDice: false,
      useAchtungCthulhuDice: false,
    );

    expect(generalSettingsData2.showFutureSettings, true);
    expect(generalSettingsData2.useJournal, true);
    expect(generalSettingsData2.useZocchiDice, true);
  });

  test('SettingsData', () {
    final GeneralSettingsData generalSettingsData = GeneralSettingsData(
      showFutureSettings: false,
      useJournal: false,
      useRegularDice: true,
      useZocchiDice: false,
      useFateDice: false,
      wrapDiceControls: true,
      useCoriolisDice: false,
      useD6Oracle: false,
      showMechanics: true,
      hiddenEntryTypes: [],
      diceActive: true,
      randomTableRecursionLimit: 3,
      useT2KDice: false,
      useAchtungCthulhuDice: false,
    );
    final SettingsData settingsData = SettingsData(
      general: generalSettingsData,
    );
    expect(settingsData.general.showFutureSettings, false);
    expect(settingsData.general.useJournal, false);
    expect(settingsData.general.useZocchiDice, false);
  });
}
