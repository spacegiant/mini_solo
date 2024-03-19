import 'package:flutter/cupertino.dart';
import 'package:mini_solo/widgets/chaos_factor.dart';
import 'package:provider/provider.dart';

import 'my_homepage.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ChaosFactor(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Mini Solo',
      theme: CupertinoThemeData(brightness: Brightness.light),
      home: MyHomePageIOS(title: 'Mini Solo'),
    );
  }
}
