import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_solo/constants.dart';
import 'package:mini_solo/data/app_state.dart';

import '../gap.dart';
import '../my_slider.dart';
import '../picker.dart';

enum TrackerTypes {
  clock,
  bar,
  ironswornTrack,
  pips,
  value,
}

Map<TrackerTypes, String> _trackerTypes = {
  TrackerTypes.clock: 'Clock',
  TrackerTypes.bar: 'Bar',
  TrackerTypes.ironswornTrack: 'Ironsworn Track',
  TrackerTypes.pips: 'Pips',
  TrackerTypes.value: 'Value',
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
  late TrackerTypes selectedType = TrackerTypes.clock;

  @override
  Widget build(BuildContext context) {
    var trackerTypes = _trackerTypes.values.toList();

    void handleChange(int index) {
      print('handle change ${_trackerTypes.keys.elementAt(index)}');
      setState(() {
        selectedType = _trackerTypes.keys.elementAt(index);
      });
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Manage Tracker'),
          const Gap(),
          const Text('Tracker Name'),
          const CupertinoTextField(
            placeholder: 'Tracker name',
          ),
          const Gap(),
          const Text('Tracker Type'),
          Picker(
            items: trackerTypes,
            onChange: handleChange,
          ),
          const Divider(),
          if (selectedType == TrackerTypes.clock)
            clockForm()
          else if (selectedType == TrackerTypes.bar)
            barForm()
          else if (selectedType == TrackerTypes.ironswornTrack)
            ironswornTrackerForm()
          else if (selectedType == TrackerTypes.pips)
            pipsForm()
          else if (selectedType == TrackerTypes.value)
            simpleValueForm()
        ],
      ),
    );
  }

  Widget simpleValueForm() => const Column(
        children: [
          Text('Simple Value'),
          CupertinoTextField(
            placeholder: 'Value',
          ),
        ],
      );

  Widget pipsForm() => const Column(
        children: [
          Text('Pips'),
          CupertinoTextField(
            placeholder: 'Number of Pips',
          ),
        ],
      );

  Widget ironswornTrackerForm() => Column(
        children: [
          Text('Ironsworn Track'),
          Picker(items: const [
            'Troublesome',
            'Dangerous',
            'Formidable',
            'Extreme',
            'Epic',
          ], onChange: (index) {})
        ],
      );

  Widget barForm() => const Column(
        children: [
          Text('Bar Tracker Settings'),
          Gap(),
          Row(
            children: [
              Flexible(
                child: CupertinoTextField(
                  placeholder: 'Min',
                ),
              ),
              Gap(),
              Flexible(
                child: CupertinoTextField(
                  placeholder: 'Current',
                ),
              ),
              Gap(),
              Flexible(
                child: CupertinoTextField(
                  placeholder: 'Max',
                ),
              ),
            ],
          )
        ],
      );

  Widget clockForm() => const Column(
        children: [Text('Number of Segments'), MySlider()],
      );
}
