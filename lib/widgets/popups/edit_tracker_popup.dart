import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_solo/widgets/popups/popup_layout.dart';
import 'package:mini_solo/widgets/popups/popup_layout_header.dart';
import 'package:mini_solo/widgets/range_values_form.dart';

import '../../constants.dart';
import '../../data/app_state.dart';
import '../../data/data_structures/tracker_entry.dart';
import '../../features/grouping/group-picker.dart';
import '../../features/trackers/tracker_options.dart';
import '../gap.dart';

class EditTrackerPopup extends StatefulWidget {
  const EditTrackerPopup({
    super.key,
    required this.appState,
    required this.id,
  });

  final AppState appState;
  final String id;

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
  late TrackerEntry? currentEntry = widget.appState.campaignData?.tracker
      .firstWhere((tracker) => tracker.id == widget.id);
  late TrackerOptions trackerOptions = trackers
      .firstWhere((tracker) => tracker.type == currentEntry?.controlType);
  String selectedGroup = 'unsorted';
  String initialGroup = 'unsorted';

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

    initialGroup = widget.appState.findCurrentGroupId(widget.id) ?? 'unsorted';
    selectedGroup = initialGroup;
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
    Widget body() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(child: Text('Tracker Name')),
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
          GroupPicker(
            onChange: (string) {
              setState(() {
                selectedGroup = string;
              });
            },
            appState: widget.appState,
            initialGroupId: initialGroup,
          ),
        ],
      );
    }

    return PopupLayout(
      header: PopupLayoutHeader(
        label: 'Edit \'${_trackerNameController.value.text}\' Tracker',
      ),
      body: body(),
      footer: buttonBar(),
    );
  }

  Wrap buttonBar() {
    return Wrap(
      spacing: 16.0,
      runSpacing: 8.0,
      children: [
        CupertinoButton(
            color: kSubmitColor,
            onPressed: () {
              int? minValue;
              int? currentValue;
              int? maxValue;

              if (initialGroup != selectedGroup) {
                widget.appState
                    .moveToGroup(controlId: widget.id, groupId: selectedGroup);
              }

              try {
                minValue = int.parse(_minValueController.text);
              } catch (e) {
                // return minValue as null
              }

              try {
                currentValue = int.parse(_currentValueController.text);
              } catch (e) {
                // return currentValue as null
              }

              try {
                maxValue = int.parse(_maxValueController.text);
              } catch (e) {
                // return maxValue as null
              }

              widget.appState.updateTrackerEntry(
                id: widget.id,
                label: _trackerNameController.text,
                minValue: minValue,
                currentValue: currentValue,
                maxValue: maxValue,
              );
              Navigator.pop(context);
            },
            child: const Text('Save')),
        CupertinoButton(
            color: CupertinoColors.inactiveGray,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel')),
        CupertinoButton(
            color: kWarningColor,
            onPressed: () {
              widget.appState.deleteTrackerEntry(widget.id);
              // Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text('Delete')),
      ],
    );
  }
}
