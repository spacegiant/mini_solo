import 'package:flutter/cupertino.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({
    super.key,
    required this.title,
    required this.closeSettings,
  });

  final String title;
  final VoidCallback closeSettings;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: CupertinoButton(
            onPressed: closeSettings,
            padding: const EdgeInsets.all(0.0),
            child: const Icon(CupertinoIcons.back),
          ),
          middle: Text('$title Settings'),
        ),
        child: const SafeArea(
            child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Settings'),
        )));
  }
}
