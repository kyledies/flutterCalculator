// lib/widgets/calc_button.dart
import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final String label; // Texten på knappen, t.ex. "7" eller "+"
  final VoidCallback onPressed; // Vad som ska hända när man trycker

  const CalcButton({super.key, required this.label, required this.onPressed});

  //Kanske snyggt att ha färger efter tema
  @override
  Widget build(BuildContext context) {
    //final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: 70,
      height: 70,
      child: ElevatedButton(
        onPressed: onPressed,
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
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
