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
  final int? minValue;
  final int? currentValue;
  final int? maxValue;
  final bool? editMin;
  final bool? editCurrent;
  final bool? editMax;

  TrackerOptions({
    required this.label,
    required this.type,
    required this.images,
    this.editMin = false,
    this.editCurrent = false,
    this.editMax = false,
    this.minValue,
    this.currentValue,
    this.maxValue,
  });
}

List<TrackerOptions> trackers = [
  TrackerOptions(
    label: '4 Segment',
    type: TrackerTypes.clock,
    images: [Images.clock4_0],
    maxValue: 4,
  ),
  TrackerOptions(
    label: '6 Segment',
    type: TrackerTypes.clock,
    images: [Images.clock6_0],
    maxValue: 6,
  ),
  TrackerOptions(
    label: '8 Segment',
    type: TrackerTypes.clock,
    images: [Images.clock8_0],
    maxValue: 8,
  ),
  TrackerOptions(
    label: 'Troublesome',
    type: TrackerTypes.ironswornTrack,
    images: [
      Images.ironsworn_tick_4,
      Images.ironsworn_tick_4,
      Images.ironsworn_tick_4,
    ],
    maxValue: 10,
  ),
  TrackerOptions(
    label: 'Dangerous',
    type: TrackerTypes.ironswornTrack,
    images: [
      Images.ironsworn_tick_4,
      Images.ironsworn_tick_4,
    ],
    maxValue: 10,
  ),
  TrackerOptions(
    label: 'Formidable',
    type: TrackerTypes.ironswornTrack,
    images: [
      Images.ironsworn_tick_4,
    ],
    maxValue: 10,
  ),
  TrackerOptions(
    label: 'Extreme',
    type: TrackerTypes.ironswornTrack,
    images: [
      Images.ironsworn_tick_2,
    ],
    maxValue: 10,
  ),
  TrackerOptions(
    label: 'Epic',
    type: TrackerTypes.ironswornTrack,
    images: [
      Images.ironsworn_tick_1,
    ],
    maxValue: 10,
  ),
  TrackerOptions(
    label: 'Pip',
    type: TrackerTypes.pips,
    images: [Images.pip_icon],
    minValue: 0,
    currentValue: 0,
    maxValue: 6,
    editCurrent: true,
    editMax: true,
  ),
  TrackerOptions(
    label: 'Bar',
    type: TrackerTypes.bar,
    images: [Images.bar_tracker],
    minValue: 0,
    currentValue: 0,
    maxValue: 10,
    editMin: true,
    editCurrent: true,
    editMax: true,
  ),
  TrackerOptions(
    label: 'Simple Value',
    type: TrackerTypes.value,
    images: [Images.value_tracker],
    currentValue: 9,
    editCurrent: true,
  ),
  TrackerOptions(
    label: 'Counter',
    type: TrackerTypes.counter,
    images: [Images.value_tracker],
    editCurrent: true,
    currentValue: 0,
  ),
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
  bool minValueActive = false;
  bool currentValueActive = false;
  bool maxValueActive = false;

  late TextEditingController _trackerNameController;
  late TextEditingController _minValueController;
  late TextEditingController _currentValueController;
  late TextEditingController _maxValueController;

  @override
  void initState() {
    super.initState();
    _trackerNameController = TextEditingController();
    _minValueController = TextEditingController();
    _currentValueController = TextEditingController();
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
        TrackerOptions currentTracker = trackers.firstWhere((tracker) {
          return tracker.label == selectedTracker;
        });
        minValueActive = currentTracker.editMin!;
        currentValueActive = currentTracker.editCurrent!;
        maxValueActive = currentTracker.editMax!;

        // TODO: Should this be in the setState?
        _minValueController.text = manageValue(currentTracker.minValue);
        _currentValueController.text = manageValue(currentTracker.currentValue);
        _maxValueController.text = manageValue(currentTracker.maxValue);

        // if(currentTracker.minValue != null ) _minValueController.text = currentTracker.minValue.toString();
      });
    }

    List<Widget> controls = [];

    for (var tracker in trackers) {
      controls.add(
        trackerOptionButton(
            images: tracker.images,
            label: tracker.label,
            id: tracker.label,
            selectedId: selectedTracker,
            onSelect: handleSelection),
      );
    }

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
            child: Opacity(
          opacity: minValueActive == true ? 1.0 : 0.3,
          child: Column(
            children: [
              const Text('Min Value'),
              const Gap(height: 4.0),
              CupertinoTextField(
                keyboardType: TextInputType.number,
                enabled: minValueActive,
                controller: _minValueController,
                placeholder: 'min value',
              ),
            ],
          ),
        )),
        const Gap(),
        Flexible(
            child: Opacity(
          opacity: currentValueActive == true ? 1.0 : 0.3,
          child: Column(
            children: [
              const Text('Current Value'),
              const Gap(height: 4.0),
              CupertinoTextField(
                enabled: currentValueActive,
                controller: _currentValueController,
                placeholder: 'current value',
              ),
            ],
          ),
        )),
        const Gap(),
        Flexible(
            child: Opacity(
          opacity: maxValueActive == true ? 1.0 : 0.3,
          child: Column(
            children: [
              const Text('Max Value'),
              const Gap(height: 4.0),
              CupertinoTextField(
                enabled: maxValueActive,
                controller: _maxValueController,
                placeholder: 'max value',
              ),
            ],
          ),
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
            onPressed:
                (_trackerNameController.text == '' || selectedTracker == null)
                    ? null
                    : handleSubmit,
            child: const Text('Save')),
        const Gap(),
        CupertinoButton(
            color: kWarningColour,
            onPressed: () {
              widget.appState.closePopup();
            },
            child: const Text('Cancel')),
      ],
    );
  }

  void handleSubmit() {
    if (_trackerNameController.text == '' || selectedTracker == null) {
      return;
    }
    TrackerOptions currentTracker = trackers.firstWhere((tracker) {
      return tracker.label == selectedTracker;
    });
    if (currentTracker.type == TrackerTypes.clock) {
      // has preset max and min
      widget.appState.addTrackerEntry(TrackerEntry(
        currentValue: 0,
        minValue: 0,
        maxValue: currentTracker.maxValue,
        trackerType: TrackerTypes.clock,
      ));
    } else if (currentTracker.type == TrackerTypes.ironswornTrack) {
      // has preset track length etc.
      print('IRONSWORN');
    } else if (currentTracker.type == TrackerTypes.pips) {
      // Needs a max and current
      print('PIPS');
    } else if (currentTracker.type == TrackerTypes.bar) {
      // Needs min, current and max
    } else if (currentTracker.type == TrackerTypes.value) {
      // just needs current value
    } else if (currentTracker.type == TrackerTypes.counter) {
      // just needs current value
    }
    // Validate
    // Create Tracker from Class
    // Add to campaign data tracker collection
  }

  String manageValue(int? value) {
    if (value != null) {
      return value.toString();
    } else {
      return '';
    }
  }
}
