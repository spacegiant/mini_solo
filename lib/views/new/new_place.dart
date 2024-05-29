import 'package:flutter/cupertino.dart';
import '../../widgets/list_button.dart';
import '../../widgets/view_wrapper.dart';

class NewPlaceMenu extends StatefulWidget {
  const NewPlaceMenu({super.key});

  @override
  State<NewPlaceMenu> createState() => _NewPlaceMenuState();
}

class _NewPlaceMenuState extends State<NewPlaceMenu> {
  String type = '...';
  String line1 = '...';
  String? line2;
  String? line3;

  @override
  Widget build(BuildContext context) {
    return ViewWrapper(children: [
      ListButton(
        label: 'Place Name',
        onPressed: () {
          print('Pressed');
        },
      ),
      ListButton(
        label: 'Add Feature',
        onPressed: () {
          print('Pressed');
        },
      ),
      ListButton(
        label: 'Problem',
        onPressed: () {
          print('Pressed');
        },
      ),
      ListButton(
        label: 'Famed for...',
        onPressed: () {
          print('Pressed');
        },
      ),
      ListButton(
        label: 'Details',
        onPressed: () {
          print('Pressed');
        },
      ),
    ]);
  }
}
