import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

const String assetName = 'lib/assets/d6_oracle/d6_oracle_yes_and.svg';
final Widget svg = SvgPicture.asset(
  assetName,
  semanticsLabel: 'Acme Logo',
  width: 44.0,
);
