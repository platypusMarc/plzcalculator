import 'dart:async';
import 'dart:math';

import 'package:plzcalculator/providers/map_provider_interface.dart';
import 'package:plzcalculator/models/eingabe.dart';
import 'package:plzcalculator/models/resultat.dart';

class MockMapProvider implements MapProvider {
  Future<Resultat> getResult(Eingabe eingabe) {
    return Future.delayed(
      Duration(seconds: 2),
      () {
        final rng = Random();
        final km = rng.nextInt(500) + 1;
        // ergibt eine km-Entfernung zwischen 1 und 500 km
        final tempo = rng.nextDouble() * 60 + 60;
        // ergibt eine D-Geschwindigkeit zwischen 60 und 120 km/h
        final fahrtzeit = (km / tempo * 60).round();
        // ergibt entsprechend die Fahrtzeit (die * 60 wegen der Angabe in Minuten)

        return Resultat(
          fahrtstrecke: km.toDouble(),
          fahrtzeit: fahrtzeit,
        );
      },
    );
  }
}
