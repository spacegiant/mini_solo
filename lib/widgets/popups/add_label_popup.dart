import 'package:flutter/cupertino.dart';

import '../../data/app_state.dart';

class AddLabelPopup extends StatefulWidget {
  const AddLabelPopup({super.key, required this.appState});

  final AppState appState;

  @override
  State<AddLabelPopup> createState() => _AddLabelPopupState();
}

class _AddLabelPopupState extends State<AddLabelPopup> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
