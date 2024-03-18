import 'dart:math';

class WeightedItem {
  int weight;
  String text;

  WeightedItem({
    required this.weight,
    required this.text,
  });
}

class MythicEventFocusData {
  List<WeightedItem> get table1 => _table1;

  final List<WeightedItem> _table1 = [
    WeightedItem(weight: 5, text: 'Remote Event'),
    WeightedItem(weight: 5, text: 'Ambiguous Event'),
    WeightedItem(weight: 10, text: 'New NPC'),
    WeightedItem(weight: 20, text: 'NPC Action'),
    WeightedItem(weight: 5, text: 'NPC Negative'),
    WeightedItem(weight: 5, text: 'NPC Positive'),
    WeightedItem(weight: 5, text: 'Move Toward a Thread'),
    WeightedItem(weight: 10, text: 'Move Away from a Thread'),
    WeightedItem(weight: 5, text: 'Close a Thread'),
    WeightedItem(weight: 10, text: 'PC Negative'),
    WeightedItem(weight: 5, text: 'PC Positive'),
    WeightedItem(weight: 15, text: 'Current Context'),
  ];
}
