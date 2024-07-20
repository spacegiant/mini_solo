import 'package:flutter/cupertino.dart';

void toggleShowPopup({
  required Widget child,
  required BuildContext context,
  double maxWidth = 240.0,
  double maxHeight = 180.0,
}) {
  showCupertinoDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) => SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            16.0, 16.0, 16.0, MediaQuery.of(context).viewInsets.bottom),
        child: CupertinoPopupSurface(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: maxWidth,
                    maxHeight: maxHeight,
                  ),
                  child: child),
            ),
          ),
        ),
      ),
    ),
  );
}
