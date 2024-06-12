import 'package:flutter/cupertino.dart';

import '../../data/app_state.dart';

class TrackerContainer extends StatelessWidget {
  const TrackerContainer({
    super.key,
    required this.child,
    this.minWidth = 100.0,
    this.maxWidth,
    required this.appState,
    required this.id,
  });

  final Widget child;
  final double minWidth;
  final double? maxWidth;
  final AppState appState;
  final String id;

  @override
  Widget build(BuildContext context) {
    double myDouble = maxWidth ?? double.infinity;
    return GestureDetector(
      onTap: () {},
      onLongPress: () {
        appState.setCurrentEntryId(id);
        appState.toggleShowPopup(label: PopupLabel.editTracker);
      },
      child: Container(
        constraints: BoxConstraints(
          minWidth: minWidth,
          maxWidth: myDouble,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        decoration: const BoxDecoration(
            color: CupertinoColors.lightBackgroundGray,
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: child,
      ),
    );
  }
}
