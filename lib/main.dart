import 'package:flutter/cupertino.dart';
import 'package:mini_solo/utilities/campaign_storage.dart';
import 'package:mini_solo/widgets/app_state.dart';
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
      home: MyHomePageIOS(
        title: 'Mini Solo',
        storage: CampaignStorage(),
      ),
    );
  }
}
