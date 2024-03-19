import 'package:flutter/cupertino.dart';
import 'package:mini_solo/view_items.dart';
import 'package:mini_solo/widgets/chaos_factor.dart';
import 'package:provider/provider.dart';

CupertinoTabView tabView(
  int index,
  Function() togglePopup,
  toggleSettings,
  showPopup,
) {
  return CupertinoTabView(
    builder: (BuildContext context) {
      return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: ChaosFactorButton(
            togglePopup: togglePopup,
          ),
          middle: const Text('Solo app'),
          trailing: CupertinoButton(
            padding: const EdgeInsets.all(0.0),
            onPressed: toggleSettings,
            child: const Icon(
              CupertinoIcons.settings_solid,
            ),
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              viewItems.map((e) => e.viewWidget).toList()[index],
              chaosFactorPopup(context, showPopup, togglePopup),
            ],
          ),
        ),
      );
    },
  );
}

class ChaosFactorButton extends StatelessWidget {
  const ChaosFactorButton({super.key, required this.togglePopup});

  final Function() togglePopup;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: togglePopup,
      padding: const EdgeInsets.all(0.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Consumer<ChaosFactor>(
            builder: (context, chaosFactor, child) => Text(
              'CF ${chaosFactor.chaosFactor}',
              overflow: TextOverflow.visible,
            ),
          ),
        ],
      ),
    );
  }
}
