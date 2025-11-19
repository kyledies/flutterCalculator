import 'package:flutter/material.dart';

class CalculatorDisplay extends StatelessWidget {
  final String value;

  const CalculatorDisplay({
    super.key,
    required this.value,
  });

  //Vår display ligger i en Container för att efterlikna en riktig display
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20), //inre padding
      margin: const EdgeInsets.all(15), //yttre margin
      alignment: Alignment.centerRight, //högerjustera text som standard-miniräknare
      decoration: BoxDecoration( //klass som styr utseende på containern
        borderRadius: BorderRadius.circular(12), //rundade hörn
        color: const Color(0xFF202124), // mörk “skärm”
        border: Border.all( //kantlinje för containern
          color: Colors.greenAccent,
          width: 2,
        ),
        boxShadow: const [ //lite skuggor som ögongodis
          BoxShadow(
            blurRadius: 30,
            //offset: Offset(0, 3),
            color: Colors.greenAccent,
          ),
        ],
      ),
      child: Text(
        value,
        maxLines: 1, //Vi tillåter två rader i displayen
        overflow: TextOverflow.ellipsis, //för lång text ger "..."
        style: const TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w600,
          color: Colors.greenAccent, // klassisk “display”-färg
          //letterSpacing: 1.5, // Space mellan tecken, skippar nog detta
        ),
      ),
    );
  }
}
