import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_solo/widgets/range_values_form.dart';

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
          Center(child: Text('Tracker Name')),
          const Gap(),
          CupertinoTextField(
            autofocus: true,
            controller: _trackerNameController,
            placeholder: 'Tracker name',
          ),
          const Gap(),
          RangeValuesForm(
            minValueActive: showMinValue,
            currentValueActive: showCurrentValue,
            maxValueActive: showMaxValue,
            minValueController: _minValueController,
            currentValueController: _currentValueController,
            maxValueController: _maxValueController,
            setMinValueText: (value) {},
            setCurrentValueText: (value) {},
            setMaxValueText: (value) {},
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
              int? minValue;
              int? currentValue;
              int? maxValue;

              try {
                minValue = int.parse(_minValueController.text);
              } catch (e) {
                // print(e);
              }

              try {
                currentValue = int.parse(_currentValueController.text);
                print(currentValue);
              } catch (e) {
                // print(e);
              }

              try {
                maxValue = int.parse(_maxValueController.text);
              } catch (e) {
                // print(e);
              }

              widget.appState.updateTrackerEntry(
                id: currentEntryId,
                label: _trackerNameController.text,
                minValue: minValue,
                currentValue: currentValue,
                maxValue: maxValue,
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
