import 'package:first_app/dice_roller.dart';
import 'package:first_app/gradient_container.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: GradientContainer(
        colors: [
          Color.fromRGBO(26, 2, 80, 1),
          Color.fromRGBO(45, 7, 98, 1),
        ],
        child: DiceRoller(),
      ),
    ),
  ));
}
