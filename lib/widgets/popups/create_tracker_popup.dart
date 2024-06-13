import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mini_solo/constants.dart';
import 'package:mini_solo/data/app_state.dart';

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
          rangeValues(),
          const Divider(),
          const Gap(),
          const Center(child: Text('Select Tracker Type')),
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

  String? get _minValueErrorText {
    if (minValueActive == false) return null;

    final text = _minValueController.value.text.trim();
    if (text.isEmpty) return 'Needs a value';
    try {
      int.parse(text);
    } catch (e) {
      print(e);
      return 'Needs a number';
    }

    return null;
  }

  String? get _currentValueErrorText {
    if (currentValueActive == false) return null;

    int currentValue = 0;
    int maxValue = 0;
    int minValue = 0;
    final currentValueText = _currentValueController.value.text.trim();
    final maxValueText = _maxValueController.value.text.trim();
    final minValueText = _minValueController.value.text.trim();

    if (currentValueText.isEmpty) return 'Needs a value';

    try {
      currentValue = int.parse(currentValueText);
    } catch (e) {
      print(e);
      return 'Needs a number';
    }

    try {
      maxValue = int.parse(maxValueText);
    } catch (e) {
      print(e);
      return null;
    }

    try {
      minValue = int.parse(minValueText);
    } catch (e) {
      print(e);
      return null;
    }

    if (currentValue > maxValue) return 'Higher than max';
    if (currentValue < minValue) return 'Lower than min';
    return null;
  }

  String? get _maxValueErrorText {
    if (maxValueActive == false) return null;

    final text = _maxValueController.value.text.trim();
    if (text.isEmpty) return 'Needs a value';

    try {
      int.parse(text);
    } catch (e) {
      print(e);
      return 'Needs a number';
    }

    return null;
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

  Widget rangeValues() {
    return Row(
      children: [
        Flexible(
          child: FormElement(
            isActive: minValueActive,
            controller: _minValueController,
            errorText: _minValueErrorText,
            onChanged: setMinValueText,
            label: 'Min Value',
          ),
        ),
        const Gap(),
        Flexible(
          child: FormElement(
            isActive: currentValueActive,
            controller: _currentValueController,
            errorText: _currentValueErrorText,
            onChanged: setCurrentValueText,
            label: 'Current Value',
          ),
        ),
        const Gap(),
        Flexible(
          child: FormElement(
            isActive: maxValueActive,
            controller: _maxValueController,
            errorText: _maxValueErrorText,
            onChanged: setMaxValueText,
            label: 'Max Value',
          ),
        ),
      ],
    );
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
      minValue: parseString(_minValueController.text),
      currentValue: parseString(_currentValueController.text),
      maxValue: parseString(_maxValueController.text),
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

class FormElement extends StatelessWidget {
  const FormElement({
    super.key,
    required this.isActive,
    required TextEditingController controller,
    required String? errorText,
    required this.onChanged,
    required this.label,
  })  : _valueController = controller,
        _errorText = errorText;

  final bool isActive;
  final TextEditingController _valueController;
  final String? _errorText;
  final Function(String) onChanged;
  final String label;

  @override
  Widget build(BuildContext context) {
    bool showErrorColour = false;
    bool hasErrorText = _errorText == null;

    if (_errorText != null && isActive == true) {
      showErrorColour = true;
    }

    print('$_errorText $hasErrorText $showErrorColour');

    return Opacity(
      opacity: isActive == true ? 1.0 : 0.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          const Gap(height: 4.0),
          CupertinoTextField(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(kInputBorderRadius),
              color: CupertinoColors.white,
              border: Border.all(
                color: (showErrorColour == true)
                    ? CupertinoColors.systemRed
                    : CupertinoColors.white,
                width: 2.0,
                strokeAlign: BorderSide.strokeAlignOutside,
              ),
            ),
            enabled: isActive,
            controller: _valueController,
            placeholder: 'current value',
            onChanged: onChanged,
          ),
          const Gap(height: 4.0),
          Text(
            _errorText ?? '',
            style: const TextStyle(fontSize: 11.0),
          ),
        ],
      ),
    );
  }
}
