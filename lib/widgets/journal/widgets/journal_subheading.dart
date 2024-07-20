import 'package:flutter/cupertino.dart';

import '../../gap.dart';

class JournalSubheading extends StatelessWidget {
  final String label;
  const JournalSubheading({
    super.key,
    required this.label,
    this.handleMinimiseToggle,
    this.showGroupSettingsPopup,
    required this.isExpanded,
    this.toggleShowGroupFullscreen,
  });

  final void Function()? handleMinimiseToggle;
  final void Function()? showGroupSettingsPopup;
  final void Function()? toggleShowGroupFullscreen;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        toggleShowGroupFullscreen!();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 12.0,
                ),
              ),
              CupertinoButton(
                padding: EdgeInsets.zero,
                color: null,
                child: Icon(
                    isExpanded ? CupertinoIcons.minus : CupertinoIcons.plus,
                    size: 16.0),
                onPressed: () {
                  handleMinimiseToggle!();
                },
              ),
              const Spacer(),
              CupertinoButton(
                  padding: EdgeInsets.zero,
                  color: null,
                  child: const Icon(CupertinoIcons.settings, size: 16.0),
                  onPressed: () {
                    showGroupSettingsPopup!();
                  })
            ],
          ),
          const Gap(
            height: 8.0,
          ),
        ],
      ),
    );
  }
}
