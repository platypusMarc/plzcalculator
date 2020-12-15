class Settings {
  //==========================================================================//
  // Attribute, Getters, Setters                                              //
  //==========================================================================//
  String _ausgangsort = '';
  int _fahrtkostenH = 5000;
  int _fahrtkostenKm = 49;
  bool _hotel = true;
  int _hotelKosten = 5000;
  int _hotelAbKm = 150;
  int _hotelAbH = 3;
  int _mwstSatz = 16;

  static Settings _singleton = Settings._internal();
  bool initialized = false;

  String get ausgangsort => _ausgangsort;
  int get fahrtkostenH => _fahrtkostenH;
  int get fahrtkostenKm => _fahrtkostenKm;
  bool get hotel => _hotel;
  int get hotelKosten => _hotelKosten;
  int get hotelAbKm => _hotelAbKm;
  int get hotelAbH => _hotelAbH;
  int get mwstSatz => _mwstSatz;

  set hotel(bool hotel) {
    _hotel = hotel;
    initialized = true;
  }

  //==========================================================================//
  // Konstruktoren                                                            //
  //==========================================================================//
  // Der interne Konstruktor (wird nur einmal aufgerufen, initialisiert das
  // Objekt, ist hier aber ohne Funktion, weil wir alle Initialisierungen
  // oben bei den Attributen vornehmen)
  Settings._internal();

  // Der externe Konstruktor gibt immer nur den Verweis auf das einmalig
  // instanzierte Objekt zurück. Es handelt sich um ein Singleton, also das
  // Erzeugen eines weiteren Setting-Objektes wird unterbunden
  factory Settings() {
    return _singleton;
  }

  //==========================================================================//
  // Methoden                                                                 //
  //==========================================================================//
  void readFromFile() {
    // TODO: Muss noch implementiert werden
    initialized = false;
  }

  void saveToFile() {
    // TODO: Muss noch implementiert werden
  }

  // Die folgenden "Pseudo-Setter" haben nur die Funktion, dass sie Methoden
  // definieren, mit denen man o.a. Attribute setzen kann. Das hat den einen
  // Vorteil, das man einen Verweis auf diese Funktionen als Argument übergeben
  // kann. Das passiert vor allem im Settings-Screen
  // Der Parameter ist jeweils ein String, weil das vom Textfeld so übergeben wird
  void setAusgangsort(String ausgangsort) {
    _ausgangsort = ausgangsort;
    initialized = true;
    saveToFile();
  }

  void setFahrtkostenKm(String strFahrtkostenKm) {
    // Zuerst werden alle , durch . ersetzt. Das Ergebnis ist eine interpretierbare
    // Kommazahl. Das wird mal 100 genommen, weil uns die Cents interessieren
    // Zum Ende wird (eigentlich ohne Effekt, wenn es keine Rechenfehler gibt)
    // gerundet, weil wir einen int-Wert wollen
    int fahrtkostenKm =
        (double.parse(strFahrtkostenKm.replaceAll(',', '.')) * 100).round();
    _fahrtkostenKm = fahrtkostenKm;
    initialized = true;
    saveToFile();
  }

  void setFahrtkostenH(String strFahrtkostenH) {
    // siehe setFahrtkostenKm
    int fahrtkostenH =
        (double.parse(strFahrtkostenH.replaceAll(',', '.')) * 100).round();
    _fahrtkostenH = fahrtkostenH;
    initialized = true;
    saveToFile();
  }

  void setHotelKosten(String strHotelKosten) {
    // siehe setFahrtkostenKm
    int hotelKosten =
        (double.parse(strHotelKosten.replaceAll(',', '.')) * 100).round();
    _hotelKosten = hotelKosten;
    initialized = true;
    saveToFile();
  }

  void setHotelAbKm(String strHotelAbKm) {
    // siehe setFahrtkostenKm, allerdings ohne den x100-Faktor
    int hotelAbKm = double.parse(strHotelAbKm.replaceAll(',', '.')).round();
    _hotelAbKm = hotelAbKm;
    initialized = true;
    saveToFile();
  }

  void setHotelAbH(String strHotelAbH) {
    // siehe setFahrtkostenKm, allerdings ohne den x100-Faktor
    int hotelAbH = double.parse(strHotelAbH.replaceAll(',', '.')).round();
    _hotelAbH = hotelAbH;
    initialized = true;
    saveToFile();
  }

  void setMwstSatz(String strMwstSatz) {
    // siehe setFahrtkostenKm, allerdings ohne den x100-Faktor
    int mwstSatz = double.parse(strMwstSatz.replaceAll(',', '.')).round();
    _mwstSatz = mwstSatz;
    initialized = true;
    saveToFile();
  }
}
