# plzcalculator

Ein Flutter-Projekt aus dem Unterricht in der Umschulung zum Fachinformatiker (hauptsächlich Fachrichtung Anwendungsentwicklung) in der Bfz-Kassel GmbH. In dem Projekt geht es darum, eine kleine Beispiel-App zu schreiben - als Einstieg in die Entwicklung mit Flutter und um das eine oder andere zur objektorientierten Programmierung zu testen, zum Beispiel prüfungsrelevante Entwurfsmuster.

## Was bisher geschah

### Unterricht vom 07.12.2020

Wir haben den Eingabe-Screen (lib/screens/calculator_screen.dart) geschrieben, auf dem man im Wesentlichen eine Taschenrechner-artige Eingabemöglichkeit für Postleitzahlen hat. Hier wird auf die Eingaben der Nutzer reagiert, Fehleingaben werden abgefangen und der gesamte Screen nutzt GridView.builder, um die einzelnen Kacheln (Tasten) über eine Funktion zu erstellen.

Ebenso haben wir einen Screen (lib/screens/settings_screen.dart) geschaffen, auf dem man die zugrundeliegenden Einstellungen für die App modofizieren kann. Dieser Screen besteht auf einer Auflistung von Einstellungen, davor (im Stack) ist eine graue, halbdurchsichtige Box platziert (die nur die Aufgabe hat, den Hintergrund auszugrauen) und davor wiederum ist eine Eingabebox platziert, in der man nun konkret eine Eingabe verändern kann. Bei der Sektion "Hotelkosten berechnen" ist ein Switch für die Ja/Nein-Eingabe platziert. Die Eingabebox ist statisch, liegt also IMMER vor den eigentlichen Einstellungs-Optionen, ebenso der Hintergrund. Beides soll dann in Zukunft dynamisch sein, also nur eingeblendet werden, wenn man zuvor auf eine Einstellungsmöglichkeit geklickt hat, also eine Einstellung ändern möchte.

Ferner haben wir die zugrundeliegenden Klassen (lib/models/...) geschaffen, in denen wir a) die Eingabe des Nutzers, b) alle Einstellungen und c) das Resultat der Suchanfrage (also wie lange ist es von A nach B) speichern werden.

### Unterricht vom 14.12.2020

Wir haben ein Provider-"Interface" (lib/controller/map_provider_interface.dart) geschaffen, also genauer gesagt etwas, was in Programmiersprachen wie Java und C# ein Interface wäre. In Dart gibt es keine Interfaces im engeren Sinne bzw. jede Klasse ist auch ein Interface. Der wesentliche Zweck des Interfaces bzw. der letztlich implementierten abstrakten Klasse ist, dass wir an anderer Stelle uns immer schon auf das Interface beziehen können, obwohl wir die konkrete Umsetzung als API-Anfrage an Google Maps noch gar nicht umgesetzt haben. Wir werden also überall nur von MapProvider ausgehen, wohlwissend, dass am Ende in Realität dahinter zum Beispiel eine Klasse namens GoogleMapsMapProvider steckt. Außerdem haben wir fürs erste eine Klasse MockMapProvider (lib/controller/map_provider_mock.dart) geschaffen, die einfach so tut, als wäre sie eine Art Google Maps-Aufruf. Sie gibt einfach nach einer Wartezeit von 2 Sekunden ein Suchresultat zurück (immer das gleiche, egal welche PLZ man eingstellt hat), hält sich dabei an die Vorgaben in dem "Interface". Auf diese Weise konnten wir dann mit diesem Mock-Suchergebnis anfangen, den Resultat-Screen (lib/screens/resultat_screen.dart) zu bauen. Diese Technik, auf Interfaces zu programmieren statt auf konkrete Klassen, ist insbesondere in Firmen wichtig, weil dann zB das Team, das an der GoogleMaps-Anfrage arbeitet, in Ruhe diese fertigstellen kann, während aber die Arbeit des Teams, das den Screen baut, nicht aufgehalten wird.

Außerdem haben wir die Resultat-Klasse (lib/models/resultat.dart) erweitert. Der Konstruktor nimmt jetzt als Parameter die Ergebnisse einer Routensuche (Fahrtstrecke und Fahrzeit). Wenn ein solches Objekt also (von dem MapProvider) erstellt wird, dann werden davon ausgehend, unter Berücksichtigung der Settings in lib/models/settings.dart alle anderen Werte berechnet, also zB die Fahrtkosten samt Mehrwertsteuer etc. Dazu haben wir jeweils die passenden Formeln gebastelt. Generell gilt übrigens jetzt, dass wir in Cent (statt Euro) rechnen, also überall int-Werte verwenden statt double-Werten. Das ist generell gute Praxis, weil man damit unzählige Rundungsfehler umgeht.

Der frisch geschaffene Screen für das Resultat (lib/screens/resultat_screen.dart) zeigt das Ergebnis einer Suche (also sowohl die Angaben zur Fahrtstrecke und Fahrtzeit, die wir vom MapProvider bekommen) als auch die daraus abgeleiteten Ergebnisse an. Es sieht nur noch grottig aus.

