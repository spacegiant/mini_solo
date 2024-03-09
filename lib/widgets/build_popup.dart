import 'package:flutter/cupertino.dart';

Future<dynamic> buildPopup(
  BuildContext context,
  final String label,
  final Widget child,
) {
  return showCupertinoModalPopup(
      useRootNavigator: false,
      context: context,
      builder: (BuildContext builder) {
        return CupertinoPopupSurface(
          child: Container(
            color: CupertinoColors.white,
            width: double.infinity,
            child: CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: Text(label),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text('Output box here'),
                      const Text('checkbox here'),
                      child,
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      });
}

void doSomething() {
  print('pressed');
}
