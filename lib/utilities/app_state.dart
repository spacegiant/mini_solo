import 'package:flutter/cupertino.dart';
import 'package:mini_solo/utilities/campaign_data.dart';

enum PopupLabels {
  chaos,
  fate,
  endScene,
  combat,
  social,
  exploration,
  investigation,
  journalFilter,
  travel,
  addJournalEntry,
  campaignManager,
  fullJournal,
}

class AppState extends ChangeNotifier {
  // TODO: Make sure this is not set on first run
  String? _currentCampaign;
  late PopupLabels _popupLabel = PopupLabels.chaos;
  late bool _showPopup = false;
  late bool _showSettings = false;
  late bool _useJournal = true;
  CampaignData? _campaignData;
  Function(CampaignData)? _saveCallback;

  // TODO: Rename to setSaveCampaignCallback
  void setSaveCallback(cb) {
    // print('setSaveCallback');
    _saveCallback = cb;
  }

  void saveCampaignDataToDisk() {
    // print('saveCallback ${_campaignData?.mythic.chaosFactor}');
    if (_saveCallback != null) _saveCallback!(_campaignData!);
    notifyListeners();
  }

  bool get saveCallbackExists => _saveCallback != null;

  // CAMPAIGN DATA
  CampaignData? get campaignData {
    return _campaignData;
  }

  void setCampaignData(CampaignData data) {
    _campaignData = data;
    notifyListeners();
  }

  // CURRENT CAMPAIGN
  String? get currentCampaign => _currentCampaign;

  void setCurrentCampaign(String campaignName) {
    _currentCampaign = campaignName;
    notifyListeners();
  }

  // CHAOS FACTOR
  int get chaosFactor => _campaignData!.mythic.chaosFactor ?? 5;
  int maxChaos = 9;
  int minChaos = 1;

  void increaseChaosFactor() {
    var cf = chaosFactor;
    if (cf < maxChaos) {
      var newValue = cf + 1;
      _campaignData!.mythic.chaosFactor = newValue;
      addJournalEntry(JournalEntryItem(
        isFavourite: false,
        title: 'UP to $newValue',
        type: JournalEntryTypes.chaosFactor,
        label: 'Chaos Factor',
      ));
    }
    saveCampaignDataToDisk();
    notifyListeners();
  }

  void decreaseChaosFactor() {
    var cf = chaosFactor;
    if (cf > minChaos) {
      var newValue = cf - 1;
      _campaignData!.mythic.chaosFactor = newValue;
      addJournalEntry(JournalEntryItem(
        isFavourite: false,
        title: 'DOWN to $newValue',
        type: JournalEntryTypes.chaosFactor,
        label: 'Chaos Factor',
      ));
    }
    saveCampaignDataToDisk();
    notifyListeners();
  }

  void resetChaosFactor() {
    _campaignData!.mythic.chaosFactor = 5;
    addJournalEntry(JournalEntryItem(
      isFavourite: false,
      title: 'RESET to 5',
      type: JournalEntryTypes.chaosFactor,
      label: 'Chaos Factor',
    ));
    saveCampaignDataToDisk();
    notifyListeners();
  }

  //   SHOW POPUP
  void setPopupLabel(PopupLabels label) {
    _popupLabel = label;
    notifyListeners();
  }

  PopupLabels get popupLabel => _popupLabel;

  void toggleShowPopup() {
    _showPopup = !_showPopup;
    notifyListeners();
  }

  void closePopup() {
    if (_showPopup == true) {
      _showPopup = false;
      notifyListeners();
    }
  }

  bool get showPopup => _showPopup;

//   SETTINGS
  void toggleShowSettings() {
    _showSettings = !_showSettings;
    notifyListeners();
  }

  bool get showSettings => _showSettings;

//   USE JOURNAL

  bool get useJournal => _useJournal;

  void toggleUseJournal() {
    _useJournal = !_useJournal;
    notifyListeners();
  }

  void addJournalEntry(JournalEntryItem item) {
    _campaignData?.journal.add(item);
  }
}
