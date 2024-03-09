import 'package:flutter/cupertino.dart';

enum Category { general, campaign, tools }

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
  bool autoCopy = true;
  bool mythicAll = false;
  bool mythic = true;
  bool tac = false;

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
        child: CupertinoSegmentedControl<Category>(
          groupValue: _selectedSegment,
          onValueChanged: (Category value) {
            setState(() {
              _selectedSegment = value;
            });
          },
          children: const {
            Category.general: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text('General'),
            ),
            Category.campaign: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text('Campaign'),
            ),
            Category.tools: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text('Tools'),
            ),
          },
        ),
        // child: Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       const SettingsHeading(label: 'General settings'),
        //       SettingsOption(
        //         isActive: autoCopy,
        //         label: 'Copy to clipboard automatically',
        //         onChanged: (isChecked) {
        //           setState(() {
        //             autoCopy = isChecked!;
        //           });
        //         },
        //       ),
        //       const SettingsHeading(label: 'Campaign settings'),
        //       SettingsOption(
        //         isActive: autoCopy,
        //         label: 'Copy to clipboard automatically',
        //         onChanged: (isChecked) {
        //           setState(() {
        //             autoCopy = isChecked!;
        //           });
        //         },
        //       ),
        //       SettingsHeading(
        //         label: 'Mythic',
        //         checkAll: mythicAll,
        //         onChanged: (isChecked) {
        //           setState(() {
        //             mythicAll = isChecked!;
        //           });
        //         },
        //       ),
        //       SettingsOption(
        //         isActive: mythic,
        //         label: 'Action table',
        //         onChanged: (isChecked) {
        //           setState(() {
        //             mythic = isChecked!;
        //           });
        //         },
        //       ),
        //       SettingsOption(
        //         isActive: tac,
        //         label: 'Description table',
        //         onChanged: (isChecked) {
        //           setState(() {
        //             tac = isChecked!;
        //           });
        //         },
        //       )
        //     ],
        //   ),
        // ),
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
