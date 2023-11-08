import 'dart:math';
import 'package:first_app/styled_text.dart';
import 'package:flutter/material.dart';

final Random _randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  int _diceNumber = 1;

  void _rollDice() {
    int diceRoll = _randomizer.nextInt(6) + 1;
    setState(() {
      _diceNumber = diceRoll;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/dice-$_diceNumber.png',
          width: 200,
          height: 200,
        ),
        TextButton(
          onPressed: _rollDice,
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(20),
          ),
          child: const StyledText('Roll Dice'),
        ),
      ],
    );
  }
}
