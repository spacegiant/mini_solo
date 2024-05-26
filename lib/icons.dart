import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgIcon extends StatelessWidget {
  const SvgIcon({super.key, required this.icon, this.semanticsLabel});

  final Images? icon;
  final String? semanticsLabel;
  final double width = 56.0;
  final double height = 56.0;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      imagesPaths[icon]!,
      semanticsLabel: semanticsLabel,
      width: width,
      height: height,
      // colorFilter: const ColorFilter.mode(Colors.red, BlendMode.srcIn),
    );
  }
}

enum Images {
  d6Oracle,
  d6OracleYesAnd,
  d6OracleYes,
  d6OracleYesBut,
  d6OracleNoBut,
  d6OracleNo,
  d6OracleNoAnd,
  coriolis1,
  coriolis2,
  coriolis3,
  coriolis4,
  coriolis5,
  coriolis6,
}

Map<Images, String> imagesPaths = {
  Images.d6Oracle: 'lib/assets/d6_oracle/d6_oracle.svg',
  Images.d6OracleYesAnd: 'lib/assets/d6_oracle/d6_oracle_yes_and.svg',
  Images.d6OracleYes: 'lib/assets/d6_oracle/d6_oracle_yes.svg',
  Images.d6OracleYesBut: 'lib/assets/d6_oracle/d6_oracle_yes_but.svg',
  Images.d6OracleNoBut: 'lib/assets/d6_oracle/d6_oracle_no_but.svg',
  Images.d6OracleNo: 'lib/assets/d6_oracle/d6_oracle_no.svg',
  Images.d6OracleNoAnd: 'lib/assets/d6_oracle/d6_oracle_no_and.svg',
  Images.coriolis1: 'lib/assets/coriolis/coriolis_1.svg',
  Images.coriolis2: 'lib/assets/coriolis/coriolis_2.svg',
  Images.coriolis3: 'lib/assets/coriolis/coriolis_3.svg',
  Images.coriolis4: 'lib/assets/coriolis/coriolis_4.svg',
  Images.coriolis5: 'lib/assets/coriolis/coriolis_5.svg',
  Images.coriolis6: 'lib/assets/coriolis/coriolis_6.svg',
};
