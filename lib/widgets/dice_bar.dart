import 'package:flutter/material.dart';

class DiceBar extends StatelessWidget {
  const DiceBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.count(
        crossAxisCount: 4,
        shrinkWrap: true,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        children: const [
          DiceButton(label: 'd4', color: Colors.red, textColor: Colors.white),
          DiceButton(label: 'd6', color: Colors.orange),
          DiceButton(label: 'd8', color: Colors.yellow),
          DiceButton(label: 'd10', color: Colors.green),
          DiceButton(label: 'd12', color: Colors.blue),
          DiceButton(
              label: 'd20', color: Colors.indigo, textColor: Colors.white),
          DiceButton(label: 'd100', color: Colors.cyan),
          DiceButton(label: '4dF', color: Colors.pink, textColor: Colors.white),
        ],
      ),
    );
  }
}

class DiceButton extends StatelessWidget {
  const DiceButton({
    super.key,
    required this.label,
    required this.color,
    this.textColor = Colors.black,
  });

  final String label;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      // minWidth: 44,
      // height: 44,
      // padding: const EdgeInsets.all(0),
      child: MaterialButton(
        onPressed: () {
          print('pressed');
        },
        color: color,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 20.0,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
