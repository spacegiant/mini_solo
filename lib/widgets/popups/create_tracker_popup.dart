import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mini_solo/constants.dart';
import 'package:mini_solo/data/app_state.dart';
import 'package:mini_solo/widgets/range_values_form.dart';

import '../../data/campaign_data.dart';
import '../../features/trackers/tracker_options.dart';
import '../../svg_icon.dart';
import '../gap.dart';

class CreateTrackerPopup extends StatefulWidget {
  const CreateTrackerPopup({
    super.key,
    required this.appState,
    this.id,
  });

  final AppState appState;
  final String? id;

  @override
  State<CreateTrackerPopup> createState() => _CreateTrackerPopupState();
}

class _CreateTrackerPopupState extends State<CreateTrackerPopup> {
  String selectedTrackerType = '';
  bool minValueActive = false;
  bool currentValueActive = false;
  bool maxValueActive = false;
  String minValueError = '';
  String currentValueError = '';
  String maxValueError = '';

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

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
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
          RangeValuesForm(
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
          const Divider(),
          const Gap(),
          const Center(child: Text('Select Tracker Type')),
          const Gap(),
          SizedBox(
            height: 310.0,
            child: SingleChildScrollView(
              child: Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: [...controls],
              ),
            ),
          ),
          const Divider(),
          const Gap(),
          buttonBar(),
        ],
      ),
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

  Widget trackerOptionButton({
    required List<SVGIcon> images,
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
                (_trackerNameController.text == '') ? null : handleSubmit,
            child: const Text('Save')),
        const Gap(),
        CupertinoButton(
            color: CupertinoColors.inactiveGray,
            onPressed: () {
              widget.appState.closePopup();
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

    widget.appState.addTrackerEntry(TrackerEntry(
      label: _trackerNameController.text,
      minValue: currentTracker.minValue != null
          ? parseString(_minValueController.text)
          : null,
      currentValue: parseString(_currentValueController.text),
      maxValue: currentTracker.maxValue != null
          ? parseString(_maxValueController.text)
          : null,
      trackerType: currentTracker.type,
    ));
    widget.appState.closePopup();
  }

  String manageValue(int? value) {
    if (value != null) {
      return value.toString();
    } else {
      return '';
    }
  }

  int parseString(String text) {
    try {
      int value = int.parse(text);
      return value;
    } catch (e) {
      if (kDebugMode) {
        print('parseString() failed. $e');
      }
      return 0;
    }
  }
}
