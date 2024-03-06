import 'package:flutter/cupertino.dart';

import 'my_homepage.dart';

void main() {
  runApp(const MyApp());
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
