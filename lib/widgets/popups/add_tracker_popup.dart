import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_solo/constants.dart';
import 'package:mini_solo/data/app_state.dart';
import 'package:mini_solo/features/grouping/group-picker.dart';
import 'package:mini_solo/widgets/popups/popup_layout.dart';
import 'package:mini_solo/widgets/popups/popup_layout_header.dart';
import 'package:mini_solo/widgets/range_values_form.dart';

import '../../data/data_structures/tracker_entry.dart';
import '../../features/trackers/tracker_options.dart';
import '../../utilities/string/manage_value.dart';
import '../../utilities/string/parse_string.dart';
import '../gap.dart';
import '../trackers/trackerOptionButton.dart';

class AddTrackerPopup extends StatefulWidget {
  const AddTrackerPopup({
    super.key,
    required this.appState,
    this.id,
  });

  final AppState appState;
  final String? id;

  @override
  State<AddTrackerPopup> createState() => _AddTrackerPopupState();
}

class _AddTrackerPopupState extends State<AddTrackerPopup> {
  String selectedTrackerType = '';
  bool minValueActive = false;
  bool currentValueActive = false;
  bool maxValueActive = false;
  String minValueError = '';
  String currentValueError = '';
  String maxValueError = '';
  String selectedGroup = 'group-trackers';

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
    void handleSelection(String id) {
      selectedTrackerType = id;
      TrackerOptions currentTracker = trackers.firstWhere((tracker) {
        return tracker.label == selectedTrackerType;
      });

      _minValueController.text = manageValue(currentTracker.minValue);
      _currentValueController.text = manageValue(currentTracker.currentValue);
      _maxValueController.text = manageValue(currentTracker.maxValue);

      setState(() {
        minValueActive = currentTracker.editMin!;
        currentValueActive = currentTracker.editCurrent!;
        maxValueActive = currentTracker.editMax!;
      });
    }

    List<Widget> controls = [];

    // ADD NUMERIC TRACKERS
    for (var tracker in trackers) {
      controls.add(
        trackerOptionButton(
            images: tracker.images,
            label: tracker.label,
            id: tracker.label,
            selectedId: selectedTrackerType,
            onSelect: handleSelection),
      );
    }

    Column body() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(child: Text('Tracker Name')),
          const Gap(),
          CupertinoTextField(
            autofocus: true,
            controller: _trackerNameController,
            placeholder: 'Tracker name',
            onChanged: (value) {
              setState(() {
                _trackerNameController.text = value;
              });
            },
          ),
          const Gap(),

          const Divider(),
          const Gap(),
          const Center(child: Text('Select Tracker Type')),
          const Gap(),
          SizedBox(
            height: 260.0,
            child: SingleChildScrollView(
              child: Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: [...controls],
              ),
            ),
          ),
          const Divider(),
          // TODO: ONLY SHOW FOR SPECIFIC TRACKERS

          SizedBox(
            height: 100.0,
            child: RangeValuesForm(
              minValueActive: minValueActive,
              currentValueActive: currentValueActive,
              maxValueActive: maxValueActive,
              minValueController: _minValueController,
              currentValueController: _currentValueController,
              maxValueController: _maxValueController,
              setMinValueText: setMinValueText,
              setCurrentValueText: setCurrentValueText,
              setMaxValueText: setMaxValueText,
            ),
          ),
          const CupertinoTextField(),
          const Divider(),
          GroupPicker(
              appState: widget.appState,
              initialGroupId: 'group-trackers',
              onChange: (groupName) {
                setState(() {
                  selectedGroup = groupName;
                });
              }),
        ],
      );
    }

    return PopupLayout(
      header: const PopupLayoutHeader(label: 'Add Tracker'),
      body: body(),
      footer: buttonBar(),
    );
  }

  void setMinValueText(value) {
    setState(() {
      _minValueController.text = value;
    });
  }

  void setCurrentValueText(value) {
    setState(() {
      _currentValueController.text = value;
    });
  }

  void setMaxValueText(value) {
    setState(() {
      _maxValueController.text = value;
    });
  }

  Row buttonBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CupertinoButton(
            color: kSubmitColor,
            onPressed:
                (_trackerNameController.text == '') ? null : handleSubmit,
            child: const Text('Save')),
        const Gap(),
        CupertinoButton(
            color: CupertinoColors.inactiveGray,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel')),
      ],
    );
  }

  void handleSubmit() {
    if (_trackerNameController.text == '') {
      return;
    }
    TrackerOptions currentTracker = trackers.firstWhere((tracker) {
      return tracker.label == selectedTrackerType;
    });

    TrackerEntry entry = TrackerEntry(
      label: _trackerNameController.text,
      minValue: currentTracker.minValue != null
          ? parseString(_minValueController.text)
          : null,
      currentValue: parseString(_currentValueController.text),
      maxValue: currentTracker.maxValue != null
          ? parseString(_maxValueController.text)
          : null,
      controlType: currentTracker.type,
    );

    widget.appState.addTrackerEntry(entry);
    widget.appState.addToGroup(controlId: entry.id, groupId: selectedGroup);
    Navigator.pop(context);
  }
}
