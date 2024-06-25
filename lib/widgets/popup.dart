import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../data/app_state.dart';
import '../my_homepage.dart';

Consumer<Object?> popup(
  BuildContext context,
  MyHomePageIOS? widget,
) {
  return Consumer<AppState>(
    builder: (BuildContext context, AppState appState, Widget? child) {
      double popupHeight = kPopupDefaultHeight;
      return Visibility(
        visible: appState.showPopup,
        child: GestureDetector(
          onTap: () {
            // FIXME event triggers inside the popup not just on background
            // appState.closePopup();
          },
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(
              color: kBackdropFilterColor,
              height: double.infinity,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  SizedBox(
                    height: popupHeight,
                    width: 400.0,
                    child: CupertinoPopupSurface(
                      child: Column(
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                          CupertinoButton(
                              child: const Text(kPopupCloseButtonLabel),
                              onPressed: () {
                                appState.closePopup();
                              }),
                          const Divider(),
                          child ?? const SizedBox.shrink(),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ),
      );
    },
  );
}
