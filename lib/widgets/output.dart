import 'package:flutter/cupertino.dart';
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
            Radius.circular(10.0),
          ),
        ),
        child: RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.white,
            ),
            children: <TextSpan>[
              TextSpan(text: 'Hello'),
              TextSpan(
                  text: 'World', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
