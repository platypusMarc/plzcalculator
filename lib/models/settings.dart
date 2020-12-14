class Settings {
  static Settings _singleton = Settings._internal();

  // TODO: Nullen
  String ausgangsort;
  int fahrtkostenH = 5000;
  int fahrtkostenKm = 49;
  bool hotel = true;
  int hotelKosten = 5000;
  int hotelAbKm = 150;
  int hotelAbH = 3;
  int mwstSatz = 16;

  Settings._internal();
  factory Settings() {
    return _singleton;
  }
}
