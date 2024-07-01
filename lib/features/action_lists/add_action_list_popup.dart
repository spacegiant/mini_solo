import 'package:flutter/cupertino.dart';

import '../../data/app_state.dart';

class AddActionListPopup extends StatelessWidget {
  const AddActionListPopup({
    super.key,
    required this.appState,
  });

  final AppState appState;

  @override
  Widget build(BuildContext context) {
    return const Text('Add Action List');
  }
}
