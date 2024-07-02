import 'package:flutter/cupertino.dart';

void toggleShowPopup2({
  required Widget child,
  required BuildContext context,
  double maxWidth = 240.0,
  double maxHeight = 170.0,
}) {
  showCupertinoModalPopup(
    context: context,
    builder: (BuildContext context) => SafeArea(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: maxWidth,
          maxHeight: maxHeight,
        ),
        child: CupertinoPopupSurface(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: child,
          ),
        ),
      ),
    ),
  );
}
