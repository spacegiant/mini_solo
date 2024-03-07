import 'package:flutter/cupertino.dart';
import 'package:mini_solo/widgets/view_wrapper.dart';

class TrackerView extends StatelessWidget {
  const TrackerView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ViewWrapper(children: [
      Text('Existing tracker here (pip)'),
      Text('Existing tracker here (clock)'),
      Text('Existing tracker here (timer - shadowdark torch)'),
      Text('Add new tracker'),
    ]);
  }
}
