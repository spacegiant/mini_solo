import 'package:flutter/cupertino.dart';

import '../constants.dart';
import 'gap.dart';

class RangeValuesForm extends StatelessWidget {
  const RangeValuesForm({
    super.key,
    required this.minValueActive,
    required this.currentValueActive,
    required this.maxValueActive,
    required this.minValueController,
    required this.currentValueController,
    required this.maxValueController,
    required this.setMinValueText,
    required this.setCurrentValueText,
    required this.setMaxValueText,
  });

  final bool minValueActive;
  final bool currentValueActive;
  final bool maxValueActive;
  final TextEditingController minValueController;
  final TextEditingController currentValueController;
  final TextEditingController maxValueController;
  final Function(String) setMinValueText;
  final Function(String) setCurrentValueText;
  final Function(String) setMaxValueText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: FormElement(
            isActive: minValueActive,
            controller: minValueController,
            errorText: _minValueErrorText,
            onChanged: setMinValueText,
            label: 'Min Value',
          ),
        ),
        const Gap(),
        Flexible(
          child: FormElement(
            isActive: currentValueActive,
            controller: currentValueController,
            errorText: _currentValueErrorText,
            onChanged: setCurrentValueText,
            label: 'Current Value',
          ),
        ),
        const Gap(),
        Flexible(
          child: FormElement(
            isActive: maxValueActive,
            controller: maxValueController,
            errorText: _maxValueErrorText,
            onChanged: setMaxValueText,
            label: 'Max Value',
          ),
        ),
      ],
    );
  }

  String? get _minValueErrorText {
    if (minValueActive == false) return null;

    final text = minValueController.value.text.trim();
    if (text.isEmpty) return 'Needs a value';
    try {
      int.parse(text);
    } catch (e) {
      return 'Needs a number';
    }

    return null;
  }

  String? get _currentValueErrorText {
    if (currentValueActive == false) return null;

    int currentValue = 0;
    int? maxValue;
    int? minValue;
    final currentValueText = currentValueController.value.text.trim();
    final maxValueText = maxValueController.value.text.trim();
    final minValueText = minValueController.value.text.trim();

    if (currentValueText.isEmpty) return 'Needs a value';

    try {
      currentValue = int.parse(currentValueText);
    } catch (e) {
      return 'Needs a number';
    }

    try {
      maxValue = int.parse(maxValueText);
    } catch (e) {
      // return maxValue as null
    }

    try {
      minValue = int.parse(minValueText);
    } catch (e) {
      // return minValue as null
    }

    if (maxValue != null && currentValue > maxValue) return 'Higher than max';
    if (minValue != null && currentValue < minValue) return 'Lower than min';
    return null;
  }

  String? get _maxValueErrorText {
    if (maxValueActive == false) return null;

    final text = maxValueController.value.text.trim();
    if (text.isEmpty) return 'Needs a value';

    try {
      int.parse(text);
    } catch (e) {
      print('Error parsing string _maxValueErrorText: $e');
      return 'Needs a number';
    }

    return null;
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

    if (_errorText != null && isActive == true) {
      showErrorColour = true;
    }

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
