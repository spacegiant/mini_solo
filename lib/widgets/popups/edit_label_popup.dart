import 'package:flutter/cupertino.dart';

import '../../data/app_state.dart';

class EditLabelPopup extends StatefulWidget {
  const EditLabelPopup({super.key, required this.appState});

  final AppState appState;

  @override
  State<EditLabelPopup> createState() => _EditLabelPopupState();
}

class _EditLabelPopupState extends State<EditLabelPopup> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
