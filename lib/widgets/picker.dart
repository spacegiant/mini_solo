import 'package:flutter/cupertino.dart';

import '../constants.dart';

class Picker extends StatefulWidget {
  const Picker({
    super.key,
    required this.items,
    required this.onChange,
    this.selectedIndex,
    required this.enabled,
    this.defunctLabel,
    required this.selectedItemIndex,
  });

  final List<String> items;
  final void Function(int? index) onChange;
  final int? selectedIndex;
  final bool enabled;
  final String? defunctLabel;
  final int selectedItemIndex;

  @override
  State<Picker> createState() => _PickerState();
}

class _PickerState extends State<Picker> {
  late int offset;
  late int _selectedItemIndex;
  late List<String> pickerStrings;

  @override
  void initState() {
    super.initState();

    offset = widget.defunctLabel != null ? 1 : 0;
    _selectedItemIndex =
        widget.selectedIndex != null ? widget.selectedIndex! + offset : 0;

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
    _selectedItemIndex =
        widget.selectedIndex != null ? widget.selectedIndex! + offset : 0;

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

    String text = _selectedItemIndex > -1
        ? pickerStrings[_selectedItemIndex]
        : pickerStrings[0];

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
            text,
            style: const TextStyle(
              fontSize: 18.0,
            ),
          ),
        ),
        onPressed: () {
          if (widget.enabled) {
            _showDialog(
              CupertinoPicker(
                scrollController: FixedExtentScrollController(
                    initialItem: _selectedItemIndex),
                magnification: 1.22,
                squeeze: 1.2,
                useMagnifier: true,
                itemExtent: kItemExtent,
                onSelectedItemChanged: (int selectedItemIndex) {
                  setState(() {
                    _selectedItemIndex = selectedItemIndex;
                  });
                  if (widget.defunctLabel != null) {
                    widget.onChange(selectedItemIndex - offset);
                  } else {
                    widget.onChange(selectedItemIndex);
                  }
                },
                children: pickerItems,
              ),
            );
          }
        });
  }
}
