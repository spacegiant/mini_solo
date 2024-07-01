import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:mini_solo/views/settings/dev_settings.dart';
import 'package:mini_solo/views/settings/dice_settings.dart';
import 'package:mini_solo/views/settings/general_settings.dart';
import 'package:mini_solo/views/settings/theme_settings.dart';
import 'package:provider/provider.dart';

import '../data/app_settings_data.dart';
import '../data/app_state.dart';
import '../data/campaign_data.dart';
import '../features/random_tables/edit_random_tables_popup.dart';
import '../widgets/gap.dart';
import '../widgets/popups/edit_groups_popup.dart';
import '../widgets/popups/import_manager.dart';
import '../widgets/popups/toggle_show_popup.dart';

enum Category { general, campaign, tools }

Widget? getSettingsPage(Category category, AppState appState) {
  Map<Category, Widget> settingsPages = <Category, Widget>{
    Category.general: const GeneralSettings(),
    Category.campaign: CampaignSettings(appState: appState),
    Category.tools: const ToolsSettings(),
  };

  return settingsPages[category];
}

class SettingsView extends StatefulWidget {
  const SettingsView({
    super.key,
    required this.title,
    required this.closeSettings,
    required this.appState,
  });

  final String title;
  final VoidCallback closeSettings;
  final AppState appState;

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  Category _selectedSegment = Category.general;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoButton(
          onPressed: widget.closeSettings,
          padding: const EdgeInsets.all(0.0),
          child: const Icon(CupertinoIcons.back),
        ),
        middle: Text('${widget.title} Settings'),
      ),
      child: SafeArea(
        child: Column(
          children: [
            CupertinoNavigationBar(
              middle: CupertinoSegmentedControl<Category>(
                groupValue: _selectedSegment,
                onValueChanged: (Category value) {
                  setState(() {
                    _selectedSegment = value;
                  });
                },
                children: const {
                  Category.general: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text('General'),
                  ),
                  Category.campaign: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text('Campaign'),
                  ),
                  Category.tools: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text('Tools'),
                  ),
                },
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                // child: settingsPages[_selectedSegment],
                child: getSettingsPage(_selectedSegment, widget.appState),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsOption extends StatelessWidget {
  const SettingsOption({
    super.key,
    required this.isActive,
    required this.label,
    required this.onChanged,
    this.alignEnd,
  });

  final bool isActive;
  final String label;
  final void Function(bool?)? onChanged;
  final bool? alignEnd;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CupertinoCheckbox(
          value: isActive,
          onChanged: onChanged,
        ),
        Text(label)
      ],
    );
  }
}

class SettingsHeading extends StatelessWidget {
  const SettingsHeading({
    super.key,
    required this.label,
    this.checkAll,
    this.onChanged,
  });

  final String label;
  final bool? checkAll;
  final void Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: CupertinoColors.systemBlue,
        width: 1.0,
      ))),
      child: Row(
        children: [
          Text(label),
          checkAll != null ? const Text(' - use all? ') : Container(),
          checkAll != null
              ? CupertinoCheckbox(value: checkAll, onChanged: onChanged)
              : Container(),
        ],
      ),
    );
  }
}

class GeneralSettings extends StatefulWidget {
  const GeneralSettings({super.key});

  @override
  State<GeneralSettings> createState() => _GeneralSettingsState();
}

class _GeneralSettingsState extends State<GeneralSettings> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (BuildContext context, appState, Widget? child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...devSettings(appState),
              const Gap(),
              ...generalSettings(appState),
              const Gap(),
              ...diceSettings(appState),
              const Gap(),
              ...themeSettings(appState),
            ],
          ),
        );
      },
    );
  }
}

class CampaignSettings extends StatefulWidget {
  const CampaignSettings({super.key, required this.appState});

  final AppState appState;

  @override
  State<CampaignSettings> createState() => _CampaignSettingsState();
}

