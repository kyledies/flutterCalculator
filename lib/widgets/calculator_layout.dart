import 'package:flutter/material.dart';
import 'calc_button.dart'; // importerar knapp-widget
import 'calculator_display.dart'; //importerar display-widget

class CalculatorLayout extends StatefulWidget { //Statteful widget för att hantera displayens tillstånd
  const CalculatorLayout({super.key});

  @override
  State<CalculatorLayout> createState() => _CalculatorLayoutState(); //_CalculatorLayoutState hanterar tillståndet
  }

  /*Nedan - Hanterar tillståndet för displayen.
  När knapp trycks (onPressed) uppdateras displayens värde via _onButtonPressed metod nedan
  setState -> triggar ombyggnad av vidget med nytt värde

  */
  class _CalculatorLayoutState extends State<CalculatorLayout> {
    String _displayValue = '0';

    void _onButtonPressed(String digit) {
      setState(() {
        if (_displayValue == '0') {
          _displayValue = digit; // Ta bort initiala nollan
        } else {
        _displayValue += digit; // Lägg till knappens värde till displayen
        }
      });
    }

    void _onClearPressed(String clear) {
      setState(() {
        _displayValue = '0'; // Rensa displayen till noll
      });
    }
  
  
  
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 400,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: const Color(0xFF121212),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color.fromARGB(88, 112, 87, 224), width: 3),
        boxShadow: const [
          BoxShadow(
            blurRadius: 30,
            offset: Offset(0,0),
            color: Colors.yellowAccent,
          )
        ]
      ),

      child: Center(
        child: Column(
          children: [
            Text('Platshållare för  beräkningshistorik'),
            CalculatorDisplay(value: _displayValue), //Margin ligger i display-widget
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CalcButton(
                  label: '7',
                  onPressed: () => _onButtonPressed('7'),
                ),
                CalcButton(
                  label: '8',
                  onPressed: () => _onButtonPressed('8'),
                ),
                CalcButton(
                  label: '9',
                  onPressed: () => _onButtonPressed('9'),
                ),
                CalcButton(
                  label: 'C',
                  onPressed: () => _onClearPressed('C'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
