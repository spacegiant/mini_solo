import 'package:flutter/cupertino.dart';
import 'package:mini_solo/widgets/view_wrapper.dart';

import '../widgets/gap.dart';

class TrackerView extends StatelessWidget {
  const TrackerView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ViewWrapper(children: [
      PipTracker(),
      Gap(),
      ClockTracker(),
      Gap(),
      TimerTracker(),
      Gap(),
      Text('Initiative please'),
      AddTracker(),
    ]);
  }
}

class AddTracker extends StatelessWidget {
  const AddTracker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      color: CupertinoColors.inactiveGray,
      child: const Icon(CupertinoIcons.add),
      onPressed: () {},
    );
  }
}

class TimerTracker extends StatelessWidget {
  const TimerTracker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      color: CupertinoColors.activeBlue,
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(CupertinoIcons.tornado),
          Text('15:23'),
        ],
      ),
      onPressed: () {},
    );
  }
}

class ClockTracker extends StatelessWidget {
  const ClockTracker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      color: CupertinoColors.activeGreen,
      child: const Text('BitD Clocks goes here'),
      onPressed: () {},
    );
  }
}

class PipTracker extends StatelessWidget {
  const PipTracker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      color: CupertinoColors.systemPink,
      onPressed: () {},
      child: const Column(
        children: [
          Text('Mrs Nasty'),
          Column(
            children: [
              Text(
                'Health',
                style: TextStyle(color: CupertinoColors.white),
              ),
              Row(
                children: [
                  Icon(CupertinoIcons.circle_filled,
                      color: CupertinoColors.white),
                  Icon(CupertinoIcons.circle_filled,
                      color: CupertinoColors.white),
                  Icon(CupertinoIcons.circle_filled,
                      color: CupertinoColors.white),
                  Icon(CupertinoIcons.circle, color: CupertinoColors.white),
                  Icon(CupertinoIcons.circle, color: CupertinoColors.white),
                  Icon(CupertinoIcons.circle, color: CupertinoColors.white),
                  Icon(CupertinoIcons.circle, color: CupertinoColors.white),
                  Icon(CupertinoIcons.circle, color: CupertinoColors.white),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 16.0,
          ),
          Column(
            children: [
              Text(
                'Spirit',
                style: TextStyle(color: CupertinoColors.white),
              ),
              Row(
                children: [
                  Icon(CupertinoIcons.circle_filled,
                      color: CupertinoColors.white),
                  Icon(CupertinoIcons.circle_filled,
                      color: CupertinoColors.white),
                  Icon(CupertinoIcons.circle_filled,
                      color: CupertinoColors.white),
                  Icon(CupertinoIcons.circle, color: CupertinoColors.white),
                  Icon(CupertinoIcons.circle, color: CupertinoColors.white),
                  Icon(CupertinoIcons.circle, color: CupertinoColors.white),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
