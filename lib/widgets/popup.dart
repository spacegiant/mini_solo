import 'package:flutter/cupertino.dart';
import 'chaos_factor_popup.dart';

Visibility popup(BuildContext context, showPopup, togglePopup, child) {
  return Visibility(
    visible: showPopup,
    child: CupertinoPopupSurface(
      child: Center(child: child),
    ),
  );
}