Ansonsten haben wir nur begonnen, den Settings-Screen (lib/screens/settings_screen.dart) zu dynamisieren. Ob die InputBox und die Hintergrund-Abdunklung angezeigt wird, hängt jetzt von der Variablen _showInputBox ab. Diese wird dann anfangs auf false stehen und auf true umgestellt, wenn wir zuvor eine Einstellmöglichkeit angeklickt haben. Beispielsweise umgesetzt ist das bei bei Fahrtkosten/km. Wenn man hier klickt, dann wird die Variable umgestellt, also erscheint dann die InputBox und man kann eine neue Einstellung vornehmen. Allerdings wird die Eingabe noch nirgendwohin übernommen etc.

### Heimarbeit (Andreas Höfer) vom 14.12.2020

Das controller-Verzeichnis wurde in provider umbenannt, einfach weil wir die Klassen ja eh jeweils MapProvider genannt haben. Der MockupProvider (lib/providers/map_provider_mock.dart) wurde umgeschrieben. Er gibt jetzt nicht immer die gleichen Werte, sondern zufällig bestimmte Werte aus, weil sich so leichter Fehler finden lassen, wenn die Zahlen etwas variieren.

Der Settings-Screen ist jetzt komplett benutzbar, um alle Einstellungen vorzunehmen. Außerdem wurde er erheblich umgeschrieben, um ihn kürzer und übersichtlicher zu machen. Die meisten der Einträge werden jetzt über eine Methode ausgegeben, sodass nur noch ein Methodenaufruf passiert, anstatt jedes mal ein InkWell mit einer Karte und etlichen Paddings etc. auszuschreiben. Der Methodenaufruf ist recht komplex, weil allerhand Werte mit gegeben werden.

Es wurden Vorbereitungen in main.dart getroffen, um gespeicherte Settings einzulesen, was aber noch nicht implementiert ist. Wenn keine Settings eingelesen werden konnten, also beim ersten Start der App (bzw. jetzt im Moment immer, weil wir nicht speichern können), wird man am Anfang automatisch auf den SettingsScreen geleitet, ansonsten direkt zum CalculatorScreen.

### Heimarbeit (Andreas Höfer) vom 15.12.2020

Es wurde in erster Linie der Calculator-Screen umgeschrieben, um jetzt auch auf Mobilgeräten wirklich okay auszusehen. Dabei ging es vor allem um die Berechnung des maximal zur Verfügung stehenden Platzes. Als Ausgangsbasis wurde eine Skizze des Screens im Idealzustand angefertigt, die ich in dem Projekt hier auch gespeichert habe (material/CalculatorScreen.drawio bzw. material/CalculatorScreen.png). Draw.io ist ein kostenloses Tool, mit dem man übrigens solche und andere Grafiken (u.a. UML-Diagramme) recht komfortabel anfertigen kann. Anhand dieser Grafik konnten dann die Berechnungen entwickelt werden, die am Anfang der build-Methode in lib/screens/calculator_screen.dart nun geschehen. Ein bisschen Ausprobieren war dann natürlich trotzdem nötig, also das klappt auch nicht immer im ersten Rutsch. :-) Wie man im Code sehen kann, wird jetzt an einigen Stellen auch unterschieden zwischen Landscape- und Portrait-Modus. Auch in der Webansicht lässt sich schön beobachten, dass die Anpassung an das Browserfenster nun automatisch erfolgt. Aufgrund von Nachfragen versuche ich, die Berechnungen in lib/screens/calculator_screen.dart noch ein bisschen ausführlicher zu erkären.

Außerdem wurde lib/main.dart dahingehend gefixt, dass man nun wirklich auf dem SettingScreen startet, was aber dynamisch ist. Hätte man ein Save-File und würde man dort bereits einmal gespeicherte Einstellungen einfach wieder einlesen, DANN würde man auf dem Calculator-Screen starten, ansonsten ist es, wie gegenwärtig, der SettingsScreen.

#### Erklärung: Berechnung der Größen in lib/screens/calculator_screen.dart

Im Groben besteht die Herangehensweise eigentlich aus den folgenden Punkten:

+   Berechnung des insgsamt zur Verfügung stehenden Platzes für unsere Inhaltselemente (Buttons und leerer Raum zwischen Buttons):
    +   *Breite*: Die gesamte Bildschirmbreite (MediaQuery.of(context).size.width) abzüglich des durch das Gerät vorgegebene Padding links und rechts. Dieses Padding wird nicht von Flutter verwaltet, sondern nur zur Kenntnis genommen. Hier geht es zum Beispiel bei modernen Mobilgeräten um den Platz links und rechts, auf den man keine Inhalte plazieren soll, der aber dennoch formal auch Bildschirm ist, aber eher nur eine Farbe darstellen soll und nicht wirklich Content. Das sind zum Beispiel die Seiten eines Handies, dessen Bildschirm am Rand gebogen ist.
    +   *Höhe*: Die gesamte Bildschirmhöhe, abzüglich dem Padding oben (z.B. für diese Statusleiste, wo Ihr seht, in welchem Netz Ihr seid und ob Ihr WLAN habt), abzüglich dem Padding unten (Bereich des Bildschirms, in dem zum Beispiel die Menu-/Zurück-Taste des Handies platziert ist), abzüglich der Höhe der AppBar (die blaue Leiste, in der "PLZ-Calculator" steht), abzüglich der Höhe des "Taschenrechner-Displays" (calcHeight), da das eine fixe Höhe haben soll.
