import 'package:flutter/cupertino.dart';

const double _kItemExtent = 32.0;

class Picker extends StatefulWidget {
  const Picker({
    super.key,
    required this.items,
  });

  final List<String> items;

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
            ));
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pickerItems =
        List<Widget>.generate(widget.items.length, (int index) {
      return Center(child: Text(widget.items[index]));
    });

    return CupertinoButton(
        child: Text(
          widget.items[_selectedItem],
          style: const TextStyle(
            fontSize: 22.0,
          ),
        ),
        onPressed: () => _showDialog(
              CupertinoPicker(
                magnification: 1.22,
                squeeze: 1.2,
                useMagnifier: true,
                itemExtent: _kItemExtent,
                onSelectedItemChanged: (int selectedItem) {
                  setState(() {
                    _selectedItem = selectedItem;
                  });
                },
                children: pickerItems,
              ),
            ));
  }
}
