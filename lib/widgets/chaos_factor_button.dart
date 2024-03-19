import 'package:flutter/cupertino.dart';
import 'package:mini_solo/widgets/chaos_factor_popup.dart';
import 'package:provider/provider.dart';

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
              'CF ${chaosFactor.value}',
              overflow: TextOverflow.visible,
            ),
          ),
        ],
      ),
    );
  }
}
