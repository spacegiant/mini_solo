class CampaignData {
  late String name;
  late List<JournalEntry> journal;
  late List<Person> people;
  late List<Place> places;
  late List<Thing> things;
  late List<Faction> factions;
  late List<Clue> clues;
  late List<Creature> creatures;
  late List<Dungeon> dungeons;

  CampaignData({
    required this.name,
    required this.journal,
    required this.people,
    required this.places,
    required this.things,
    required this.factions,
    required this.clues,
    required this.creatures,
    required this.dungeons,
  });

  CampaignData.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        journal = json['journal'],
        people = json['people'],
        places = json['places'],
        things = json['things'],
        factions = json['factions'],
        clues = json['clues'],
        creatures = json['creatures'],
        dungeons = json['dungeons'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'journal': journal,
        'people': people,
        'places': places,
        'things': things,
        'factions': factions,
        'clues': clues,
        'creatures': creatures,
        'dungeons': dungeons,
      };
}

// TODO: Set up so that each type has different data shape
enum JournalEntryTypes {
  oracle,
  roll,
  action,
  outcome,
  fateCheck,
  newScene,
  newEntity,
  gm,
  pc,
  npc,
  transition,
}

CampaignData initCampaignDataData(String campaignName) {
  return CampaignData(
    name: campaignName,
    journal: [],
    people: [],
    places: [],
    things: [],
    factions: [],
    clues: [],
    creatures: [],
    dungeons: [],
  );
}

abstract class CampaignItem {
  bool isFavourite = false;

  CampaignItem({
    required this.isFavourite,
  });
}

class JournalEntry extends CampaignItem {
  late JournalEntryTypes type;
  String title;
  String? detail;

  JournalEntry({
    required super.isFavourite,
    required this.title,
    required this.type,
    this.detail,
  });
}

class Person extends CampaignItem {
  String firstName;
  String familyName;
  String? detail;

  Person({
    required super.isFavourite,
    required this.firstName,
    required this.familyName,
    this.detail,
  });
}

class Place extends CampaignItem {
  String name;
  String? detail;
  Place? parent;

  Place({
    required super.isFavourite,
    required this.name,
    this.detail,
    this.parent,
  });
}

class Thing extends CampaignItem {
  String name;
  Person? owner;
  String? detail;

  Thing({
    required super.isFavourite,
    required this.name,
    this.owner,
    this.detail,
  });
}

class Faction extends CampaignItem {
  String name;
  String? occupation;
  String? detail;

  Faction({
    required super.isFavourite,
    required this.name,
    this.occupation,
    this.detail,
  });
}

class Clue extends CampaignItem {
  String description;
  String? notes;

  Clue({
    required super.isFavourite,
    required this.description,
    this.notes,
  });
}

class Creature extends CampaignItem {
  String title;
  String? detail;

  Creature({
    required super.isFavourite,
    required this.title,
    this.detail,
  });
}

class DungeonRoom {
  String name;
  String? detail;

  DungeonRoom({
    required this.name,
    this.detail,
  });
}

class Dungeon extends CampaignItem {
  String title;
  List<DungeonRoom>? rooms;

  Dungeon({
    required super.isFavourite,
    required this.title,
    this.rooms,
  });
}
