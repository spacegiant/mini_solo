import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_solo/data/campaign_storage.dart';
import 'package:mini_solo/data/app_state.dart';
import 'package:provider/provider.dart';

import 'my_homepage.dart';

void main() {
  runApp(RestartWidget(
    child: ChangeNotifierProvider(
      create: (context) => AppState(),
      child: const MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Mini Solo',
      theme: const CupertinoThemeData(brightness: Brightness.light),
      localizationsDelegates: const [
        DefaultMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      home: MyHomePageIOS(
        title: 'Mini Solo',
        storage: CampaignStorage(),
      ),
    );
  }
}

// Source: https://wikicodecamp.com/restart-flutter-app-programmatically/
class RestartWidget extends StatefulWidget {
  const RestartWidget({super.key, required this.child});

  final Widget child;

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<RestartWidgetState>()?.restartApp();
  }

  @override
  RestartWidgetState createState() => RestartWidgetState();
}

class RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}
