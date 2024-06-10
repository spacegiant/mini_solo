import 'package:flutter/cupertino.dart';
import 'package:mini_solo/data/app_state.dart';

import '../gap.dart';
import '../picker.dart';

const List<String> _trackerTypes = <String>[
  'Clock',
  'Bar',
  'Ironsworn Track',
  'Pips',
  'Value',
];

class ManageTrackerPopup extends StatelessWidget {
  const ManageTrackerPopup({
    super.key,
    required this.appState,
    this.id,
  });

  final AppState appState;
  final String? id;

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text('Manage Tracker'),
          Gap(),
          Text('Tracker Name'),
          CupertinoTextField(),
          Gap(),
          Picker(
            items: _trackerTypes,
          ),
        ],
      ),
    );
  }
}
