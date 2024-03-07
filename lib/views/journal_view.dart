import 'package:flutter/cupertino.dart';
import 'package:mini_solo/widgets/view_wrapper.dart';

class JournalView extends StatelessWidget {
  const JournalView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ViewWrapper(children: [
      Text('Journal View'),
      Text('Filter needed'),
    ]);
  }
}
