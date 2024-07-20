import 'package:flutter/material.dart';

void toggleShowPopup({
  required Widget child,
  required BuildContext context,
  double maxWidth = 200.0,
  double maxHeight = 600.0,
}) {
  showGeneralDialog(
    barrierDismissible: true,
    barrierLabel: 'toggleShowPopup',
    context: context,
    pageBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      return SafeArea(
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          insetPadding: const EdgeInsets.all(8.0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 600.0,
              // maxHeight: 800.0,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: child,
            ),
          ),
        ),
      );
    },
  );
}
