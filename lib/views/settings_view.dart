import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../data/app_state.dart';

enum Category { general, campaign, tools }

Map<Category, Widget> settingsPages = <Category, Widget>{
  Category.general: const GeneralSettings(),
  Category.campaign: const CampaignSettings(),
  Category.tools: const ToolsSettings(),
};

class SettingsView extends StatefulWidget {
  const SettingsView({
    super.key,
    required this.title,
    required this.closeSettings,
  });

  final String title;
  final VoidCallback closeSettings;

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
            settingsPages[_selectedSegment] ?? const Text('Eh'),
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
  bool autoCopy = true;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (BuildContext context, appState, Widget? child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SettingsHeading(label: 'General settings'),
              // if (kDebugMode)
              DestructiveDeleteCurrentCampaign(
                appState: appState,
              ),
              SettingsOption(
                isActive:
                    appState.campaignData!.settings.general.showFutureSettings,
                label: 'Show future features',
                onChanged: (isChecked) {
                  appState.toggleShowFutureFeatures();
                },
              ),
              SettingsOption(
                isActive: autoCopy,
                label: 'Copy to clipboard automatically',
                onChanged: (isChecked) {
                  setState(() {
                    autoCopy = isChecked!;
                  });
                },
              ),
              SettingsOption(
                isActive: true,
                label: 'Send to journal',
                onChanged: (isChecked) {},
              ),
              const SettingsHeading(label: 'Dice'),
              const Text('Choose which dice you want shown'),
              SettingsOption(
                isActive: appState.campaignData!.settings.general.useFateDice,
                label: 'Use Fate Dice',
                onChanged: (isChecked) {
                  appState.toggleUseFateDice();
                },
              ),
              SettingsOption(
                isActive: appState.campaignData!.settings.general.useZocchiDice,
                label: 'Use Zocchi Dice',
                onChanged: (isChecked) {
                  appState.toggleUseZocchiDice();
                },
              ),
              const SettingsHeading(label: 'Theme'),
              const Text('Light/Dark/Match OS'),
              const Text('Fantasy/Scifi/Modern Theme?')
            ],
          ),
        );
      },
    );
  }
}

class DestructiveDeleteCurrentCampaign extends StatelessWidget {
  const DestructiveDeleteCurrentCampaign({
    super.key,
    required this.appState,
  });

  final AppState appState;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onLongPress: () {
          String? campaignFilename = appState.campaignData?.filename;
          appState.deleteCampaign(campaignFilename);
        },
        child: Container(
            color: CupertinoColors.destructiveRed,
            padding: const EdgeInsets.all(10.0),
            child: const Text('Hold to delete current campaign')),
      ),
    );
  }
}

class CampaignSettings extends StatefulWidget {
  const CampaignSettings({super.key});

  @override
  State<CampaignSettings> createState() => _CampaignSettingsState();
}

class _CampaignSettingsState extends State<CampaignSettings> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // TODO: FIX ME
          const Text('dropdown goes here - select current campaign'),
          SettingsOption(
            isActive: true,
            label: 'Copy to clipboard automatically',
            onChanged: (isChecked) {},
          ),
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

// TODO: Move
// Future<void> _launchUrl(url) async {
//   if (!await launchUrl(url)) {
//     throw Exception('Could not launch $url');
//   }
// }