class _CampaignSettingsState extends State<CampaignSettings> {
  late bool diceActive = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    diceActive = widget.appState.campaignData!.settings.general.diceActive;
  }

  // return Consumer<AppState>(
  // builder: (BuildContext context, appState, Widget? child) {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              CupertinoSwitch(
                  value:
                      widget.appState.campaignData!.settings.general.diceActive,
                  onChanged: (value) {
                    setState(() {
                      diceActive = !diceActive;
                    });
                    widget.appState.campaignData?.settings.general.diceActive =
                        diceActive;
                  }),
              const Text('Use dice?'),
            ],
          ),
          CupertinoButton(
            child: const Text('Manage Groups'),
            onPressed: () {
              toggleShowPopup2(
                  maxWidth: 400.0,
                  maxHeight: 740.0,
                  child: EditGroupsPopup(appState: widget.appState),
                  context: context);
            },
          ),
          CupertinoButton(
            child: const Text('Manage Random Tables'),
            onPressed: () {
              toggleShowPopup2(
                  maxWidth: 400.0,
                  maxHeight: 740.0,
                  child: EditRandomTablesPopup(appState: widget.appState),
                  context: context);
            },
          ),
          // TODO:
          const Text('dropdown goes here - select current campaign'),
          SettingsOption(
            isActive: true,
            label: 'Copy to clipboard automatically',
            onChanged: (isChecked) {},
          ),
          CupertinoButton(
              child: const Text('Export Campaign to Clipboard'),
              onPressed: () {
                // TODO
              }),
          CupertinoButton(
              child: const Text('Export App Settings to Clipboard'),
              onPressed: () {
                // TODO
              }),

          CupertinoButton(
              child: const Text('Import Manager'),
              onPressed: () {
                toggleShowPopup2(
                    maxHeight: 560.0,
                    maxWidth: 400.0,
                    child: ImportManager(appState: widget.appState),
                    context: context);
              }),
          CupertinoButton(
              child: const Text('Export Campaign'),
              onPressed: () async {
                CampaignData? campaignData = widget.appState.campaignData;
                String jsonString =
                    widget.appState.storage.getCampaignJSON(campaignData!);
                await Clipboard.setData(ClipboardData(text: jsonString));
                // copied successfully
              }),
          CupertinoButton(
              child: const Text('Export AppSettings'),
              onPressed: () async {
                AppSettingsData? appSettingsData =
                    widget.appState.appSettingsData;
                String jsonString =
                    widget.appState.storage.appSettingsToJSON(appSettingsData);
                await Clipboard.setData(ClipboardData(text: jsonString));
                // copied successfully
              }),
        ],
      ),
    );
  }
}

class ToolsSettings extends StatefulWidget {
  const ToolsSettings({super.key});

  @override
  State<ToolsSettings> createState() => _ToolsSettingsState();
}

class _ToolsSettingsState extends State<ToolsSettings> {
  bool mythicAll = false;
  bool mythic = true;
  bool tac = false;
  bool jeansensAll = false;
  bool pum = false;
  bool sum = false;
  bool gum = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SettingsHeading(
            label: 'Mythic',
            checkAll: mythicAll,
            onChanged: (isChecked) {
              setState(() {
                mythicAll = isChecked!;
              });
            },
          ),
          CupertinoButton(
            onPressed: () {
              print('go to url');
              // FIXME: fix this See: https://pub.dev/packages/url_launcher
              // Uri url = Uri.parse(
              //     'https://jeansenvaars.itch.io/plot-unfolding-machine');
              // _launchUrl(url);
            },
            child: const Text('Visit website'),
          ),
          SettingsOption(
            isActive: mythic,
            label: 'Action table',
            onChanged: (isChecked) {
              setState(() {
                mythic = isChecked!;
              });
            },
          ),
          SettingsOption(
            isActive: tac,
            label: 'Description table',
            onChanged: (isChecked) {
              setState(() {
                tac = isChecked!;
              });
            },
          ),
          SettingsHeading(
            label: 'Jeansens\'s Machines',
            checkAll: mythicAll,
            onChanged: (isChecked) {
              setState(() {
                mythicAll = isChecked!;
              });
            },
          ),
          CupertinoButton(
            onPressed: () {
              print('go to url');
              // FIXME: fix this See: https://pub.dev/packages/url_launcher
              // Uri url = Uri.parse(
              //     'https://jeansenvaars.itch.io/plot-unfolding-machine');
              // _launchUrl(url);
            },
            child: const Text('Visit website'),
          ),
          SettingsOption(
            isActive: pum,
            label: 'Plot Unfolding Machine (PUM)',
            onChanged: (isChecked) {
              setState(() {
                pum = isChecked!;
              });
            },
          ),
          SettingsOption(
            isActive: sum,
            label: 'Scene Unfolding Machine (SUM)',
            onChanged: (isChecked) {
              setState(() {
                sum = isChecked!;
              });
            },
          ),
          SettingsOption(
            isActive: gum,
            label: 'Game Unfolding Machine (GUM)',
            onChanged: (isChecked) {
              setState(() {
                gum = isChecked!;
              });
            },
          ),
        ],
      ),
    );
  }
}
