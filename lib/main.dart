
import 'package:flutter/material.dart';
import 'package:interactives/widgets/expenses.dart';
var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.from(alpha: 255, red: 96, green: 59, blue: 181));
void main() {
  runApp(MaterialApp(
    theme: ThemeData().copyWith(
      colorScheme: kColorScheme,
    ),
    home: Expenses(),
  ));
}
