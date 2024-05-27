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
  placeholder,
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
  d2_1,
  d2_2,
  d3_1,
  d3_2,
  d3_3,
  d4_1,
  d4_2,
  d4_3,
  d4_4,
  d5_1,
  d5_2,
  d5_3,
  d5_4,
  d5_5,
  d6_1,
  d6_2,
  d6_3,
  d6_4,
  d6_5,
  d6_6,
  d7_1,
  d7_2,
  d7_3,
  d7_4,
  d7_5,
  d7_6,
  d7_7,
  fateDice,
  fatePlus,
  fateBlank,
  fateMinus,
}

Map<Images, String> imagesPaths = {
  Images.placeholder: 'lib/assets/regular_dice/placeholder.svg',
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
  Images.d2_1: 'lib/assets/zocchi_dice/d2_1.svg',
  Images.d2_2: 'lib/assets/zocchi_dice/d2_2.svg',
  Images.d3_1: 'lib/assets/zocchi_dice/d3_1.svg',
  Images.d3_2: 'lib/assets/zocchi_dice/d3_2.svg',
  Images.d3_3: 'lib/assets/zocchi_dice/d3_3.svg',
  Images.d4_1: 'lib/assets/regular_dice/d4_1.svg',
  Images.d4_2: 'lib/assets/regular_dice/d4_2.svg',
  Images.d4_3: 'lib/assets/regular_dice/d4_3.svg',
  Images.d4_4: 'lib/assets/regular_dice/d4_4.svg',
  Images.d5_1: 'lib/assets/zocchi_dice/d5_1.svg',
  Images.d5_2: 'lib/assets/zocchi_dice/d5_2.svg',
  Images.d5_3: 'lib/assets/zocchi_dice/d5_3.svg',
  Images.d5_4: 'lib/assets/zocchi_dice/d5_4.svg',
  Images.d5_5: 'lib/assets/zocchi_dice/d5_5.svg',
  Images.d6_1: 'lib/assets/regular_dice/d6_1.svg',
  Images.d6_2: 'lib/assets/regular_dice/d6_2.svg',
  Images.d6_3: 'lib/assets/regular_dice/d6_3.svg',
  Images.d6_4: 'lib/assets/regular_dice/d6_4.svg',
  Images.d6_5: 'lib/assets/regular_dice/d6_5.svg',
  Images.d6_6: 'lib/assets/regular_dice/d6_6.svg',
  Images.d7_1: 'lib/assets/zocchi_dice/d7_1.svg',
  Images.d7_2: 'lib/assets/zocchi_dice/d7_2.svg',
  Images.d7_3: 'lib/assets/zocchi_dice/d7_3.svg',
  Images.d7_4: 'lib/assets/zocchi_dice/d7_4.svg',
  Images.d7_5: 'lib/assets/zocchi_dice/d7_5.svg',
  Images.d7_6: 'lib/assets/zocchi_dice/d7_6.svg',
  Images.d7_7: 'lib/assets/zocchi_dice/d7_7.svg',
  Images.fateDice: 'lib/assets/fate_dice/dF.svg',
  Images.fatePlus: 'lib/assets/fate_dice/dF_plus.svg',
  Images.fateBlank: 'lib/assets/fate_dice/dF_blank.svg',
  Images.fateMinus: 'lib/assets/fate_dice/dF_minus.svg',
};
