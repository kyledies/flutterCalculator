import 'package:flutter/material.dart';
import 'calc_button.dart'; // 👈 importera din knapp-widget

class CalculatorLayout extends StatelessWidget {
  const CalculatorLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 400,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        //color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.red, width: 3),
      ),
      
      child: Center(
        child: Row(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CalcButton(
                  label: '7',
                  onPressed: () {
                    print('Knapp 7 trycktes');
                  },
                ),
                CalcButton(
                  label: '8',
                  onPressed: () {
                    print('Knapp 7 trycktes');
                  },
                ),
                CalcButton(
                  label: '9',
                  onPressed: () {
                    print('Knapp 7 trycktes');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
