import 'package:flutter/cupertino.dart';
import 'package:mini_solo/widgets/view_wrapper.dart';

import '../widgets/list_button.dart';

class StarredView extends StatelessWidget {
  const StarredView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewWrapper(children: [
      const Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Starred Items',
            style: TextStyle(
              fontSize: 32,
            ),
          ),
        ),
      ),
      const Text('People'),
      ListButton(label: const Text('Tinky Chenko'), onPressed: () => {}),
      const Text('Places'),
      ListButton(label: const Text('Starraria'), onPressed: () => {}),
      const Text('Things'),
      ListButton(label: const Text('Sword of Omens'), onPressed: () => {}),
      const Text('Factions'),
      ListButton(label: const Text('Bottle Washers Guild'), onPressed: () => {}),
    ]);
  }
}
