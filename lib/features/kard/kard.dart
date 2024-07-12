import 'package:json_annotation/json_annotation.dart';
import 'package:mini_solo/data/campaign_item.dart';

import '../../data/journal_entry_types.dart';
import '../../views/journal/chooseControlWidget.dart';

part 'kard.g.dart';

enum KardLayoutTypes { vertical, horizontal, statBlock, statBlockList, tabular }

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
  KardLayoutTypes.statBlock: KardLayout(
    label: 'Single Stat Block',
    controlType: ControlTypeEnum.kard,
  ),
  KardLayoutTypes.statBlockList: KardLayout(
    label: 'List of Stat Blocks',
    controlType: ControlTypeEnum.kard,
  ),
  KardLayoutTypes.tabular: KardLayout(
    label: 'Tabular Layout',
    controlType: ControlTypeEnum.kard,
  ),
};

@JsonSerializable()
class Kard extends CampaignItem {
  final String title;
  final List<String>? lines;
  final KardLayoutTypes labelLayout;
  final bool? firstLineHeadings;

  Kard({
    required this.title,
    this.lines,
    required this.labelLayout,
    this.firstLineHeadings = false,
  });

  // coverage:ignore-start

  factory Kard.fromJson(Map<String, dynamic> json) => _$KardFromJson(json);

  Map<String, dynamic> toJson() => _$KardToJson(this);

  @override
  JournalEntryTypes type = JournalEntryTypes.kard;
// coverage:ignore-end
}
