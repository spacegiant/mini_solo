import 'package:flutter/material.dart';
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 0.0,
          horizontal: 8.0,
        ),
        child: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              _currentPageIndex = index;
            });
          },
          indicatorColor: Colors.amber,
          selectedIndex: _currentPageIndex,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.person), label: 'Person'),
            NavigationDestination(icon: Icon(Icons.place), label: 'Place'),
            NavigationDestination(
                icon: Icon(Icons.emoji_objects), label: 'Thing'),
            NavigationDestination(icon: Icon(Icons.group), label: 'Faction'),
            NavigationDestination(icon: Icon(Icons.zoom_in), label: 'Clue'),
            VerticalDivider(),
            NavigationDestination(icon: Icon(Icons.notes), label: 'Lists'),
            NavigationDestination(icon: Icon(Icons.square), label: 'Dice'),
          ],
        ),
      ),
      body: [
        const PeopleView(),
        const PlaceView(),
        const ThingView(),
        const FactionView(),
        const ClueView(),
        const DividerView(),
        const ListsView(),
        const DiceView(),
      ][_currentPageIndex],
    );
  }
}

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      Output(),
      RandomButtons(),
      DiceBar(),
    ]);
  }
}

class DividerView extends StatelessWidget {
  const DividerView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
