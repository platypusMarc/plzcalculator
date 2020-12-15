# plzcalculator

Ein Flutter-Projekt aus dem Unterricht in der Umschulung zum Fachinformatiker (hauptsächlich Fachrichtung Anwendungsentwicklung) in der Bfz-Kassel GmbH. In dem Projekt geht es darum, eine kleine Beispiel-App zu schreiben - als Einstieg in die Entwicklung mit Flutter und um das eine oder andere zur objektorientierten Programmierung zu testen, zum Beispiel prüfungsrelevante Entwurfsmuster.

## Was bisher geschah

### Unterricht vom 07.12.2020

Wir haben den Eingabe-Screen (lib/screens/calculator_screen.dart) geschrieben, auf dem man im Wesentlichen eine Taschenrechner-artige Eingabemöglichkeit für Postleitzahlen hat. Hier wird auf die Eingaben der Nutzer reagiert, Fehleingaben werden abgefangen und der gesamte Screen nutzt GridView.builder, um die einzelnen Kacheln (Tasten) über eine Funktion zu erstellen.

Ebenso haben wir einen Screen (lib/screens/settings_screen.dart) geschaffen, auf dem man die zugrundeliegenden Einstellungen für die App modofizieren kann. Dieser Screen besteht auf einer Auflistung von Einstellungen, davor (im Stack) ist eine graue, halbdurchsichtige Box platziert (die nur die Aufgabe hat, den Hintergrund auszugrauen) und davor wiederum ist eine Eingabebox platziert, in der man nun konkret eine Eingabe verändern kann. Bei der Sektion "Hotelkosten berechnen" ist ein Switch für die Ja/Nein-Eingabe platziert. Die Eingabebox ist statisch, liegt also IMMER vor den eigentlichen Einstellungs-Optionen, ebenso der Hintergrund. Beides soll dann in Zukunft dynamisch sein, also nur eingeblendet werden, wenn man zuvor auf eine Einstellungsmöglichkeit geklickt hat, also eine Einstellung ändern möchte.

Ferner haben wir die zugrundeliegenden Klassen (lib/models/...) geschaffen, in denen wir a) die Eingabe des Nutzers, b) alle Einstellungen und c) das Resultat der Suchanfrage (also wie lange ist es von A nach B) speichern werden.

### Unterricht vom 14.12.2020

Wir haben in ein Provider-"Interface" (lib/controller/map_provider_interface.dart) geschaffen, also genauer gesagt etwas, was in Programmiersprachen wie Java und C# ein Interface wäre. In Dart gibt es keine Interfaces im engeren Sinne bzw. jede Klasse ist auch ein Interface. Der wesentliche Zweck des Interfaces bzw. der letztlich implementierten abstrakten Klasse ist, dass wir an anderer Stelle uns immer schon auf das Interface beziehen können, obwohl wir die konkrete Umsetzung als API-Anfrage an Google Maps noch gar nicht umgesetzt haben. Wir werden also überall nur von MapProvider ausgehen, wohlwissend, dass am Ende in Realität dahinter zum Beispiel eine Klasse namens GoogleMapsMapProvider steckt. Außerdem haben wir fürs erste eine Klasse MockMapProvider (lib/controller/map_provider_mock.dart) geschaffen, die einfach so tut, als wäre sie eine Art Google Maps-Aufruf. Sie gibt einfach nach einer Wartezeit von 2 Sekunden ein Suchresultat zurück (immer das gleiche, egal welche PLZ man eingstellt hat), hält sich dabei an die Vorgaben in dem "Interface". Auf diese Weise konnten wir dann mit diesem Mock-Suchergebnis anfangen, den Resultat-Screen (lib/screens/resultat_screen.dart) zu bauen. Diese Technik, auf Interfaces zu programmieren statt auf konkrete Klassen, ist insbesondere in Firmen wichtig, weil dann zB das Team, das an der GoogleMaps-Anfrage arbeitet, in Ruhe diese fertigstellen kann, während aber die Arbeit des Teams, das den Screen baut, nicht aufgehalten wird.

Außerdem haben wir die Resultat-Klasse (lib/models/resultat.dart) erweitert. Der Konstruktor nimmt jetzt als Parameter die Ergebnisse einer Routensuche (Fahrtstrecke und Fahrzeit). Wenn ein solches Objekt also (von dem MapProvider) erstellt wird, dann werden davon ausgehend, unter Berücksichtigung der Settings in lib/models/settings.dart alle anderen Werte berechnet, also zB die Fahrtkosten samt Mehrwertsteuer etc. Dazu haben wir jeweils die passenden Formeln gebastelt. Generell gilt übrigens jetzt, dass wir in Cent (statt Euro) rechnen, also überall int-Werte verwenden statt double-Werten. Das ist generell gute Praxis, weil man damit unzählige Rundungsfehler umgeht.

