
import 'package:flutter/material.dart';
import 'package:mini_solo/svg_icon.dart';
import 'package:test/test.dart';

main() {
  test('SvgIcon', () {
    SvgIcon svgIcon = const SvgIcon(
      icon: SVGIcon.d6_1,
      width: 20.0,
      height: 30.0,
      semanticsLabel: 'semantics label',
      color: Colors.pink,
    );

    expect(svgIcon.runtimeType, SvgIcon);
    // expect(svgIcon.icon, SVGIcon.d6_1);
    // expect(svgIcon.width, 20.0);
    // expect(svgIcon.height, 30.0);
    // expect(svgIcon.semanticsLabel, 'semantics label');
    // expect(svgIcon.color, Colors.pink);
  });
}
