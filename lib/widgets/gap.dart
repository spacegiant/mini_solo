import 'package:flutter/cupertino.dart';

class Gap extends StatelessWidget {
  const Gap({
    super.key,
    this.height = 16.0,
  });

  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: 8.0,
    );
  }
}
