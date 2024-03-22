import 'package:flutter/cupertino.dart';
import 'package:mini_solo/widgets/view_wrapper.dart';

import '../widgets/build_popup.dart';
import '../widgets/list_button.dart';
import 'new/new_scene.dart';

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
      ListButton(label: 'Tinky Chenko', onPressed: () => {}),
      const Text('Places'),
      ListButton(label: 'Starraria', onPressed: () => {}),
      const Text('Things'),
      ListButton(label: 'Sword of Omens', onPressed: () => {}),
      const Text('Factions'),
      ListButton(label: 'Bottle Washers Guild', onPressed: () => {}),
    ]);
  }

  Future<dynamic> buildNewScene(BuildContext context) {
    return buildPopup(context, 'New Scene', const NewSceneMenu());
  }
}
