class Settings {
  static Settings _singleton = Settings._internal();

  String ausgangsort;
  int fahrtkostenH = 0;
  int fahrtkostenKm = 0;
  bool hotel = false;
  int hotelKosten = 0;
  int hotelAbKm = 0;
  int hotelAbH = 0;
  int mwstSatz = 16;

  Settings._internal();
  factory Settings() {
    return _singleton;
  }

  /*String get ausgangsort => _ausgangsort;
  int get fahrtkostenH => _fahrtkostenH;
  int get fahrtkostenKm => _fahrtkostenKm;
  bool get hotel => _hotel;
  int get hotelkosten => _hotelkosten;
  int get hotelAbKm => _hotelAbKm;
  int get hotelAbH => _hotelAbH;
  int get mwstSatz => _mwstSatz;*/

}