+   Dann wurde anhand der Grafik in material/CalculatorScreen.xxx festgestellt:
    +   In der Breite stehen nebeneinander in einer Zeile: 3 Buttons und insgesamt 6mal der gleiche Abstand, den wir padX genannt haben. Wir gehen erstmal davon aus, dass alle Paddings mindestens 10 Punkte sind. Nachdem wir dieses Mindest-Padding abgezogen haben von dem zur Verfügung stehenden Platz, wissen wir, wie groß die 3 Buttons zusammen sein dürfen. Geteilt durch 3 ergibt das die *maximalen* Pixel pro Button.
    +   In der Höhe ist das ähnlich, nur erscheinen hier 10 Paddings und vier Buttons übereinander.Die Rechnung ist aber die gleiche.
+   Wir wollen, dass die Buttons quadratisch sind. Da wir wissen, wie groß sie in X/Y-Richtung *maximal* sein dürfen, gilt: Der kleine der beiden Werte bestimmt die Breite *und* Höhe des Quadrats.
+   Jetzt wissen wir die tatsächliche Größe des Buttons. In der Dimension (X oder Y), in der der Button ruhig noch größer hätte sein dürfen, weil genug Platz zur Verfügung steht, wird nun mit der feststehenden Höhe bzw. Breite erneut gerechnet, wobei aber jetzt das padX oder padY berechnet wird. Der freigewordene Platz wird also sozusagen auf die Paddings verteilt.
+   Dann stehen alle Werte fest und sie müssen nur noch angewendet werden.
    +   Das "Taschenrechner-Display" erhält oben einen Rand von padY, links und rechts von padX und unten 2mal padY, da laut unserem Schema da zwei Abstände zur ersten Button-Reihe notwendig sind.
    +   Der Container hat nun eine Höhe, was die zuvor ausgerechnete zur Verfügung stehende Breite minus der insgesamt 3mal padY ist, die wir als Paddings schon angewendet haben auf das Display.
    +   Der Container hat ein Padding drumherum, was links und rechts jeweils padX anwendet. Seine Breite ist also auch klar.
    +   Die anderen Paddings zwischen den Tasten werden über den Abstand im Grid definiert, der halt zwischen den einzelnen Pad-Elementen jeweils 2x padX bzw. pdadY ist.
+   Im Landscape-Modus ist die Herangehensweise dann gleich, nur dass mehr buttons nebeneinander (6) und weniger untereinander (2) dargestellt werden.

### Heimarbeit (Andreas Höfer) vom 12.01.2021

Anpassungen am ResultScreen, auf dem die Ergebnisse der eigenen PLZ-Suche nun schöner dargestellt werden, auch im Landscape-Modus.

### Unterricht vom 18.01.2021

Im Wesentlichen sind wir die Funktionalität nochmal durchgegangen und haben dann nur (wenn auch entscheidende) Kleinigkeiten am Code verändert. Hinzugekommen ist die Datei providers/map_provider_google.dart, mit der nun Anfragen online an die Google Maps Directions API gestellt werden können. Nach einen Experimenten wurde der API-Schlüssel eingerichtet und somit sind Anfragen in einem bestimmten Rahmen (ca. 4.000 pro Tag) gratis.

### Nacharbeit (Andreas Höfer) vom 18.01.2021

Damit der Zustand der App stabil ist, wurden noch Kleinigkeiten angepasst. Die Abstract Factory in /providers/map_provider_interface.dart instanziiert nun GoogleMapProvider statt MockMapProvider. Da die GoogleMaps-API die Entfernung in Metern misst und die Fahrtzeit in Sekunden und da beides (analog zu der Angabe von Euro in Cents) sinnvoll ist, da wir mit int-Werten statt double hantieren, wurde auch das Model für Resultat (/models/resultat.dart) angepasst und verwendet nun Zeitangaben in Sekunden bzw. Metern. Kleinere Anpassungen mussten auch in der GUI vorgenommen werden, um mit den neuen Werten umzugehen.

## TO-DO-Liste insgesamt

Die folgenden Ziele liegen noch vor uns und sollen weitestgehend im Unterricht realisiert werden:

+ Settings werden lokal auf dem Device abgespeichert, damit man nicht jedes Mal von vorne anfangen muss.
+ Settings werden natürlich dann auch wieder eingelesen.
+ Ggf. Login-Lösung
+ Alternativ zu GoogleMaps: Abruf der Daten von OpenStreetMaps, weil kostenlos.
+ Code-Optimierungen, geleitet von den in dem SDK eingebauten Anforderungen an gutes Design.
+ Dokumentation automatisch erstellen und verstehen.
