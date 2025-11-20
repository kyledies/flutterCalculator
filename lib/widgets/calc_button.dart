// lib/widgets/calc_button.dart
import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final String label; // Texten på knappen, t.ex. "7" eller "+"
  final VoidCallback onPressed; // Vad som ska hända när man trycker, anonym funktion från KeyPadLayout
  final double width;
  final double height;
  final Color ? textColor;

  const CalcButton({
    super.key, 
    required this.label, 
    required this.onPressed, 
    this.width = 70,
    this.height = 70,
    this.textColor,
  });

  //Kanske snyggt att ha färger efter tema
  @override
  Widget build(BuildContext context) {
    //final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed, //onPressed är här t.ex. onDigitPressed('7') och körs vid klick
        style: ElevatedButton.styleFrom(
          //backgroundColor: colorScheme.primary,          // bakgrundsfärg
          //foregroundColor: colorScheme.onPrimary,        // textfärg/ikonfärg
          elevation: 3, // lätt skugga
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5), // rundade hörn
          ),
          padding: EdgeInsets.zero, // låt SizedBox styra storleken
        ),
        child: Text(
          label,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: textColor ?? Colors.blueGrey),
        ),
      ),
    );
  }
}
