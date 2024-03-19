import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'app_state.dart';
import 'chaos_factor_popup.dart';

Map<PopupLabels, Widget> popupContentMap = {
  PopupLabels.chaos: const ChaosFactorPopup(),
  PopupLabels.fate: const Text('FATE'),
  PopupLabels.endScene: const Text('END SCENE'),
};

Visibility popup(BuildContext context) {
  var appState = context.read<AppState>();
  return Visibility(
    visible: appState.showPopup,
    child: CupertinoPopupSurface(
      // child: Center(child: child),
      child: Center(
        child: popupContentMap[appState.popupLabel],
      ),
    ),
  );
}
