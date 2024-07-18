import 'package:flutter/cupertino.dart';

class Gap extends StatelessWidget {
  const Gap({
    super.key,
    this.width = 16.0,
    this.height = 16.0,
  });

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
    );
  }
}
