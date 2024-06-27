import 'package:flutter/cupertino.dart';

import '../constants.dart';

class Picker extends StatefulWidget {
  const Picker({
    super.key,
    required this.items,
    required this.onChange,
    this.initialItem = 0,
  });

  final List<String> items;
  final void Function(int index) onChange;
  final int initialItem;

  @override
  State<Picker> createState() => _PickerState();
}

class _PickerState extends State<Picker> {
  int _selectedItemIndex = 0;
  late FixedExtentScrollController _controller;

  @override
  void initState() {
    super.initState();
    _selectedItemIndex = widget.initialItem;
    _controller = FixedExtentScrollController(initialItem: widget.initialItem);
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
    List<Widget> pickerItems =
        List<Widget>.generate(widget.items.length, (int index) {
      return Center(child: Text(widget.items[index]));
    });

    return CupertinoButton(
        padding: EdgeInsets.zero,
        child: Container(
          // margin: EdgeInsets.zero,
          padding: const EdgeInsets.all(8.0),
          // width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
          child: Text(
            overflow: TextOverflow.ellipsis,
            widget.items[_selectedItemIndex],
            style: const TextStyle(
              fontSize: 18.0,
            ),
          ),
        ),
        onPressed: () {
          _showDialog(
            CupertinoPicker(
              scrollController: _controller,
              magnification: 1.22,
              squeeze: 1.2,
              useMagnifier: true,
              itemExtent: kItemExtent,
              // looping: true,
              onSelectedItemChanged: (int selectedItemIndex) {
                setState(() {
                  _selectedItemIndex = selectedItemIndex;
                });
                widget.onChange(selectedItemIndex);
              },
              children: pickerItems,
            ),
          );
        });
  }
}
