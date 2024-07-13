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
          KardLayoutTypes.vertical => const Text('Vertical'),
          KardLayoutTypes.horizontal =>
            LayoutHorizontal(entry: entry, textLines: textLines),
          KardLayoutTypes.statBlock => const Text('statBlock'),
          KardLayoutTypes.statBlockList => const Text('statBlockList'),
          KardLayoutTypes.tabular => TabularLayout(entry: entry),
        },
      ),
    );
  }
}

class TabularLayout extends StatelessWidget {
  const TabularLayout({
    super.key,
    required this.entry,
  });

  final Kard entry;

  @override
  Widget build(BuildContext context) {
    List<List<String>> tableData = convertStringToTable(entry.lines);

    List<TableRow> tableRows = [];

    for (final (index, row) in tableData.indexed) {
      tableRows.add(
        TableRow(
          decoration: index == 0
              ? const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                  width: 1.0,
                  color: Colors.white,
                )))
              : null,
          children: row
              .map(
                (cell) => Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 4.0,
                  ),
                  child: Text(
                    cell,
                    style: const TextStyle(
                      color: CupertinoColors.white,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Table(
        defaultColumnWidth: const IntrinsicColumnWidth(),
        children: tableRows ?? [],
      ),
    );
  }

  List<List<String>> convertStringToTable(List<String>? lines) {
    int numberOfColumns = 0;
    List<List<String>> tableData = [];

    for (var line in lines!) {
      List<String> tableRow = line.trim().split(',');
      if (tableRow.length > numberOfColumns) numberOfColumns = tableRow.length;
      tableData.add(tableRow);
    }

    for (var row in tableData) {
      if (row.length < numberOfColumns) {
        int difference = numberOfColumns - row.length;

        for (int i = 0; i < difference; i++) {
          row.add('');
        }
      }
    }
    return tableData;
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
