import 'package:flutter/cupertino.dart';

import '../constants.dart';

class Picker extends StatefulWidget {
  const Picker({
    super.key,
    required this.items,
    required this.onChange,
    this.initialItem = 0,
    required this.enabled,
    this.defunctLabel,
    required this.selectedItemIndex,
  });

  final List<String> items;
  final void Function(int? index) onChange;
  final int initialItem;
  final bool enabled;
  final String? defunctLabel;
  final int selectedItemIndex;

  @override
  State<Picker> createState() => _PickerState();
}

class _PickerState extends State<Picker> {
  int _selectedItemIndex = 0;
  late FixedExtentScrollController _controller;
  late List<String> pickerStrings;

  @override
  void initState() {
    super.initState();
    _selectedItemIndex = widget.initialItem;
    _controller = FixedExtentScrollController(initialItem: widget.initialItem);

    pickerStrings = List.from(widget.items);
    if (widget.defunctLabel != null) {
      pickerStrings.insert(0, widget.defunctLabel!);
    }
  }

  void _showDialog(Widget child) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(top: false, child: child),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int offset = widget.defunctLabel != null ? -1 : 0;

    List<Widget> pickerItems = List<Widget>.generate(
      pickerStrings.length,
      (int index) {
        return Center(
          child: Text(
            pickerStrings[index],
          ),
        );
      },
    );

    return CupertinoButton(
        padding: EdgeInsets.zero,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
          child: Text(
            overflow: TextOverflow.ellipsis,
            softWrap: false,
            pickerStrings[_selectedItemIndex],
            style: const TextStyle(
              fontSize: 18.0,
            ),
          ),
        ),
        onPressed: () {
          if (widget.enabled) {
            _showDialog(
              CupertinoPicker(
                scrollController: _controller,
                magnification: 1.22,
                squeeze: 1.2,
                useMagnifier: true,
                itemExtent: kItemExtent,
                onSelectedItemChanged: (int selectedItemIndex) {
                  setState(() {
                    _selectedItemIndex = selectedItemIndex;
                  });
                  if (selectedItemIndex > 0) {
                    widget.onChange(selectedItemIndex + offset);
                  } else {
                    widget.onChange(null);
                  }
                },
                children: pickerItems,
              ),
            );
          }
        });
  }
}
