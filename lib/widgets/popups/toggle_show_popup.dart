// TODO Does this need to be in AppState?
import 'package:flutter/cupertino.dart';

void toggleShowPopup2({
  required Widget child,
  required BuildContext context,
}) {
  showCupertinoModalPopup(
    context: context,
    builder: (BuildContext context) => SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CupertinoPopupSurface(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                child,
                CupertinoButton(
                    child: const Text('Close'),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ],
            ),
          ),
        ),
      ),
    ),
  );
  // _showPopup2 = !_showPopup2;
  // notifyListeners();
}
