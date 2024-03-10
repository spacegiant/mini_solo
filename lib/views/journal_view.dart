import 'package:flutter/cupertino.dart';
import 'package:mini_solo/widgets/list_button.dart';
import 'package:mini_solo/widgets/view_wrapper.dart';

class JournalView extends StatelessWidget {
  const JournalView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewWrapper(children: [
      const Text('Journal View'),
      const Text('Filter needed'),
      ListButton(
        label: 'Check Scene',
        onPressed: () {},
      ),
      ListButton(
        label: 'Detail Check',
        onPressed: () {},
      ),
      ListButton(
        label: 'Event Check',
        onPressed: () {},
      ),
      ListButton(
        label: 'Fate Check',
        onPressed: () {},
      ),
      ListButton(
        label: 'End Scene',
        onPressed: () {},
      )
    ]);
  }
}
