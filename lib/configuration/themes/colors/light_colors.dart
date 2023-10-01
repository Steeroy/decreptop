import 'package:flutter/material.dart';

const Color _blue = Color.fromRGBO(33, 150, 243, 1);
const Color _orange = Color.fromRGBO(255, 87, 34, 1);
const Color _white = Color.fromRGBO(255, 255, 255, 1);
const Color _black = Color.fromRGBO(33, 33, 33, 1);
const Color _gray = Color.fromRGBO(117, 117, 117, 1);
const Color _red = Color.fromRGBO(244, 67, 54, 1);
const Color _green = Color.fromRGBO(76, 175, 80, 1);

ColorScheme lightColorScheme() => const ColorScheme(
      brightness: Brightness.light,
      primary: _blue,
      onPrimary: _white,
      secondary: _orange,
      onSecondary: _white,
      error: _red,
      onError: _white,
      background: _white,
      onBackground: _black,
      surface: _white,
      onSurface: _gray,
    );
