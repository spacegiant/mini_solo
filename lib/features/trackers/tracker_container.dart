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
    this.onTap,
    this.onTapRight,
  });

  final Widget child;
  final double minWidth;
  final double? maxWidth;
  final AppState appState;
  final String id;
  final Function()? onTap;
  final Function()? onTapRight;

  @override
  Widget build(BuildContext context) {
    double myDouble = maxWidth ?? double.infinity;
    bool showButtons = onTap != null && onTapRight != null;

    return Stack(
      alignment: AlignmentDirectional.centerStart,
      children: [
        GestureDetector(
          onTap: () {
            if (!showButtons && onTap != null) onTap!();
          },
          onLongPress: () {
            appState.setCurrentEntryId(id);
            appState.toggleShowPopup(label: PopupLabel.editTracker);
          },
          child: Container(
            constraints: BoxConstraints(
              minWidth: minWidth,
              maxWidth: myDouble,
            ),
            padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
            decoration: const BoxDecoration(
                color: CupertinoColors.lightBackgroundGray,
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: child,
          ),
        ),
        if (showButtons)
          Positioned(
            child: Container(
              // color: Color(0x88FF9900),
              child: CupertinoButton(
                child: const SizedBox(width: 44.0, height: 44.0),
                onPressed: () {
                  if (onTap != null) onTap!();
                },
              ),
            ),
          ),
        if (showButtons)
          Positioned(
            right: 0.0,
            child: Container(
              // color: Color(0x88FF9900),
              child: CupertinoButton(
                child: SizedBox(width: 44.0, height: 44.0),
                onPressed: () {
                  if (onTapRight != null) onTapRight!();
                },
              ),
            ),
          ),
      ],
    );
  }
}
