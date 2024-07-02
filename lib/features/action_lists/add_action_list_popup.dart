import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/app_state.dart';
import '../../widgets/popups/popup_layout.dart';

class AddActionListPopup extends StatelessWidget {
  const AddActionListPopup({
    super.key,
    required this.appState,
    this.id,
  });

  final AppState appState;
  final String? id;

  @override
  Widget build(BuildContext context) {
    return const PopupLayout(
      header: Text('HEADER'),
      body: Text('BODY'),
      footer: Text('FOOTER'),
    );
  }
}
