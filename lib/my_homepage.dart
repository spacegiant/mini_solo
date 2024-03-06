import 'package:flutter/cupertino.dart';
import 'package:mini_solo/views/clue_view.dart';
import 'package:mini_solo/views/dice_view.dart';
import 'package:mini_solo/views/faction_view.dart';
import 'package:mini_solo/views/lists_view.dart';
import 'package:mini_solo/views/person_view.dart';
import 'package:mini_solo/views/place_view.dart';
import 'package:mini_solo/views/thing_view.dart';
import 'package:mini_solo/widgets/random_buttons.dart';
import 'package:mini_solo/widgets/dice_bar.dart';
import 'package:mini_solo/widgets/output.dart';

class DividerView extends StatelessWidget {
  const DividerView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class MyHomePageIOS extends StatefulWidget {
  const MyHomePageIOS({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<MyHomePageIOS> createState() => _MyHomePageIOSState();
}

class _MyHomePageIOSState extends State<MyHomePageIOS> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      backgroundColor: CupertinoColors.systemGreen,
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
              label: 'Person', icon: Icon(CupertinoIcons.person)),
          BottomNavigationBarItem(
              label: 'Place', icon: Icon(CupertinoIcons.placemark)),
          BottomNavigationBarItem(
              label: 'Thing', icon: Icon(CupertinoIcons.bag)),
          BottomNavigationBarItem(
              label: 'Faction', icon: Icon(CupertinoIcons.group)),
          BottomNavigationBarItem(
              label: 'Clue', icon: Icon(CupertinoIcons.zoom_in)),
          BottomNavigationBarItem(
              label: 'Lists', icon: Icon(CupertinoIcons.pen)),
          BottomNavigationBarItem(
              label: 'Dice', icon: Icon(CupertinoIcons.cube)),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            return CupertinoPageScaffold(
              navigationBar: const CupertinoNavigationBar(
                middle: Text('Solo app'),
              ),
              child: Center(
                child: CupertinoButton(
                  onPressed: handleSettingsPressed,
                  child: [
                    const PersonView(),
                    const PlaceView(),
                    const ThingView(),
                    const FactionView(),
                    const ClueView(),
                    const ListsView(),
                    const DiceView(),
                  ][index],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

void handleSettingsPressed() {
  print('pressed');
}
