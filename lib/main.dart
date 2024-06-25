import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_solo/data/campaign_storage.dart';
import 'package:mini_solo/data/app_state.dart';
import 'package:provider/provider.dart';

import 'my_homepage.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => AppState(),
    child: const MyApp(),
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
