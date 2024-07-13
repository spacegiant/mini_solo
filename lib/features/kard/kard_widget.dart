import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../data/app_state.dart';
import '../../widgets/gap.dart';
import '../../widgets/popups/add_kard_popup.dart';
import '../../widgets/popups/toggle_show_popup.dart';
import 'kard.dart';

class KardWidget extends StatelessWidget {
  const KardWidget({
    super.key,
    required this.entry,
    required this.appState,
    required this.buttonColor,
  });

  final Kard entry;
  final AppState appState;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
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
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.all(kInputBorderRadius),
        ),
        // child: LayoutVertical(entry: entry, textLines: textLines),
        child: switch (entry.layoutType) {
          KardLayoutTypes.vertical => const Text('Vertical'),
          KardLayoutTypes.horizontal => LayoutHorizontal(entry: entry),
          KardLayoutTypes.statBlockList => StatBlockList(entry: entry),
          KardLayoutTypes.tabular => TabularLayout(entry: entry),
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
    List<List<String>> tableData = convertStringToTabularData(entry.lines);
    bool isSingleStat = tableData.length == 1;

    List<Widget> statBlock = [];

    for (final row in tableData) {
      statBlock.add(
        Container(
          decoration: BoxDecoration(
            color: isSingleStat ? null : CupertinoColors.white.withOpacity(0.7),
            borderRadius: const BorderRadius.all(Radius.circular(4.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 50.0,
                minHeight: 50.0,
              ),
              child: Column(
                children: [
                  Text(
                    row[0],
                    style: const TextStyle(fontSize: 12.0),
                  ),
                  Text(
                    row[1],
                    style: const TextStyle(fontSize: 24.0),
                  ),
                  Text(
                    row[2],
                    style: const TextStyle(fontSize: 12.0),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (entry.title != '') ...[
          const Gap(height: 8.0),
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
        ],
        Padding(
          padding: EdgeInsets.all(isSingleStat ? 0.0 : 8.0),
          child: DefaultTextStyle.merge(
            style: TextStyle(
                color: isSingleStat
                    ? CupertinoColors.white
                    : CupertinoColors.black),
            child: Wrap(
              spacing: 8.0,
              children: statBlock,
            ),
          ),
        ),
      ],
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
    List<List<String>> tableData = convertStringToTabularData(entry.lines);

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
        children: tableRows,
      ),
    );
  }
}

class LayoutHorizontal extends StatelessWidget {
  const LayoutHorizontal({
    super.key,
    required this.entry,
  });

  final Kard entry;

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

List<List<String>> convertStringToTabularData(List<String>? lines) {
  int numberOfColumns = 0;
  List<List<String>> tableData = [];

  for (var line in lines!) {
    List<String> tableRow = line.trim().split(',');

    List<String> trimmedTableRow = tableRow.map((cell) => cell.trim()).toList();

    if (trimmedTableRow.length > numberOfColumns) {
      numberOfColumns = trimmedTableRow.length;
    }

    tableData.add(trimmedTableRow);
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
