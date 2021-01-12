import 'package:plzcalculator/models/settings.dart';

class Eingabe {
  String _zielPlz;
  String _startPlz;

  Eingabe(this._zielPlz) {
    Settings settings = Settings();
    _startPlz = settings.ausgangsort;
  }

  String get zielPlz => _zielPlz;
  String get startPlz => _startPlz;
}
