import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_solo/constants.dart';
import 'package:mini_solo/data/app_state.dart';

import '../../data/campaign_data.dart';
import '../../icons.dart';
import '../gap.dart';

Map<TrackerTypes, String> _trackerTypes = {
  TrackerTypes.clock: 'Clock',
  TrackerTypes.bar: 'Bar',
  TrackerTypes.ironswornTrack: 'Ironsworn Track',
  TrackerTypes.pips: 'Pips',
  TrackerTypes.value: 'Value',
};

Map<String, List<Images>> trackers = {
  '4 Segment': [Images.clock4_0],
  '6 Segment': [Images.clock6_0],
  '8 Segment': [Images.clock8_0],
  'Troublesome': [
    Images.ironsworn_tick_4,
    Images.ironsworn_tick_4,
    Images.ironsworn_tick_4,
  ],
  'Dangerous': [
    Images.ironsworn_tick_4,
    Images.ironsworn_tick_4,
  ],
  'Formidable': [
    Images.ironsworn_tick_4,
  ],
  'Extreme': [Images.ironsworn_tick_2],
  'Epic': [
    Images.ironsworn_tick_1,
  ],
  'Pip': [
    Images.pip_icon,
  ],
  'Bar': [
    Images.bar_tracker,
  ],
  'Simple Value': [
    Images.value_tracker,
  ],
  'Counter': []
};

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
      });
    }

    List<Widget> controls = [];

    trackers.forEach((label, images) => {
          controls.add(trackerOptionButton(
              images: images,
              label: label,
              id: label,
              selectedId: selectedTracker,
              onSelect: handleSelection))
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
