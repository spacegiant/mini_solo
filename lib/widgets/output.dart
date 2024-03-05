import 'package:flutter/material.dart';

class Output extends StatelessWidget {
  const Output({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.pink,
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: const Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sit amet egestas elit.',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
      ),
    );
  }
}
