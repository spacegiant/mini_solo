import 'package:flutter/cupertino.dart';

enum PopupLabels {
  chaos,
  fate,
  endScene,
}

class AppState extends ChangeNotifier {
  late int _chaosFactor = 5;
  late PopupLabels _popupLabel = PopupLabels.chaos;
  late bool _showPopup = false;

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

  bool get showPopup => _showPopup;
}
