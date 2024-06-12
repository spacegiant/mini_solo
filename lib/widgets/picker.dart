import 'package:flutter/cupertino.dart';

import '../constants.dart';

class Picker extends StatefulWidget {
  const Picker({
    super.key,
    required this.items,
    required this.onChange,
  });

  final List<String> items;
  final void Function(int index) onChange;

  @override
  State<Picker> createState() => _PickerState();
}

class _PickerState extends State<Picker> {
  int _selectedItem = 0;

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
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
          child: Text(
            widget.items[_selectedItem],
            style: const TextStyle(
              fontSize: 18.0,
            ),
          ),
        ),
        onPressed: () => _showDialog(
              CupertinoPicker(
                magnification: 1.22,
                squeeze: 1.2,
                useMagnifier: true,
                itemExtent: kItemExtent,
                looping: true,
                onSelectedItemChanged: (int selectedItem) {
                  setState(() {
                    _selectedItem = selectedItem;
                  });
                  widget.onChange(selectedItem);
                },
                children: pickerItems,
              ),
            ));
  }
}
