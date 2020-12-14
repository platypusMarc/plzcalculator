import 'package:plzcalculator/models/settings.dart';

class Resultat {
  // gegeben bei Konstruktion
  final double fahrtstrecke;
  final int fahrtzeit;
  // errechnet
  int fahrtkostenStrecke = 0;
  int fahrtkostenZeit = 0;
  int hotelkosten = 0;
  int summe = 0;
  int mwst = 0;
  int bruttosumme = 0;

  Resultat({this.fahrtstrecke, this.fahrtzeit}) {
    Settings settings = Settings();
    if (fahrtstrecke == null || fahrtzeit == null) {
      return;
    }
    fahrtkostenStrecke = 2 * fahrtstrecke.round() * settings.fahrtkostenKm;
    fahrtkostenZeit = (2 * fahrtzeit * settings.fahrtkostenH) ~/ 60;
    if (settings.hotel &&
        (fahrtstrecke >= settings.hotelAbKm ||
            (2 * fahrtzeit ~/ 60) >= settings.hotelAbH)) {
      hotelkosten = settings.hotelKosten;
    }
    summe = fahrtkostenStrecke + fahrtkostenZeit + hotelkosten;
    mwst = (summe * settings.mwstSatz / 100).round();
    bruttosumme = summe + mwst;
  }
}
