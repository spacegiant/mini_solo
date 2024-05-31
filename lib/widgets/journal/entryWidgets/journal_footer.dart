import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../data/app_state.dart';

class JournalFooter extends StatelessWidget {
  const JournalFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (BuildContext context, appState, Widget? child) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Spacer(),
                  addJournalEntryButton(appState),
                  const SizedBox(
                    width: 16.0,
                  ),
                  jumpToFirstButton(),
                  const SizedBox(
                    width: 4.0,
                  ),
                  jumpToLatestButton(),
                  const SizedBox(
                    width: 4.0,
                  ),
                  journalFilterButton(appState)
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  CupertinoButton journalFilterButton(AppState appState) {
    return CupertinoButton(
      padding: const EdgeInsets.all(0.0),
      color: CupertinoColors.destructiveRed,
      child: const Icon(
        CupertinoIcons.line_horizontal_3_decrease,
        size: 20.0,
      ),
      onPressed: () {
        appState.toggleShowPopup(label: PopupLabel.journalFilter);
      },
    );
  }

  CupertinoButton jumpToLatestButton() {
    return CupertinoButton(
      padding: const EdgeInsets.all(0.0),
      color: CupertinoColors.destructiveRed,
      child: const Icon(
        CupertinoIcons.arrow_down_to_line,
        size: 20.0,
      ),
      onPressed: () {},
    );
  }

  CupertinoButton jumpToFirstButton() {
    return CupertinoButton(
      padding: const EdgeInsets.all(0.0),
      color: CupertinoColors.destructiveRed,
      child: const Icon(
        CupertinoIcons.arrow_up_to_line,
        size: 20.0,
      ),
      onPressed: () {},
    );
  }

  CupertinoButton addJournalEntryButton(AppState appState) {
    return CupertinoButton(
      padding: const EdgeInsets.all(0.0),
      color: CupertinoColors.white,
      borderRadius: const BorderRadius.all(Radius.circular(30.0)),
      child: const Icon(
        CupertinoIcons.add,
        size: 20.0,
        color: CupertinoColors.black,
      ),
      onPressed: () {
        appState.toggleShowPopup(label: PopupLabel.addJournalEntry);
      },
    );
  }
}
