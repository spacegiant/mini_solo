import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_solo/constants.dart';
import 'package:mini_solo/data/app_state.dart';

import '../../data/campaign_data.dart';
import '../../icons.dart';
import '../gap.dart';

class TrackerOptions {
  final String label;
  final TrackerTypes type;
  final List<Images> images;

  TrackerOptions(
    this.label,
    this.type,
    this.images,
  );
}

List<TrackerOptions> trackers = [
  TrackerOptions('4 Segment', TrackerTypes.clock, [Images.clock4_0]),
  TrackerOptions('6 Segment', TrackerTypes.clock, [Images.clock6_0]),
  TrackerOptions('8 Segment', TrackerTypes.clock, [Images.clock8_0]),
  TrackerOptions('Troublesome', TrackerTypes.ironswornTrack, [
    Images.ironsworn_tick_4,
    Images.ironsworn_tick_4,
    Images.ironsworn_tick_4,
  ]),
  TrackerOptions('Dangerous', TrackerTypes.ironswornTrack, [
    Images.ironsworn_tick_4,
    Images.ironsworn_tick_4,
  ]),
  TrackerOptions('Formidable', TrackerTypes.ironswornTrack, [
    Images.ironsworn_tick_4,
  ]),
  TrackerOptions('Extreme', TrackerTypes.ironswornTrack, [
    Images.ironsworn_tick_2,
  ]),
  TrackerOptions('Epic', TrackerTypes.ironswornTrack, [
    Images.ironsworn_tick_1,
  ]),
  TrackerOptions('Pip', TrackerTypes.pips, [Images.pip_icon]),
  TrackerOptions('Bar', TrackerTypes.bar, [Images.bar_tracker]),
  TrackerOptions('Simple Value', TrackerTypes.value, [Images.value_tracker]),
  TrackerOptions('Counter', TrackerTypes.counter, [Images.value_tracker]),
];

class ManageTrackerPopup extends StatefulWidget {
  const ManageTrackerPopup({
    super.key,
    required this.appState,
    this.id,
  });

  final AppState appState;
  final String? id;

  @override
  State<ManageTrackerPopup> createState() => _ManageTrackerPopupState();
}

class _ManageTrackerPopupState extends State<ManageTrackerPopup> {
  String selectedTracker = '';
  bool minValueActive = true;
  bool currentValueActive = true;
  bool maxValueActive = true;

  late TextEditingController _trackerNameController;
  late TextEditingController _minValueController;
  late TextEditingController _currentValueController;
  late TextEditingController _maxValueController;

  @override
  void initState() {
    super.initState();
    _trackerNameController = TextEditingController();
    _minValueController = TextEditingController(text: '0');
    _currentValueController = TextEditingController(text: '0');
    _maxValueController = TextEditingController();
  }

  @override
  void dispose() {
    _trackerNameController.dispose();
    _minValueController.dispose();
    _currentValueController.dispose();
    _maxValueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // var trackerTypes = _trackerTypes.values.toList();

    void handleSelection(String id) {
      setState(() {
        selectedTracker = id;
        // if (selectedTracker.contains('Segment')) {}
        // else if(selectedTracker)
      });
    }

    List<Widget> controls = [];

    trackers.forEach((tracker) {
      controls.add(
        trackerOptionButton(
            images: tracker.images,
            label: tracker.label,
            id: tracker.label,
            selectedId: selectedTracker,
            onSelect: handleSelection),
      );
    });

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Tracker Name $selectedTracker'),
          const Gap(),
          CupertinoTextField(
            controller: _trackerNameController,
            placeholder: 'Tracker name',
          ),
          const Gap(),
          rangeValues(),
          const Divider(),
          const Gap(),
          const Text('Select Tracker Type'),
          const Gap(),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: [...controls],
          ),
          const Divider(),
          const Gap(),
          buttonBar(),
        ],
      ),
    );
  }

  Row rangeValues() {
    return Row(
      children: [
        Flexible(
            child: Column(
          children: [
            const Text('Min Value'),
            const Gap(height: 4.0),
            CupertinoTextField(
              controller: _minValueController,
              placeholder: 'min value',
            ),
          ],
        )),
        const Gap(),
        Flexible(
            child: Column(
          children: [
            const Text('Current Value'),
            const Gap(height: 4.0),
            CupertinoTextField(
              controller: _currentValueController,
              placeholder: 'current value',
            ),
          ],
        )),
        const Gap(),
        Flexible(
            child: Column(
          children: [
            const Text('Max Value'),
            const Gap(height: 4.0),
            CupertinoTextField(
              controller: _maxValueController,
              placeholder: 'max value',
            ),
          ],
        )),
      ],
    );
  }

  Widget trackerOptionButton({
    required List<Images> images,
    String? label,
    double? size,
    required String id,
    required String selectedId,
    required Function(String) onSelect,
  }) {
    Color buttonColor = CupertinoColors.extraLightBackgroundGray;
    Color textColor = CupertinoColors.black;

    if (selectedId == id) {
      buttonColor = CupertinoColors.systemYellow;
    }

    List<SvgIcon> svgIcons = images
        .map((image) => SvgIcon(
              icon: image,
              height: 36.0,
            ))
        .toList();

    return CupertinoButton(
      onPressed: () {
        onSelect(id);
      },
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      color: buttonColor,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          ...svgIcons,
          if (label != null) const Gap(),
          if (label != null)
            Text(
              label,
              style: TextStyle(color: textColor),
            ),
        ],
      ),
    );
  }

  Row buttonBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CupertinoButton(
            color: kSubmitColour,
            onPressed: () {
              // if(_trackerNameController.text != '' && )
              // Validate
              // Create Tracker from Class
              // Add to campaign data tracker collection
            },
            child: const Text('Save')),
        const Gap(),
        CupertinoButton(
            color: kWarningColour,
            onPressed: () {},
            child: const Text('Cancel')),
      ],
    );
  }
}
