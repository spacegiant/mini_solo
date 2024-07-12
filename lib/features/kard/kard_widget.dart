import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_solo/widgets/popups/edit_kard_popup.dart';

import '../../constants.dart';
import '../../data/app_state.dart';
import '../../widgets/popups/toggle_show_popup.dart';
import 'kard.dart';

class KardWidget extends StatelessWidget {
  const KardWidget({
    super.key,
    required this.entry,
    required this.appState,
  });

  final Kard entry;
  final AppState appState;

  @override
  Widget build(BuildContext context) {
    List<Widget> textLines = entry.lines
            ?.map((line) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    line,
                    style: const TextStyle(
                      color: CupertinoColors.white,
                    ),
                  ),
                ))
            .toList() ??
        [];

    return GestureDetector(
      onLongPress: () {
        toggleShowPopup2(
            maxWidth: 400.0,
            maxHeight: 240.0,
            child: EditKardPopup(
              appState: appState,
              id: entry.id,
            ),
            context: context);
      },
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: 100.0,
          minHeight: 44.0,
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.pink,
            borderRadius: BorderRadius.all(kInputBorderRadius),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (entry.title != '')
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      entry.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: CupertinoColors.white,
                      ),
                    ),
                  ),
                ...textLines,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