Der frisch geschaffene Screen für das Resultat (lib/screens/resultat_screen.dart) zeigt das Ergebnis einer Suche (also sowohl die Angaben zru Fahrtstrecke und Fahrtzeit, die wir vom MapProvider bekommen) als auch die daraus abgeleiteten Ergebnisse an. Es sieht nur noch grottig aus.

Ansonsten haben wir nur begonnen, den Settings-Screen (lib/screens/settings_screen.dart) zu dynamisieren. Ob die InputBox und die Hintergrund-Abdunklung angezeigt wird, hängt jetzt von der Variablen _showInputBox ab. Diese wird dann anfangs auf false stehen und auf true umgestellt, wenn wir zuvor eine Einstellmöglichkeit angeklickt haben. Beispielsweise umgesetzt ist das bei bei Fahrtkosten/km. Wenn man hier klickt, dann wird die Variable umgestellt, also erscheint dann die InputBox und man kann eine neue Einstellung vornehmen. Allerdings wird die Eingabe noch nirgendwohin übernommen etc.

### Heimarbeit (Andreas Höfer) vom 14.12.2020

Das controller-Verzeichnis wurde in provider umbenannt, einfach weil wir die Klassen ja eh jeweils MapProvider genannt haben.

Der MockupProvider (lib/providers/map_provider_mock.dart) wurde umgeschrieben. Er gibt jetzt nicht immer die gleichen Werte, sondern zufällig bestimmte Werte aus, weil sich so leichter Fehler finden lassen, wenn die Zahlen etwas variieren.

Der Settings-Screen ist jetzt komplett benutzbar, um alle Einstellungen vorzunehmen. Außerdem wurde er erheblich umgeschrieben, um ihn kürzer und übersichtlicher zu machen. Die meisten der Einträge werden jetzt über eine Methode ausgegeben, sodass nur noch ein Methodenaufruf passiert, anstatt jedes mal ein InkWell mit einer Karte und etlichen Paddings etc. auszuschreiben. Der Methodenaufruf ist recht komplex, weil allerhand Werte mit gegeben werden.

Es wurden Vorbereitungen in main.dart getroffen, um gespeicherte Settings einzulesen, was aber noch nicht implementiert ist. Wenn keine Settings eingelesen werden konnten, also beim ersten Start der App (bzw. jetzt im Moment immer, weil wir nicht speichern können), wird man am Anfang automatisch auf den SettingsScreen geleitet, ansonsten direkt zum CalculatorScreen.

### Heimarbeit (noch in Planung)

Ziel ist eigentlich, nach den Winterferien den GoogleMaps-Aufruf zu implementieren. Die reinen Optimierungen der GUI werde ich separat vornehmen. Ich habe mir vorgenommen, die folgenden Punkte zu erledigen, ohne dass wir es im Unterricht live machen:

+ Optimierung des Calculator-Screens: Der Screen ist gegenwärtig bei der Ausgabe auf einem Mobilgerät a) noch nicht wirklich flächendeckend. Das hängt mit der Berechnung der Bildschirmhöhe zusammen. Diese ist im Moment fehlerhaft. Die genutzte Fläche ist zu groß, weil zwar die Höhe der AppBar abgezogen wird, aber nicht die Höhe der unbenutzbaren Bildschirmbereiche unten (wo die Zurück/Home/etc-Buttons bei einem Android-Handy sind) und oben (wo zB die Kamera oder die Uhrzeitanzeige einen Teil des Bildschirms verdeckt). Außerdem braucht es eine vernünftige mathematische Lösung für die optimale Größe von Buttons auf dem Screen, damit die Tasten insgesamt den Platz auf dem Bildschirm gut ausnutzen. Außerdem wird ein alternatives Layout entwickelt, wenn jemand das Handy quer hält (Landscape-Modus), denn dann haben wir in der Vertikalen nicht genug Platz. Es müssen wahrscheinlich 6 Tasten nebeneinander angezeigt werden plus der Kasten für die Eingabe (also die 5stellige PLZ) sollte rechts oder links von den Tasten erscheinen, nicht darüber, weil in der Vertikalen kein Platz ist.

## TO-DO-Liste insgesamt

Die folgenden Ziele liegen noch vor uns und sollen weitestgehend im Unterricht realisiert werden:

+ Settings werden lokal auf dem Device abgespeichert, damit man nicht jedes Mal von vorne anfangen muss.
+ Settings werden natürlich dann auch wieder eingelesen.
+ Abruf der Daten von Google Maps.
+ Alternativ, falls möglich: Abruf der Daten von OpenStreetMaps, weil kostenlos.
+ Code-Optimierungen, geleitet von den in dem SDK eingebauten Anforderungen an gutes Design.
+ Dokumentation automatisch erstellen und verstehen.
