import 'package:flutter/cupertino.dart';
import 'package:mini_solo/widgets/popups/edit_tracker_popup.dart';
import 'package:mini_solo/widgets/popups/toggle_show_popup.dart';

import '../../data/app_state.dart';

enum DragDirection { left, none, right }

class TrackerContainer extends StatefulWidget {
  const TrackerContainer({
    super.key,
    required this.child,
    this.minWidth = 100.0,
    this.maxWidth,
    required this.appState,
    required this.id,
    this.onTap,
    this.onTapLeft,
    this.onTapRight,
    required this.widgetShowsTitle,
  });

  final Widget child;
  final double minWidth;
  final double? maxWidth;
  final AppState appState;
  final String id;
  final Function()? onTap;
  final Function()? onTapLeft;
  final Function()? onTapRight;
  final bool widgetShowsTitle;

  @override
  State<TrackerContainer> createState() => _TrackerContainerState();
}

class _TrackerContainerState extends State<TrackerContainer> {
  double? startPosition;
  final _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double myDouble = widget.maxWidth ?? double.infinity;

    Function() onTap = widget.onTap ?? () {};
    Function() onTapLeft = widget.onTapLeft ?? () {};
    Function() onTapRight = widget.onTapRight ?? () {};

    return Stack(
      alignment: AlignmentDirectional.centerStart,
      children: [
        GestureDetector(
          key: _key,
          onTapUp: (tapUpDetails) {
            Size? widgetSize = _key.currentContext!.size;
            Offset tapPosition = tapUpDetails.localPosition;

            double distanceFromLeft = tapPosition.dx;
            double distanceFromTop = tapPosition.dy;
            double distanceFromRight = widgetSize!.width - tapPosition.dx;

            double buttonWidth = 44.0;
            double titleHeight = 44.0;

            bool clickedInTitleArea =
                widget.widgetShowsTitle ? distanceFromTop < titleHeight : false;

            if (distanceFromLeft < buttonWidth && !clickedInTitleArea) {
              onTapLeft();
            } else if (distanceFromRight < buttonWidth && !clickedInTitleArea) {
              onTapRight();
            } else {
              onTap();
            }
          },
          onLongPress: () {
            toggleShowPopup(
                maxWidth: 600.0,
                maxHeight: 460.0,
                child: EditTrackerPopup(
                  appState: widget.appState,
                  id: widget.id,
                ),
                context: context);
          },
          child: Container(
            constraints: BoxConstraints(
              minWidth: widget.minWidth,
              maxWidth: myDouble,
              minHeight: 88.0,
            ),
            padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
            decoration: const BoxDecoration(
                color: CupertinoColors.lightBackgroundGray,
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: widget.child,
          ),
        ),
      ],
    );
  }
}
