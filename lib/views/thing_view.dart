import 'package:flutter/material.dart';
import 'package:mini_solo/widgets/view_wrapper.dart';

class ThingView extends StatelessWidget {
  const ThingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ViewWrapper(children: [
      Text('Thing'),
    ]);
  }
}
