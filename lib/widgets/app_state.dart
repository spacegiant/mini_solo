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
  late int _chaosFactor = 5;
  late PopupLabels _popupLabel = PopupLabels.chaos;
  late bool _showPopup = false;
  late bool _showSettings = false;
  late bool _useJournal = true;
  CampaignData? _campaignData;

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
  int get chaosFactor => _chaosFactor;
  int maxChaos = 9;
  int minChaos = 1;

  void increaseChaosFactor() {
    _chaosFactor < maxChaos ? _chaosFactor++ : null;
    notifyListeners();
  }

  void decreaseChaosFactor() {
    _chaosFactor > minChaos ? _chaosFactor-- : null;
    notifyListeners();
  }

  void resetChaosFactor() {
    _chaosFactor = 5;
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
}
