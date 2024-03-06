import 'package:flutter/material.dart';

class DiceView extends StatelessWidget {
  const DiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Traditional dice'),
        Text('Zocchi dice'),
        Text('Genesys dice'),
        Text('Story dice'),
      ],
    );
  }
}
