import 'package:flutter/cupertino.dart';

class DiceGlyph extends StatelessWidget {
  const DiceGlyph({
    super.key,
    required this.rolledValue,
    required this.dieType,
  });

  final int rolledValue;
  final String dieType;

  @override
  Widget build(BuildContext context) {
    double circleWidth = 50.0;
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
          height: circleWidth,
          width: circleWidth,
          clipBehavior: Clip.none,
          decoration: const BoxDecoration(
            color: CupertinoColors.systemYellow,
            // borderRadius: BorderRadius.all(Radius.circular(50.0)),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(rolledValue.toString()),
                Text(
                  dieType,
                  style: const TextStyle(
                    fontSize: 10.0,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
