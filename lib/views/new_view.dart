import 'package:flutter/cupertino.dart';
import 'package:mini_solo/views/new/new_5room.dart';
import 'package:mini_solo/views/new/new_clue.dart';
import 'package:mini_solo/views/new/new_creature.dart';
import 'package:mini_solo/views/new/new_faction.dart';
import 'package:mini_solo/views/new/new_person.dart';
import 'package:mini_solo/views/new/new_place.dart';
import 'package:mini_solo/views/new/new_thing.dart';
import 'package:mini_solo/widgets/view_wrapper.dart';

import '../widgets/build_popup.dart';
import '../widgets/list_button.dart';
import '../widgets/menuSpacer.dart';
import 'new/new_scene.dart';

class NewView extends StatelessWidget {
  const NewView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewWrapper(children: [
      const Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Create a new ...',
            style: TextStyle(
              fontSize: 32,
            ),
          ),
        ),
      ),
      ListButton(label: 'Scene', onPressed: () => buildNewScene(context)),
      menuSpacer(),
      ListButton(label: 'Person', onPressed: () => buildNewPerson(context)),
      ListButton(label: 'Place', onPressed: () => buildNewPlace(context)),
      ListButton(label: 'Thing', onPressed: () => buildNewThing(context)),
      ListButton(label: 'Faction', onPressed: () => buildNewFaction(context)),
      ListButton(label: 'Clue', onPressed: () => buildNewClue(context)),
      menuSpacer(),
      ListButton(label: 'Creature', onPressed: () => buildNewCreature(context)),
      ListButton(
          label: '5 Room Dungeon', onPressed: () => buildNew5Room(context)),
    ]);
  }

  Future<dynamic> buildNewScene(BuildContext context) {
    return buildPopup(context, 'New Scene', const NewSceneMenu());
  }

  Future<dynamic> buildNewPerson(BuildContext context) {
    return buildPopup(context, 'New Person', const NewPersonMenu());
  }

  Future<dynamic> buildNewPlace(BuildContext context) {
    return buildPopup(context, 'New Place', const NewPlaceMenu());
  }

  Future<dynamic> buildNewThing(BuildContext context) {
    return buildPopup(context, 'New Thing', const NewThingMenu());
  }

  Future<dynamic> buildNewFaction(BuildContext context) {
    return buildPopup(context, 'New Faction', const NewFactionMenu());
  }

  Future<dynamic> buildNewClue(BuildContext context) {
    return buildPopup(context, 'New Clue', const NewClueMenu());
  }

  Future<dynamic> buildNewCreature(BuildContext context) {
    return buildPopup(context, 'New Creature', const NewCreatureMenu());
  }

  Future<dynamic> buildNew5Room(BuildContext context) {
    return buildPopup(context, 'New 5 Room Dungeon', const New5RoomMenu());
  }
}
