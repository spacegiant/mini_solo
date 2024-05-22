import 'package:mini_solo/data/campaign_data.dart';
import 'package:test/test.dart';

void main() {
  test('GeneralSettingsData ', () {
    final GeneralSettingsData generalSettingsData = GeneralSettingsData(
      showFutureSettings: false,
      useJournal: false,
      useZocchiDice: false,
      useFateDice: false,
    );

    expect(generalSettingsData.showFutureSettings, false);
    expect(generalSettingsData.useJournal, false);
    expect(generalSettingsData.useZocchiDice, false);

    final GeneralSettingsData generalSettingsData2 = GeneralSettingsData(
      showFutureSettings: true,
      useJournal: true,
      useZocchiDice: true,
      useFateDice: false,
    );

    expect(generalSettingsData2.showFutureSettings, true);
    expect(generalSettingsData2.useJournal, true);
    expect(generalSettingsData2.useZocchiDice, true);
  });

  test('SettingsData', () {
    final GeneralSettingsData generalSettingsData = GeneralSettingsData(
      showFutureSettings: false,
      useJournal: false,
      useZocchiDice: false,
      useFateDice: false,
    );
    final SettingsData settingsData = SettingsData(
      general: generalSettingsData,
    );
    expect(settingsData.general.showFutureSettings, false);
    expect(settingsData.general.useJournal, false);
    expect(settingsData.general.useZocchiDice, false);
  });
}
