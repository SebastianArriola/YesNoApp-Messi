import 'package:flutter/material.dart';

const Color _colorsito = Color(0x0F2F24C5);

final List<Color> _colorsTheme = [
  Colors.blue,
  Colors.red,
  Colors.yellow,
  Colors.black,
  _colorsito
];

class AppTheme{

  final int colorSelected;

  AppTheme({this.colorSelected = 0})
  : assert(colorSelected >= 0 && colorSelected <= _colorsTheme.length - 1, 'Colors must be between 0 and ${_colorsTheme.length}');

  ThemeData theme(){

    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed:_colorsTheme[colorSelected]
    );

  }

}