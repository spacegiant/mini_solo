import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgIcon extends StatelessWidget {
  const SvgIcon({
    super.key,
    required this.icon,
    this.semanticsLabel,
    this.width = 56.0,
    this.height = 56.0,
    this.color,
  });

  final SVGIcon? icon;
  final String? semanticsLabel;
  final double? width;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    ColorFilter? filter =
        color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null;

    if (imagesPaths[icon] != null) {
      return SvgPicture.asset(
        imagesPaths[icon]!,
        semanticsLabel: semanticsLabel,
        width: width,
        height: height,
        colorFilter: filter,
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}

enum SVGIcon {
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

  d8_1,
  d8_2,
  d8_3,
  d8_4,
  d8_5,
  d8_6,
  d8_7,
  d8_8,

  d10_1,
  d10_2,
  d10_3,
  d10_4,
  d10_5,
  d10_6,
  d10_7,
  d10_8,
  d10_9,
  d10_10,
  d10_dice,

  d100_1,
  d100_2,
  d100_3,
  d100_4,
  d100_5,
  d100_6,
  d100_7,
  d100_8,
  d100_9,
  d100_10,

  d12_1,
  d12_2,
  d12_3,
  d12_4,
  d12_5,
  d12_6,
  d12_7,
  d12_8,
  d12_9,
  d12_10,
  d12_11,
  d12_12,

  d14_1,
  d14_2,
  d14_3,
  d14_4,
  d14_5,
  d14_6,
  d14_7,
  d14_8,
  d14_9,
  d14_10,
  d14_11,
  d14_12,
  d14_13,
  d14_14,

  d16_1,
  d16_2,
  d16_3,
  d16_4,
  d16_5,
  d16_6,
  d16_7,
  d16_8,
  d16_9,
  d16_10,
  d16_11,
  d16_12,
  d16_13,
  d16_14,
  d16_15,
  d16_16,

  d20_1,
  d20_2,
  d20_3,
  d20_4,
  d20_5,
  d20_6,
  d20_7,
  d20_8,
  d20_9,
  d20_10,
  d20_11,
  d20_12,
  d20_13,
  d20_14,
  d20_15,
  d20_16,
  d20_17,
  d20_18,
  d20_19,
  d20_20,

  d24_1,
  d24_2,
  d24_3,
  d24_4,
  d24_5,
  d24_6,
  d24_7,
  d24_8,
  d24_9,
  d24_10,
  d24_11,
  d24_12,
  d24_13,
  d24_14,
  d24_15,
  d24_16,
  d24_17,
  d24_18,
  d24_19,
  d24_20,
  d24_21,
  d24_22,
  d24_23,
  d24_24,

  d30_1,
  d30_2,
  d30_3,
  d30_4,
  d30_5,
  d30_6,
  d30_7,
  d30_8,
  d30_9,
  d30_10,
  d30_11,
  d30_12,
  d30_13,
  d30_14,
  d30_15,
  d30_16,
  d30_17,
  d30_18,
  d30_19,
  d30_20,
  d30_21,
  d30_22,
  d30_23,
  d30_24,
  d30_25,
  d30_26,
  d30_27,
  d30_28,
  d30_29,
  d30_30,

  fateDice,
  fatePlus,
  fateBlank,
  fateMinus,

  ironsworn_tick_0,
  ironsworn_tick_1,
  ironsworn_tick_2,
  ironsworn_tick_3,
  ironsworn_tick_4,

  clock4_0,
  clock4_1,
  clock4_2,
  clock4_3,
  clock4_4,

  clock6_0,
  clock6_1,
  clock6_2,
  clock6_3,
  clock6_4,
  clock6_5,
  clock6_6,

  clock8_0,
  clock8_1,
  clock8_2,
  clock8_3,
  clock8_4,
  clock8_5,
  clock8_6,
  clock8_7,
  clock8_8,

  bar_tracker,
  pip_checked,
  pip_icon,
  pip_unchecked,
  value_tracker,
  counter_tracker,

  t2kAmmo_1,
  t2kAmmo_2,
  t2kAmmo_3,
  t2kAmmo_4,
  t2kAmmo_5,
  t2kAmmo_6,

  t2kD6_1,
  t2kD6_2,
  t2kD6_3,
  t2kD6_4,
  t2kD6_5,
  t2kD6_6,

  t2kD8_1,
  t2kD8_2,
  t2kD8_3,
  t2kD8_4,
  t2kD8_5,
  t2kD8_6,
  t2kD8_7,
  t2kD8_8,

  t2kD10_1,
  t2kD10_2,
  t2kD10_3,
  t2kD10_4,
  t2kD10_5,
  t2kD10_6,
  t2kD10_7,
  t2kD10_8,
  t2kD10_9,
  t2kD10_10,

  t2kD12_1,
  t2kD12_2,
  t2kD12_3,
  t2kD12_4,
  t2kD12_5,
  t2kD12_6,
  t2kD12_7,
  t2kD12_8,
  t2kD12_9,
  t2kD12_10,
  t2kD12_11,
  t2kD12_12,

  t2kBody_1,
  t2kBody_2,
  t2kBody_3,
  t2kBody_4,
  t2kBody_5,
  t2kBody_6,
}

// TODO automate this if possible
Map<SVGIcon, String> imagesPaths = {
  SVGIcon.placeholder: 'lib/assets/general_dice/placeholder.svg',
  SVGIcon.d6Oracle: 'lib/assets/d6_oracle/d6_oracle.svg',
  SVGIcon.d6OracleYesAnd: 'lib/assets/d6_oracle/d6_oracle_yes_and.svg',
  SVGIcon.d6OracleYes: 'lib/assets/d6_oracle/d6_oracle_yes.svg',
  SVGIcon.d6OracleYesBut: 'lib/assets/d6_oracle/d6_oracle_yes_but.svg',
  SVGIcon.d6OracleNoBut: 'lib/assets/d6_oracle/d6_oracle_no_but.svg',
  SVGIcon.d6OracleNo: 'lib/assets/d6_oracle/d6_oracle_no.svg',
  SVGIcon.d6OracleNoAnd: 'lib/assets/d6_oracle/d6_oracle_no_and.svg',
  SVGIcon.coriolis1: 'lib/assets/coriolis/coriolis_1.svg',
  SVGIcon.coriolis2: 'lib/assets/coriolis/coriolis_2.svg',
  SVGIcon.coriolis3: 'lib/assets/coriolis/coriolis_3.svg',
  SVGIcon.coriolis4: 'lib/assets/coriolis/coriolis_4.svg',
  SVGIcon.coriolis5: 'lib/assets/coriolis/coriolis_5.svg',
  SVGIcon.coriolis6: 'lib/assets/coriolis/coriolis_6.svg',
  // d2
  SVGIcon.d2_1: 'lib/assets/general_dice/d2_1.svg',
  SVGIcon.d2_2: 'lib/assets/general_dice/d2_2.svg',
  // d3
  SVGIcon.d3_1: 'lib/assets/general_dice/d3_1.svg',
  SVGIcon.d3_2: 'lib/assets/general_dice/d3_2.svg',
  SVGIcon.d3_3: 'lib/assets/general_dice/d3_3.svg',
  // d4
  SVGIcon.d4_1: 'lib/assets/general_dice/d4_1.svg',
  SVGIcon.d4_2: 'lib/assets/general_dice/d4_2.svg',
  SVGIcon.d4_3: 'lib/assets/general_dice/d4_3.svg',
  SVGIcon.d4_4: 'lib/assets/general_dice/d4_4.svg',
  // d5
  SVGIcon.d5_1: 'lib/assets/general_dice/d5_1.svg',
  SVGIcon.d5_2: 'lib/assets/general_dice/d5_2.svg',
  SVGIcon.d5_3: 'lib/assets/general_dice/d5_3.svg',
  SVGIcon.d5_4: 'lib/assets/general_dice/d5_4.svg',
  SVGIcon.d5_5: 'lib/assets/general_dice/d5_5.svg',
  // d6
  SVGIcon.d6_1: 'lib/assets/general_dice/d6_1.svg',
  SVGIcon.d6_2: 'lib/assets/general_dice/d6_2.svg',
  SVGIcon.d6_3: 'lib/assets/general_dice/d6_3.svg',
  SVGIcon.d6_4: 'lib/assets/general_dice/d6_4.svg',
  SVGIcon.d6_5: 'lib/assets/general_dice/d6_5.svg',
  SVGIcon.d6_6: 'lib/assets/general_dice/d6_6.svg',
  //d7
  SVGIcon.d7_1: 'lib/assets/general_dice/d7_1.svg',
  SVGIcon.d7_2: 'lib/assets/general_dice/d7_2.svg',
  SVGIcon.d7_3: 'lib/assets/general_dice/d7_3.svg',
  SVGIcon.d7_4: 'lib/assets/general_dice/d7_4.svg',
  SVGIcon.d7_5: 'lib/assets/general_dice/d7_5.svg',
  SVGIcon.d7_6: 'lib/assets/general_dice/d7_6.svg',
  SVGIcon.d7_7: 'lib/assets/general_dice/d7_7.svg',
  // d8
  SVGIcon.d8_1: 'lib/assets/general_dice/d8_1.svg',
  SVGIcon.d8_2: 'lib/assets/general_dice/d8_2.svg',
  SVGIcon.d8_3: 'lib/assets/general_dice/d8_3.svg',
  SVGIcon.d8_4: 'lib/assets/general_dice/d8_4.svg',
  SVGIcon.d8_5: 'lib/assets/general_dice/d8_5.svg',
  SVGIcon.d8_6: 'lib/assets/general_dice/d8_6.svg',
  SVGIcon.d8_7: 'lib/assets/general_dice/d8_7.svg',
  SVGIcon.d8_8: 'lib/assets/general_dice/d8_8.svg',
  // d10
  SVGIcon.d10_1: 'lib/assets/general_dice/d10_1.svg',
  SVGIcon.d10_2: 'lib/assets/general_dice/d10_2.svg',
  SVGIcon.d10_3: 'lib/assets/general_dice/d10_3.svg',
  SVGIcon.d10_4: 'lib/assets/general_dice/d10_4.svg',
  SVGIcon.d10_5: 'lib/assets/general_dice/d10_5.svg',
  SVGIcon.d10_6: 'lib/assets/general_dice/d10_6.svg',
  SVGIcon.d10_7: 'lib/assets/general_dice/d10_7.svg',
  SVGIcon.d10_8: 'lib/assets/general_dice/d10_8.svg',
  SVGIcon.d10_9: 'lib/assets/general_dice/d10_9.svg',
  SVGIcon.d10_10: 'lib/assets/general_dice/d10_10.svg',
  SVGIcon.d10_dice: 'lib/assets/general_dice/d10_dice.svg',
  // d100
  SVGIcon.d100_1: 'lib/assets/general_dice/d100_1.svg',
  SVGIcon.d100_2: 'lib/assets/general_dice/d100_2.svg',
  SVGIcon.d100_3: 'lib/assets/general_dice/d100_3.svg',
  SVGIcon.d100_4: 'lib/assets/general_dice/d100_4.svg',
  SVGIcon.d100_5: 'lib/assets/general_dice/d100_5.svg',
  SVGIcon.d100_6: 'lib/assets/general_dice/d100_6.svg',
  SVGIcon.d100_7: 'lib/assets/general_dice/d100_7.svg',
  SVGIcon.d100_8: 'lib/assets/general_dice/d100_8.svg',
  SVGIcon.d100_9: 'lib/assets/general_dice/d100_9.svg',
  SVGIcon.d100_10: 'lib/assets/general_dice/d100_10.svg',
  // d2
  SVGIcon.d12_1: 'lib/assets/general_dice/d12_1.svg',
  SVGIcon.d12_2: 'lib/assets/general_dice/d12_2.svg',
  SVGIcon.d12_3: 'lib/assets/general_dice/d12_3.svg',
  SVGIcon.d12_4: 'lib/assets/general_dice/d12_4.svg',
  SVGIcon.d12_5: 'lib/assets/general_dice/d12_5.svg',
  SVGIcon.d12_6: 'lib/assets/general_dice/d12_6.svg',
  SVGIcon.d12_7: 'lib/assets/general_dice/d12_7.svg',
  SVGIcon.d12_8: 'lib/assets/general_dice/d12_8.svg',
  SVGIcon.d12_9: 'lib/assets/general_dice/d12_9.svg',
  SVGIcon.d12_10: 'lib/assets/general_dice/d12_10.svg',
  SVGIcon.d12_11: 'lib/assets/general_dice/d12_11.svg',
  SVGIcon.d12_12: 'lib/assets/general_dice/d12_12.svg',
  // d14
  SVGIcon.d14_1: 'lib/assets/general_dice/d14_1.svg',
  SVGIcon.d14_2: 'lib/assets/general_dice/d14_2.svg',
  SVGIcon.d14_3: 'lib/assets/general_dice/d14_3.svg',
  SVGIcon.d14_4: 'lib/assets/general_dice/d14_4.svg',
  SVGIcon.d14_5: 'lib/assets/general_dice/d14_5.svg',
  SVGIcon.d14_6: 'lib/assets/general_dice/d14_6.svg',
  SVGIcon.d14_7: 'lib/assets/general_dice/d14_7.svg',
  SVGIcon.d14_8: 'lib/assets/general_dice/d14_8.svg',
  SVGIcon.d14_9: 'lib/assets/general_dice/d14_9.svg',
  SVGIcon.d14_10: 'lib/assets/general_dice/d14_10.svg',
  SVGIcon.d14_11: 'lib/assets/general_dice/d14_11.svg',
  SVGIcon.d14_12: 'lib/assets/general_dice/d14_12.svg',
  SVGIcon.d14_13: 'lib/assets/general_dice/d14_13.svg',
  SVGIcon.d14_14: 'lib/assets/general_dice/d14_14.svg',
  // d16
  SVGIcon.d16_1: 'lib/assets/general_dice/d16_1.svg',
  SVGIcon.d16_2: 'lib/assets/general_dice/d16_2.svg',
  SVGIcon.d16_3: 'lib/assets/general_dice/d16_3.svg',
  SVGIcon.d16_4: 'lib/assets/general_dice/d16_4.svg',
  SVGIcon.d16_5: 'lib/assets/general_dice/d16_5.svg',
  SVGIcon.d16_6: 'lib/assets/general_dice/d16_6.svg',
  SVGIcon.d16_7: 'lib/assets/general_dice/d16_7.svg',
  SVGIcon.d16_8: 'lib/assets/general_dice/d16_8.svg',
  SVGIcon.d16_9: 'lib/assets/general_dice/d16_9.svg',
  SVGIcon.d16_10: 'lib/assets/general_dice/d16_10.svg',
  SVGIcon.d16_11: 'lib/assets/general_dice/d16_11.svg',
  SVGIcon.d16_12: 'lib/assets/general_dice/d16_12.svg',
  SVGIcon.d16_13: 'lib/assets/general_dice/d16_13.svg',
  SVGIcon.d16_14: 'lib/assets/general_dice/d16_14.svg',
  SVGIcon.d16_15: 'lib/assets/general_dice/d16_15.svg',
  SVGIcon.d16_16: 'lib/assets/general_dice/d16_16.svg',
  // d20
  SVGIcon.d20_1: 'lib/assets/general_dice/d20_1.svg',
  SVGIcon.d20_2: 'lib/assets/general_dice/d20_2.svg',
  SVGIcon.d20_3: 'lib/assets/general_dice/d20_3.svg',
  SVGIcon.d20_4: 'lib/assets/general_dice/d20_4.svg',
  SVGIcon.d20_5: 'lib/assets/general_dice/d20_5.svg',
  SVGIcon.d20_6: 'lib/assets/general_dice/d20_6.svg',
  SVGIcon.d20_7: 'lib/assets/general_dice/d20_7.svg',
  SVGIcon.d20_8: 'lib/assets/general_dice/d20_8.svg',
  SVGIcon.d20_9: 'lib/assets/general_dice/d20_9.svg',
  SVGIcon.d20_10: 'lib/assets/general_dice/d20_10.svg',
  SVGIcon.d20_11: 'lib/assets/general_dice/d20_11.svg',
  SVGIcon.d20_12: 'lib/assets/general_dice/d20_12.svg',
  SVGIcon.d20_13: 'lib/assets/general_dice/d20_13.svg',
  SVGIcon.d20_14: 'lib/assets/general_dice/d20_14.svg',
  SVGIcon.d20_15: 'lib/assets/general_dice/d20_15.svg',
  SVGIcon.d20_16: 'lib/assets/general_dice/d20_16.svg',
  SVGIcon.d20_17: 'lib/assets/general_dice/d20_17.svg',
  SVGIcon.d20_18: 'lib/assets/general_dice/d20_18.svg',
  SVGIcon.d20_19: 'lib/assets/general_dice/d20_19.svg',
  SVGIcon.d20_20: 'lib/assets/general_dice/d20_20.svg',
  // d24
  SVGIcon.d24_1: 'lib/assets/general_dice/d24_1.svg',
  SVGIcon.d24_2: 'lib/assets/general_dice/d24_2.svg',
  SVGIcon.d24_3: 'lib/assets/general_dice/d24_3.svg',
  SVGIcon.d24_4: 'lib/assets/general_dice/d24_4.svg',
  SVGIcon.d24_5: 'lib/assets/general_dice/d24_5.svg',
  SVGIcon.d24_6: 'lib/assets/general_dice/d24_6.svg',
  SVGIcon.d24_7: 'lib/assets/general_dice/d24_7.svg',
  SVGIcon.d24_8: 'lib/assets/general_dice/d24_8.svg',
  SVGIcon.d24_9: 'lib/assets/general_dice/d24_9.svg',
  SVGIcon.d24_10: 'lib/assets/general_dice/d24_10.svg',
  SVGIcon.d24_11: 'lib/assets/general_dice/d24_11.svg',
  SVGIcon.d24_12: 'lib/assets/general_dice/d24_12.svg',
  SVGIcon.d24_13: 'lib/assets/general_dice/d24_13.svg',
  SVGIcon.d24_14: 'lib/assets/general_dice/d24_14.svg',
  SVGIcon.d24_15: 'lib/assets/general_dice/d24_15.svg',
  SVGIcon.d24_16: 'lib/assets/general_dice/d24_16.svg',
  SVGIcon.d24_17: 'lib/assets/general_dice/d24_17.svg',
  SVGIcon.d24_18: 'lib/assets/general_dice/d24_18.svg',
  SVGIcon.d24_19: 'lib/assets/general_dice/d24_19.svg',
  SVGIcon.d24_20: 'lib/assets/general_dice/d24_20.svg',
  SVGIcon.d24_21: 'lib/assets/general_dice/d24_21.svg',
  SVGIcon.d24_22: 'lib/assets/general_dice/d24_22.svg',
  SVGIcon.d24_23: 'lib/assets/general_dice/d24_23.svg',
  SVGIcon.d24_24: 'lib/assets/general_dice/d24_24.svg',
  // d30
  SVGIcon.d30_1: 'lib/assets/general_dice/d30_1.svg',
  SVGIcon.d30_2: 'lib/assets/general_dice/d30_2.svg',
  SVGIcon.d30_3: 'lib/assets/general_dice/d30_3.svg',
  SVGIcon.d30_4: 'lib/assets/general_dice/d30_4.svg',
  SVGIcon.d30_5: 'lib/assets/general_dice/d30_5.svg',
  SVGIcon.d30_6: 'lib/assets/general_dice/d30_6.svg',
  SVGIcon.d30_7: 'lib/assets/general_dice/d30_7.svg',
  SVGIcon.d30_8: 'lib/assets/general_dice/d30_8.svg',
  SVGIcon.d30_9: 'lib/assets/general_dice/d30_9.svg',
  SVGIcon.d30_10: 'lib/assets/general_dice/d30_10.svg',
  SVGIcon.d30_11: 'lib/assets/general_dice/d30_11.svg',
  SVGIcon.d30_12: 'lib/assets/general_dice/d30_12.svg',
  SVGIcon.d30_13: 'lib/assets/general_dice/d30_13.svg',
  SVGIcon.d30_14: 'lib/assets/general_dice/d30_14.svg',
  SVGIcon.d30_15: 'lib/assets/general_dice/d30_15.svg',
  SVGIcon.d30_16: 'lib/assets/general_dice/d30_16.svg',
  SVGIcon.d30_17: 'lib/assets/general_dice/d30_17.svg',
  SVGIcon.d30_18: 'lib/assets/general_dice/d30_18.svg',
  SVGIcon.d30_19: 'lib/assets/general_dice/d30_19.svg',
  SVGIcon.d30_20: 'lib/assets/general_dice/d30_20.svg',
  SVGIcon.d30_21: 'lib/assets/general_dice/d30_21.svg',
  SVGIcon.d30_22: 'lib/assets/general_dice/d30_22.svg',
  SVGIcon.d30_23: 'lib/assets/general_dice/d30_23.svg',
  SVGIcon.d30_24: 'lib/assets/general_dice/d30_24.svg',
  SVGIcon.d30_25: 'lib/assets/general_dice/d30_25.svg',
  SVGIcon.d30_26: 'lib/assets/general_dice/d30_26.svg',
  SVGIcon.d30_27: 'lib/assets/general_dice/d30_27.svg',
  SVGIcon.d30_28: 'lib/assets/general_dice/d30_28.svg',
  SVGIcon.d30_29: 'lib/assets/general_dice/d30_29.svg',
  SVGIcon.d30_30: 'lib/assets/general_dice/d30_30.svg',

  // Fate
  SVGIcon.fateDice: 'lib/assets/fate_dice/dF.svg',
  SVGIcon.fatePlus: 'lib/assets/fate_dice/dF_plus.svg',
  SVGIcon.fateBlank: 'lib/assets/fate_dice/dF_blank.svg',
  SVGIcon.fateMinus: 'lib/assets/fate_dice/dF_minus.svg',

  SVGIcon.ironsworn_tick_0: 'lib/assets/ironsworn/ironsworn_tick_0.svg',
  SVGIcon.ironsworn_tick_1: 'lib/assets/ironsworn/ironsworn_tick_1.svg',
  SVGIcon.ironsworn_tick_2: 'lib/assets/ironsworn/ironsworn_tick_2.svg',
  SVGIcon.ironsworn_tick_3: 'lib/assets/ironsworn/ironsworn_tick_3.svg',
  SVGIcon.ironsworn_tick_4: 'lib/assets/ironsworn/ironsworn_tick_4.svg',

  SVGIcon.clock4_0: 'lib/assets/clocks/clock4_0.svg',
  SVGIcon.clock4_1: 'lib/assets/clocks/clock4_1.svg',
  SVGIcon.clock4_2: 'lib/assets/clocks/clock4_2.svg',
  SVGIcon.clock4_3: 'lib/assets/clocks/clock4_3.svg',
  SVGIcon.clock4_4: 'lib/assets/clocks/clock4_4.svg',

  SVGIcon.clock6_0: 'lib/assets/clocks/clock6_0.svg',
  SVGIcon.clock6_1: 'lib/assets/clocks/clock6_1.svg',
  SVGIcon.clock6_2: 'lib/assets/clocks/clock6_2.svg',
  SVGIcon.clock6_3: 'lib/assets/clocks/clock6_3.svg',
  SVGIcon.clock6_4: 'lib/assets/clocks/clock6_4.svg',
  SVGIcon.clock6_5: 'lib/assets/clocks/clock6_5.svg',
  SVGIcon.clock6_6: 'lib/assets/clocks/clock6_6.svg',

  SVGIcon.clock8_0: 'lib/assets/clocks/clock8_0.svg',
  SVGIcon.clock8_1: 'lib/assets/clocks/clock8_1.svg',
  SVGIcon.clock8_2: 'lib/assets/clocks/clock8_2.svg',
  SVGIcon.clock8_3: 'lib/assets/clocks/clock8_3.svg',
  SVGIcon.clock8_4: 'lib/assets/clocks/clock8_4.svg',
  SVGIcon.clock8_5: 'lib/assets/clocks/clock8_5.svg',
  SVGIcon.clock8_6: 'lib/assets/clocks/clock8_6.svg',
  SVGIcon.clock8_7: 'lib/assets/clocks/clock8_7.svg',
  SVGIcon.clock8_8: 'lib/assets/clocks/clock8_8.svg',

  SVGIcon.bar_tracker: 'lib/assets/other/bar_tracker_icon.svg',
  SVGIcon.pip_checked: 'lib/assets/other/pip_checked.svg',
  SVGIcon.pip_icon: 'lib/assets/other/pip_icon.svg',
  SVGIcon.pip_unchecked: 'lib/assets/other/pip_unchecked.svg',
  SVGIcon.value_tracker: 'lib/assets/other/value_tracker_icon.svg',
  SVGIcon.counter_tracker: 'lib/assets/other/counter_tracker_icon.svg',

  SVGIcon.t2kAmmo_1: 'lib/assets/t2k_dice/t2000_ammo_1.svg',
  SVGIcon.t2kAmmo_2: 'lib/assets/t2k_dice/t2000_ammo_2.svg',
  SVGIcon.t2kAmmo_3: 'lib/assets/t2k_dice/t2000_ammo_3.svg',
  SVGIcon.t2kAmmo_4: 'lib/assets/t2k_dice/t2000_ammo_4.svg',
  SVGIcon.t2kAmmo_5: 'lib/assets/t2k_dice/t2000_ammo_5.svg',
  SVGIcon.t2kAmmo_6: 'lib/assets/t2k_dice/t2000_ammo_6.svg',

  SVGIcon.t2kD6_1: 'lib/assets/t2k_dice/t2000_d6_1.svg',
  SVGIcon.t2kD6_2: 'lib/assets/t2k_dice/t2000_d6_2.svg',
  SVGIcon.t2kD6_3: 'lib/assets/t2k_dice/t2000_d6_3.svg',
  SVGIcon.t2kD6_4: 'lib/assets/t2k_dice/t2000_d6_4.svg',
  SVGIcon.t2kD6_5: 'lib/assets/t2k_dice/t2000_d6_5.svg',
  SVGIcon.t2kD6_6: 'lib/assets/t2k_dice/t2000_d6_6.svg',

  SVGIcon.t2kD8_1: 'lib/assets/t2k_dice/t2000_d8_1.svg',
  SVGIcon.t2kD8_2: 'lib/assets/t2k_dice/t2000_d8_2.svg',
  SVGIcon.t2kD8_3: 'lib/assets/t2k_dice/t2000_d8_3.svg',
  SVGIcon.t2kD8_4: 'lib/assets/t2k_dice/t2000_d8_4.svg',
  SVGIcon.t2kD8_5: 'lib/assets/t2k_dice/t2000_d8_5.svg',
  SVGIcon.t2kD8_6: 'lib/assets/t2k_dice/t2000_d8_6.svg',
  SVGIcon.t2kD8_7: 'lib/assets/t2k_dice/t2000_d8_7.svg',
  SVGIcon.t2kD8_8: 'lib/assets/t2k_dice/t2000_d8_8.svg',

  SVGIcon.t2kD10_1: 'lib/assets/t2k_dice/t2000_d10_1.svg',
  SVGIcon.t2kD10_2: 'lib/assets/t2k_dice/t2000_d10_2.svg',
  SVGIcon.t2kD10_3: 'lib/assets/t2k_dice/t2000_d10_3.svg',
  SVGIcon.t2kD10_4: 'lib/assets/t2k_dice/t2000_d10_4.svg',
  SVGIcon.t2kD10_5: 'lib/assets/t2k_dice/t2000_d10_5.svg',
  SVGIcon.t2kD10_6: 'lib/assets/t2k_dice/t2000_d10_6.svg',
  SVGIcon.t2kD10_7: 'lib/assets/t2k_dice/t2000_d10_7.svg',
  SVGIcon.t2kD10_8: 'lib/assets/t2k_dice/t2000_d10_8.svg',
  SVGIcon.t2kD10_9: 'lib/assets/t2k_dice/t2000_d10_9.svg',
  SVGIcon.t2kD10_10: 'lib/assets/t2k_dice/t2000_d10_10.svg',

  SVGIcon.t2kD12_1: 'lib/assets/t2k_dice/t2000_d12_1.svg',
  SVGIcon.t2kD12_2: 'lib/assets/t2k_dice/t2000_d12_2.svg',
  SVGIcon.t2kD12_3: 'lib/assets/t2k_dice/t2000_d12_3.svg',
  SVGIcon.t2kD12_4: 'lib/assets/t2k_dice/t2000_d12_4.svg',
  SVGIcon.t2kD12_5: 'lib/assets/t2k_dice/t2000_d12_5.svg',
  SVGIcon.t2kD12_6: 'lib/assets/t2k_dice/t2000_d12_6.svg',
  SVGIcon.t2kD12_7: 'lib/assets/t2k_dice/t2000_d12_7.svg',
  SVGIcon.t2kD12_8: 'lib/assets/t2k_dice/t2000_d12_8.svg',
  SVGIcon.t2kD12_9: 'lib/assets/t2k_dice/t2000_d12_9.svg',
  SVGIcon.t2kD12_10: 'lib/assets/t2k_dice/t2000_d12_10.svg',
  SVGIcon.t2kD12_11: 'lib/assets/t2k_dice/t2000_d12_11.svg',
  SVGIcon.t2kD12_12: 'lib/assets/t2k_dice/t2000_d12_12.svg',

  SVGIcon.t2kBody_1: 'lib/assets/t2k_dice/t2000_body_123.svg',
  SVGIcon.t2kBody_2: 'lib/assets/t2k_dice/t2000_body_123.svg',
  SVGIcon.t2kBody_3: 'lib/assets/t2k_dice/t2000_body_123.svg',
  SVGIcon.t2kBody_4: 'lib/assets/t2k_dice/t2000_body_4.svg',
  SVGIcon.t2kBody_5: 'lib/assets/t2k_dice/t2000_body_5.svg',
  SVGIcon.t2kBody_6: 'lib/assets/t2k_dice/t2000_body_6.svg',
};
