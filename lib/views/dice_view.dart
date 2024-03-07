import 'package:flutter/material.dart';
import 'package:mini_solo/widgets/view_wrapper.dart';

class DiceView extends StatelessWidget {
  const DiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ViewWrapper(
      children: [
        Text('Traditional dice'),
        Text('Zocchi dice'),
        Text('Genesys dice'),
        Text('Story dice'),
      ],
    );
  }
}
