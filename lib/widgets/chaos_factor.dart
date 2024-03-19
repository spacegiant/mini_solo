import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'list_button.dart';

class ChaosFactor extends ChangeNotifier {
  late int _chaosFactor = 5;

  int get value => _chaosFactor;
  int maxChaos = 9;
  int minChaos = 1;

  void increase() {
    _chaosFactor < maxChaos ? _chaosFactor++ : null;
    notifyListeners();
  }

  void decrease() {
    _chaosFactor > minChaos ? _chaosFactor-- : null;
    notifyListeners();
  }

  void reset() {
    _chaosFactor = 5;
    notifyListeners();
  }
}

Visibility chaosFactorPopup(BuildContext context, showPopup, togglePopup) {
  return Visibility(
    visible: showPopup,
    child: CupertinoPopupSurface(
      child: Center(
        child: SizedBox(
          width: 200.0,
          height: 200.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Center(child: Text('Set Chaos Factor')),
              const SizedBox(
                width: 10.0,
                height: 10.0,
              ),
              ListButton(
                label: 'Chaos Up',
                labelAlignment: Alignment.center,
                onPressed: () {
                  // setState(() {
                  //   var chaosFactor = context.read<ChaosFactor>();
                  //   chaosFactor.increase();
                  // });
                  var chaosFactor = context.read<ChaosFactor>();
                  chaosFactor.increase();
                },
              ),
              ListButton(
                label: 'Chaos Down',
                labelAlignment: Alignment.center,
                onPressed: () {
                  // setState(() {
                  //   var chaosFactor = context.read<ChaosFactor>();
                  //   chaosFactor.decrease();
                  // });
                  var chaosFactor = context.read<ChaosFactor>();
                  chaosFactor.decrease();
                },
              ),
              ListButton(
                label: 'Close',
                labelAlignment: Alignment.center,
                onPressed: togglePopup,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
