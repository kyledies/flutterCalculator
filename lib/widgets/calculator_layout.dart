import 'package:flutter/material.dart';
//import 'calc_button.dart'; // importerar knapp-widget
import 'calculator_display.dart'; //importerar display-widget
import 'keypad.dart'; // importerar keypad-widget

//Stateful widget för att hantera displayens tillstånd genom uppdatering av _displayValue
class CalculatorLayout extends StatefulWidget { 
  const CalculatorLayout({super.key});

  @override
  State<CalculatorLayout> createState() => _CalculatorLayoutState(); //_CalculatorLayoutState hanterar tillståndet
  }

  /*Nedan - Hanterar tillståndet för displayen.
  När knapp trycks (onPressed) uppdateras displayens värde via _onButtonPressed funktion nedan
  setState -> triggar ombyggnad av widget med nytt värde

  */
  class _CalculatorLayoutState extends State<CalculatorLayout> {
    String _displayValue = '0'; // värde som kan ändras, initialt '0'
// referenser onDigitPressed och onClearPressed i keypad pekar mot funktioner nedan
    void _onButtonPressed(String digit) {
      setState(() {
        if (_displayValue == '0') {
          _displayValue = digit; // Ta bort initiala nollan
        } else {
        _displayValue += digit; // Lägg till knappens värde till displayen
        }
      });
    }

    void _onClearPressed() {
      setState(() {
        _displayValue = '0'; // Rensa displayen till noll
      });
    }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 620,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: const Color(0xFF121212),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color.fromARGB(88, 112, 87, 224), width: 3),
        boxShadow: const [
          BoxShadow(
            blurRadius: 175,
            offset: Offset(0,0),
            color: Colors.pinkAccent,
          )
        ]
      ),

      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text('Platshållare för  beräkningshistorik'),
              CalculatorDisplay(value: _displayValue), //Margin ligger i display-widget
              KeyPadLayout( //Skickar in callbacks för knapptryckningar: onDigitPressed pekar mot _onButtonPressed o.s.v.
                onDigitPressed: _onButtonPressed,
                onClearPressed: _onClearPressed,
              ),
              const SizedBox(height: 8),
              Text(
                'Historik Scrollbar här...?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.pinkAccent),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
