import 'dart:async';

import 'package:plzcalculator/controller/map_provider_interface.dart';
import 'package:plzcalculator/models/eingabe.dart';
import 'package:plzcalculator/models/resultat.dart';

class MockMapProvider implements MapProvider {
  Future<Resultat> getResult(Eingabe eingabe) {
    return Future.delayed(
      Duration(seconds: 2),
      () {
        return Resultat(
          fahrtstrecke: 200,
          fahrtzeit: 120,
        );
      },
    );
  }
}
