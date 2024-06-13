import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../data/app_state.dart';
import '../../data/campaign_data.dart';
import '../../features/trackers/tracker_options.dart';
import '../gap.dart';

class EditTrackerPopup extends StatefulWidget {
  const EditTrackerPopup({
    super.key,
    required this.appState,
  });

  final AppState appState;

  @override
  State<EditTrackerPopup> createState() => _EditTrackerPopupState();
}

class _EditTrackerPopupState extends State<EditTrackerPopup> {
  late TextEditingController _trackerNameController;
  late TextEditingController _minValueController;
  late TextEditingController _currentValueController;
  late TextEditingController _maxValueController;
  late bool showMinValue;
  late bool showCurrentValue;
  late bool showMaxValue;
  late String currentEntryId = widget.appState.currentEntryId;
  late TrackerEntry? currentEntry = widget.appState.campaignData?.tracker
      .firstWhere((tracker) => tracker.id == currentEntryId);
  late TrackerOptions trackerOptions = trackers
      .firstWhere((tracker) => tracker.type == currentEntry?.trackerType);

  @override
  void initState() {
    super.initState();
    _trackerNameController =
        TextEditingController(text: currentEntry?.label.toString());
    _minValueController =
        TextEditingController(text: currentEntry?.minValue.toString());
    _currentValueController =
        TextEditingController(text: currentEntry?.currentValue.toString());
    _maxValueController =
        TextEditingController(text: currentEntry?.maxValue.toString());
    showMinValue = trackerOptions.editMin!;
    showCurrentValue = trackerOptions.editCurrent!;
    showMaxValue = trackerOptions.editMax!;
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
    String currentEntryId = widget.appState.currentEntryId;
    TrackerEntry? currentToggleEntry = widget.appState.campaignData?.tracker
        .firstWhere((tracker) => tracker.id == currentEntryId);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Tracker Name'),
          const Gap(),
          CupertinoTextField(
            autofocus: true,
            controller: _trackerNameController,
            placeholder: 'Tracker name',
          ),
          const Gap(),
          Row(
            children: [
              if (showMinValue)
                Flexible(
                    child: Column(
                  children: [
                    const Text('Min Value'),
                    const Gap(height: 4.0),
                    CupertinoTextField(
                      keyboardType: TextInputType.number,
                      controller: _minValueController,
                      placeholder: 'min value',
                    ),
                  ],
                )),
              const Gap(),
              if (showCurrentValue)
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
              if (showMaxValue)
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
          ),
          const Divider(),
          buttonBar(),
        ],
      ),
    );
  }

  Wrap buttonBar() {
    return Wrap(
      spacing: 16.0,
      runSpacing: 8.0,
      children: [
        CupertinoButton(
            color: kSubmitColour,
            onPressed: () {
              // Update data and save
              widget.appState.updateTrackerEntry(
                id: currentEntryId,
                label: _trackerNameController.text,
                minValue: int.parse(_minValueController.text),
                currentValue: int.parse(_currentValueController.text),
                maxValue: int.parse(_maxValueController.text),
              );
              widget.appState.closePopup();
            },
            child: const Text('Save')),
        CupertinoButton(
            color: CupertinoColors.inactiveGray,
            onPressed: () {
              widget.appState.closePopup();
            },
            child: const Text('Cancel')),
        CupertinoButton(
            color: kWarningColour,
            onPressed: () {
              widget.appState
                  .deleteTrackerEntry(widget.appState.currentEntryId);
              widget.appState.closePopup();
            },
            child: const Text('Delete')),
      ],
    );
  }
}
