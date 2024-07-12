import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../data/app_state.dart';
import '../../widgets/popups/add_kard_popup.dart';
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
            maxHeight: 420.0,
            child: AddKardPopup(
              appState: appState,
              id: entry.id,
            ),
            context: context);
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.pink,
          borderRadius: BorderRadius.all(kInputBorderRadius),
        ),
        // child: LayoutVertical(entry: entry, textLines: textLines),
        child: switch (entry.layoutType) {
          KardLayoutTypes.vertical => Text('Vertical'),
          KardLayoutTypes.horizontal =>
            LayoutHorizontal(entry: entry, textLines: textLines),
          KardLayoutTypes.statBlock => Text('statBlock'),
          KardLayoutTypes.statBlockList => StatBlockList(entry: entry),
          KardLayoutTypes.tabular => Text('tabular'),
        },
      ),
    );
  }
}

class StatBlockList extends StatelessWidget {
  const StatBlockList({
    super.key,
    required this.entry,
  });

  final Kard entry;

  @override
  Widget build(BuildContext context) {
    List<TableRow>? rows = entry.lines?.mapIndexed((index, line) {
      List<String> strings = line.split(',');
      List<Text> cells = strings
          .map((string) => Text(
                string,
                style: const TextStyle(
                  color: CupertinoColors.white,
                ),
              ))
          .toList();
      return TableRow(
        decoration: index == 0
            ? const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                width: 1.0,
                color: Colors.white,
              )))
            : null,
        children: cells,
      );
    }).toList();

    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 1200.0,
        minWidth: 100.0,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Table(
          children: rows ?? [],
        ),
      ),
    );
  }
}

class LayoutHorizontal extends StatelessWidget {
  const LayoutHorizontal({
    super.key,
    required this.entry,
    required this.textLines,
  });

  final Kard entry;
  final List<Widget> textLines;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 200.0,
        minHeight: 44.0,
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
    );
  }
}
