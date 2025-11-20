// keypad.dart
import 'package:flutter/material.dart';
import 'calc_button.dart';

class KeyPadLayout extends StatelessWidget {
  final void Function(String) onDigitPressed; // Keypad widget förväntar två funktioner från förälder
  final VoidCallback onClearPressed;

  const KeyPadLayout({
    super.key,
    required this.onDigitPressed, //referens till funktioner från förälder CalculatorLayout sparas i fält onDigitPressed
    required this.onClearPressed,
  });
/*Knappar byggs mha CalcButton-widget. Varje knapp kopplas till korrekt funktion: 
  CalcButton(
              label: '2',
              onPressed: () => onDigitPressed('2'), - "Kör denna vid onPressed"
            ),
  */ 
  @override
  Widget build(BuildContext context) { 
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CalcButton(
              label: 'C',
              textColor: Colors.greenAccent,
              onPressed: () => onClearPressed, //_onButtonPressed('1') från förälder skickas med
            ),
            CalcButton(
              label: 'm',
              textColor: Colors.greenAccent,
              onPressed: () => onDigitPressed('m'),
            ),
            CalcButton(
              label: '%',
              textColor: Colors.greenAccent,
              onPressed: () => onDigitPressed('%'),
            ),
            CalcButton(
              label: '÷',
              textColor: Colors.greenAccent,
              onPressed: () => onDigitPressed('÷'),
            ),
          ],
        ),
        const SizedBox(height: 18),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CalcButton(
              label: '7',
              onPressed: () => onDigitPressed('7'),
            ),
            CalcButton(
              label: '8',
              onPressed: () => onDigitPressed('8'),
            ),
            CalcButton(
              label: '9',
              onPressed: () => onDigitPressed('9'),
            ),
            CalcButton(
              label: '×',
              textColor: Colors.greenAccent,
              onPressed: () => onDigitPressed('×'),
            ),
          ],
        ),
        const SizedBox(height: 18), 
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CalcButton(
              label: '4',
              onPressed: () => onDigitPressed('4'),
            ),
            CalcButton(
              label: '5',
              onPressed: () => onDigitPressed('5'),
            ),
            CalcButton(
              label: '6',
              onPressed: () => onDigitPressed('6'),
            ),
            CalcButton(
              label: '-',
              textColor: Colors.greenAccent,
              onPressed: () => onDigitPressed('-'),
            ),
          ],
        ),
        const SizedBox(height: 18),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CalcButton(
              label: '1',
              //width: 155,
              //height: 70,
              onPressed: () => onDigitPressed('1'),
            ),
            CalcButton(
              label: '2',
              onPressed: () => onDigitPressed('2'),
            ),
            CalcButton(
              label: '3',
              onPressed: () => onDigitPressed('3'),
            ),
            CalcButton(
              label: '+',
              textColor: Colors.greenAccent,
              onPressed: () => onDigitPressed('+'),
            ),
          ],
        ),
        const SizedBox(height: 18), 
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CalcButton(
              label: '0',
              //width: 155,
              //height: 70,
              onPressed: () => onDigitPressed('0'),
            ),
            CalcButton(
              label: ',',
              onPressed: () => onDigitPressed(','),
            ),
            CalcButton(
              label: '±',
              onPressed: () => onDigitPressed('±'),
            ),
            CalcButton(
              label: '=',
              textColor: Colors.greenAccent,
              onPressed: () => onDigitPressed('='),
            ),
          ],
        ),
      ],
    );
  }
}
