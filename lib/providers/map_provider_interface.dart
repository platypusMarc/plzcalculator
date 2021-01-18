import 'package:plzcalculator/providers/map_provider_google.dart';
import 'package:plzcalculator/providers/map_provider_mock.dart';
import 'package:plzcalculator/models/eingabe.dart';
import 'package:plzcalculator/models/resultat.dart';

abstract class MapProvider {
  Future<Resultat> getResult(Eingabe eingabe);

  factory MapProvider() => GoogleMapProvider();
}
