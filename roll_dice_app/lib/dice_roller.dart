import 'package:flutter/material.dart';
import 'dart:math';

//Declare global variable for random object
final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  var currentDiceRoll = 1;

  //randomize button click
  void rollDice() {
    //generate a random number to shuffle the images in sync
    setState(() {
      currentDiceRoll = randomizer.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Image.asset("assets/images/dice-$currentDiceRoll.png"),
        const SizedBox(height: 20),
        TextButton(
          onPressed: rollDice,
          child: const Text(
            "Roll Dice",
            style: const TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
