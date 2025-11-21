import 'package:flutter/material.dart';
import 'package:flutter_calculator/utils/operation_helper.dart';
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
    final List<String> _history = []; //lista för historik 
    String _lastExpression = ''; //Senaste uttrycket för print i UI

// referenser onDigitPressed, onClearPressed och onEqualsPressed i keypad pekar mot funktioner nedan
   
   // uppdaterar displayvärde genom att addera knappens värde till sträng 
    void _onButtonPressed(String digit) {
      setState(() {
        if (_displayValue == '0') {
          _displayValue = digit; // Ta bort initiala nollan
        } else {
        _displayValue += digit; // Lägg till knappens värde till displayen
        }
      });
    }
    // Rensar display - Sätter värde i sträng till '0'
    void _onClearPressed() {
      setState(() {
        _displayValue = '0'; // Rensa displayen till noll
        _lastExpression = ''; //Nollar så uttryck tas bort
      });
    }

    //Här evalueras uttryck i display mha operation_helper (expressions-paket)
    void _onEqualsPressed() {
      final expression = _displayValue; 

      try {
        final result = extractResultFromString(expression);
        final resultString = '$expression = $result';

        setState(() {
          _displayValue = result.toString(); // Skriver ut resultat i display
          _history.insert(0, resultString); // Beräkning läggs till ÖVERST i historik
          _lastExpression = expression; // Senaste uttrycket
        });
      } catch (e) {
        setState(() {
          _displayValue = 'He blev tok...'; // Felmeddelande vid fel
        });
      }
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
              if (_lastExpression.isNotEmpty)
              Text(
                _lastExpression
                )
              else 
                const Text(
                  'Senaste beräkning'
                ),
              CalculatorDisplay(value: _displayValue), //Margin ligger i display-widget
              KeyPadLayout( //Skickar in callbacks för knapptryckningar: onDigitPressed pekar mot _onButtonPressed o.s.v.
                onDigitPressed: _onButtonPressed,
                onClearPressed: _onClearPressed,
                onEqualsPressed: _onEqualsPressed,
              ),
              const SizedBox(height: 8),
              //Visar historik nedan 
              Text(
                'Beräkningshistorik:',
                style: TextStyle(
                  fontWeight: FontWeight.bold),
                  //color: Colors.pinkAccent),
              ),
              const SizedBox(height: 8),
              Text(
                _history.join('\n'),
                //style: TextStyle(
                //  fontWeight: FontWeight.bold,
                //  color: Colors.pinkAccent),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
