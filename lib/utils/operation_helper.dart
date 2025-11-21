// Hittade ett fint paket för att evaluera matematiska uttryck som ligger i en sträng:
// https://medium.com/@savaliyaprit64/how-to-extract-and-evaluate-results-from-strings-in-dart-423cc3c08610
import 'package:expressions/expressions.dart';

// 
dynamic extractResultFromString(String displayExpression) {
  // ersätter symboler för att matcha syntax i expressions-paketet
  final expression = displayExpression
      .replaceAll('×', '*')
      .replaceAll('÷', '/')
      .replaceAll(',', '.')
      .replaceAll('≤', '<=')
      .replaceAll('mod', '%')
      .replaceAll(' ', ''); // ta bort ev. mellanslag

  //Försöker parsa uttryck och därefter evaluera det
  try {
    final parsedExpression = Expression.parse(expression);
    const evaluator = ExpressionEvaluator();
    final result = evaluator.eval(parsedExpression, const {});

    if (result is num) {
      return result;
    } else if (result is bool) {
      return result;
    } else {
      throw const FormatException('Error'); //bryter vid icke-tolkningsbart resultat
    }
  } catch (e) { //Fångar fel, skriver ut i konsol samt skickar vidare felet
    print("Error: $e");
    //return 0;
    // skickar felet vidare till anropare (CalculatorLayout)
    // Detta gör det möjligt att köra #catch (e)" och ändra setState för display"
    rethrow; 
  }
}

//Logik ligger för beräkningar
//Från tidigare projekt...
//import 'dart:math';

// num addition(num a, num b) {
//   //returnerar summan av a och b
//   return a + b;
// }

// num subtraction(num a, num b) {
//   //returnerar subtraktionen av a och b
//   return a - b;
// }

// num multiplication(num a, num b) {
//   //returnerar multiplikationen av a och b
//   return a * b;
// }

// num division(num a, num b) {
//   //returnerar divisionen av a och b
//   if (b == 0) {
//     throw ArgumentError('Division by zero is not allowed.');
//   }
//   return a / b;
// }

// num powerby(num base, num exponent) {
//   //returnerar basen upphöjt till exponenten
//   return pow(base, exponent);
// }
