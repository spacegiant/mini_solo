import 'package:json_annotation/json_annotation.dart';
import 'package:mini_solo/data/campaign_item.dart';

import '../../data/journal_entry_types.dart';
import '../../views/journal/chooseControlWidget.dart';

part 'kard.g.dart';

enum KardLayoutTypes { vertical, horizontal, statBlockList, tabular }

class KardLayout {
  final String label;
  final ControlTypeEnum controlType;

  KardLayout({
    required this.label,
    required this.controlType,
  });
}

Map<KardLayoutTypes, KardLayout> kardLayouts = {
  KardLayoutTypes.vertical: KardLayout(
    label: 'Vertical Layout',
    controlType: ControlTypeEnum.kard,
  ),
  KardLayoutTypes.horizontal: KardLayout(
    label: 'Horizontal Layout',
    controlType: ControlTypeEnum.kard,
  ),
  KardLayoutTypes.statBlockList: KardLayout(
    label: 'Stat Blocks',
    controlType: ControlTypeEnum.kard,
  ),
  KardLayoutTypes.tabular: KardLayout(
    label: 'Tabular Layout',
    controlType: ControlTypeEnum.kard,
  ),
};

@JsonSerializable()
class Kard extends CampaignItem {
  late String title;
  late List<String>? lines;
  late KardLayoutTypes layoutType;
  bool firstLineHeadings;
  bool showHeading;

  Kard({
    required this.title,
    this.lines,
    required this.layoutType,
    this.firstLineHeadings = true,
    this.showHeading = true,
  });

  // coverage:ignore-start

  factory Kard.fromJson(Map<String, dynamic> json) => _$KardFromJson(json);

  Map<String, dynamic> toJson() => _$KardToJson(this);

  @override
  JournalEntryTypes type = JournalEntryTypes.kard;
// coverage:ignore-end
}
