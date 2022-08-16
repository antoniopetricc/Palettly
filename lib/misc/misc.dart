import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

class Misc {
  final RandomColor _randomColor = RandomColor();

  Color randomColor() => _randomColor.randomColor();
  MyColor getColorName(Color hexColor) => getColorNameFromColor(hexColor);
}
