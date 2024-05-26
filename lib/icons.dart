import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class SvgIcon extends StatelessWidget {
  const SvgIcon({super.key, required this.icon, this.semanticsLabel});

  final Images? icon;
  final String? semanticsLabel;
  final double width = 50.0;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      imagesPaths[icon]!,
      semanticsLabel: 'd6 Oracle Dice',
      width: 50.0,
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
}

Map<Images, String> imagesPaths = {
  Images.d6Oracle: 'lib/assets/d6_oracle/d6_oracle.svg',
  Images.d6OracleYesAnd: 'lib/assets/d6_oracle/d6_oracle_yes_and.svg',
  Images.d6OracleYes: 'lib/assets/d6_oracle/d6_oracle_yes.svg',
  Images.d6OracleYesBut: 'lib/assets/d6_oracle/d6_oracle_yes_but.svg',
  Images.d6OracleNoBut: 'lib/assets/d6_oracle/d6_oracle_no_but.svg',
  Images.d6OracleNo: 'lib/assets/d6_oracle/d6_oracle_no.svg',
  Images.d6OracleNoAnd: 'lib/assets/d6_oracle/d6_oracle_no_and.svg',
};
