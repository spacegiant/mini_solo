import 'package:flutter/cupertino.dart';

class MySlider extends StatefulWidget {
  const MySlider({
    super.key,
  });

  @override
  State<MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  double sliderValue = 6.00;

  @override
  Widget build(BuildContext context) {
    String stringValue = sliderValue.toStringAsFixed(0);
    return Row(
      children: [
        CupertinoSlider(
          value: sliderValue,
          min: 4.00,
          max: 8.00,
          divisions: 2,
          onChanged: (value) {
            setState(() {
              sliderValue = value;
            });
          },
        ),
        Text(stringValue),
      ],
    );
  }
}
