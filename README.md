# flutterCalculator

Kort genomgång av applikationen - Miniräknare ESP7000
  
Funktioner:
En enkel miniräknare byggd i Flutter med stöd för grundläggande matematiska operationer som:
     +, -, ×, ÷, "is equal", modulus (%), ≤.
     Division med 0 detekteras (genom check av result.String() == Infinity eller -Infinity)
Användarvänligt UI som visar resultat i display, beräkning för resultat ovanför display samt scrollbar lista med historik över kompletta beräkningar. La även till en animerad overlay som med async visar animering (loading_animation_widget: ^1.2.0) under simulerad väntetid när man klickar på "=".

Kortfattad om mappstruktur och filers innehåll:
lib/
 ├─ theme/
 │    └─ app_theme.dart.dart      # Mörkt/ljust tema + font
 ├─ utils/
 │    └─ operation_helper.dart    # Parsning + evaluator av uttryck m.h.a. expressions-paketet
 ├─ widgets/                      # Separata widgets för separerade komponenter
 │    └─ calc_button.dart         # Widget för knapp till keypad
 │    └─ calculator_display.dart  # Widget för display till calculator_layout
 │    └─ calculator_layout.dart   # Hela miniräknarens layout (knappar, display m.m.)
 │    └─ keypad.dart              # Row/Col med knappar 
 ├─ app.dart                      # Appens Build med Scaffold
 └─ main.dart                     # Appens entrypoint (runApp)

 ***app_theme.dart.dart***
 Innehåller class AppTheme som används i app.dart - Styr "light" resp "dark" läge
 Kommentar - Styr hårdkodat färger o.s.v. på olika ställen så fungerar ej som tänkt (Dark mode blir fint)

 ***operation_helper.dart***
 Innehåller kod för parsning och utvärdering av uttryck m.h.a. expressions-paketet ^0.2.5+3. Input från miniräknare parsas, t.ex. "5 ÷ 2" till "5/2" (ett uttryck som expressions-paketet kan utvärdera) och utryck utvärderas och vi får svar. Vid fel används "rethrow" som skickar tillbaka felet.
Kommentar - Lite lat då jag inte använde egna funktioner, men fungerar för mer "komplexa" uttryck

***calculator_layout.dart***
Miniräknarens layout ligger i en Container med stack av:
    #1 Vanlig vy - Scrollbar Column med Text, Widgets för display, keypad samt Text med historik. 
    #2 Container med animering vid laddning (vid _isCalculating == true)

Här struktureras miniräknarens UI mest - Innehåller State med följande variabler:
    _displayValue - Det värde som display ska visa
    _history - Lista med tidigare beräkningar (final resultString = '$expression = $result';)
    _lastExpression - Beräkning som gav aktuellt resultat i display
    _isCalculating - bool för att flagga att "beräkning pågår" - Visar animering så länge beräkning pågår

Skriptet innehåller kod för funktioner som uppdaterar State (setState())
    _onButtonPressed - Vad sker vid klick på knapp (visat värde uppdateras genom att värde/operation läggs till)
    _onClearPressed - Vad sker vid klick på "C" (skärm ska rensas och visa 0)
    _onEqualsPressed - Vad sker vid klick på "=" (uttryck ska utvärderas, ge resultat och under tiden visa animering)

***keypad.dart***
Kod för knappsats vilket struktureras med Column+Row.
Funktionen kräver:
    onDigitPressed   - _onButtonPressed från parent
    onClearPressed   - _onClearPressed -II-
    onEqualsPressed  - _onEqualsPressed -II-
Vilket skickas vidare till calc_button.dart beroende på vilken knapp som ska byggas.

***calc_button.dart***
Kod för knapp (ElevatedButton) vilken ligger i en SizedBox.
Funktionen kräver:
    onPressed   - referens till någon av onDigitPressed, onClearPressed eller onEqualsPressed ovan
    label       - vad knappen ska visa (t.ex. "1", "-", "=")
samt har möjlighet att te emot höjd, bredd samt färg av label.

***calculator_display.dart***
Kod för displayen som kräver value (_displayValue)
Här väljs b.la. hur många rader display kan visa (n=1), samt hur "för många siffror" ska illustreras (overflow).

Allmänna kommentarer - Försökte fokusera på att separera programmet i logiska delar och tycker i överlag att resultatet blev bra.

Har börjat förstå logiken kring nästling av widgets helt OK, men det blir fort rörigt - så förstår att vägen till lyckade applikationer går via mappstruktur.

Använde AI som bollplank och pedagog - fick ofta hålla tillbaka förslag o.s.v. för att ta fram något som jag som jag känner speglar min egna förståelse rättvist.








