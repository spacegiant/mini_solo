import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mini_solo/widgets/user_input.dart';

enum GameMode {
  combat,
  social,
  exploration,
  travel,
  investigate,
}

class AddToJournalPanel extends StatefulWidget {
  const AddToJournalPanel({super.key});

  @override
  State<AddToJournalPanel> createState() => _AddToJournalPanelState();
}

class _AddToJournalPanelState extends State<AddToJournalPanel> {
  GameMode selectedSegment = GameMode.exploration;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CupertinoSegmentedControl(
          groupValue: selectedSegment,
          children: const <GameMode, Widget>{
            GameMode.exploration: Padding(
              padding: EdgeInsets.all(10.0),
              child: FaIcon(FontAwesomeIcons.campground),
            ),
            GameMode.combat: Icon(FontAwesomeIcons.handBackFist),
            GameMode.social: Icon(CupertinoIcons.bubble_left_bubble_right),
            GameMode.travel: Icon(FontAwesomeIcons.horseHead),
            GameMode.investigate: Icon(FontAwesomeIcons.magnifyingGlass),
          },
          onValueChanged: (GameMode? value) {
            if (value != null) {
              setState(() {
                selectedSegment = value;
              });
            }
          },
        ),
        const UserInput(),
      ],
    );
  }
}
