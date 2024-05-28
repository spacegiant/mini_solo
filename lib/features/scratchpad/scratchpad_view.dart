import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../data/app_state.dart';

class ScratchpadView extends StatefulWidget {
  const ScratchpadView({super.key});

  @override
  State<ScratchpadView> createState() => _ScratchpadViewState();
}

class _ScratchpadViewState extends State<ScratchpadView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (context, appState, child) {
      return const Placeholder();
    });
  }
}
