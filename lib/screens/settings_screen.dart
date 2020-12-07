import 'package:flutter/material.dart';
import 'package:plzcalculator/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Settings _settings = Settings();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Einstellungen',
        ),
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              Card(
                color: Colors.blue[50],
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Flex(
                    direction: Axis.horizontal,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          'Ausgangsort',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Expanded(
                        child: Text(_settings.ausgangsort ?? '',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 18,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.blue[50],
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Flex(
                    direction: Axis.horizontal,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          'Fahrtkosten / km',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Expanded(
                        child: Text(getEuro(_settings.fahrtkostenKm),
                            textAlign: TextAlign.right,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 18,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.blue[50],
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Flex(
                    direction: Axis.horizontal,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          'Fahrtkosten / Stunde',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Expanded(
                        child: Text(getEuro(_settings.fahrtkostenH),
                            textAlign: TextAlign.right,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 18,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.blue[50],
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Flex(
                    direction: Axis.horizontal,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          'Hotelübernachtung?',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Switch(
                        value: _settings.hotel,
                        onChanged: (value) {
                          setState(() {
                            _settings.hotel = value;
                          });
                        },
                        activeTrackColor: Colors.lightGreenAccent,
                        activeColor: Colors.green,
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.blue[50],
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Flex(
                    direction: Axis.horizontal,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          'Hotelkosten',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Expanded(
                        child: Text(getEuro(_settings.hotelKosten),
                            textAlign: TextAlign.right,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 18,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.blue[50],
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Flex(
                    direction: Axis.horizontal,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          'Hotel ab km',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Expanded(
                        child: Text('${_settings.hotelAbKm} km',
                            textAlign: TextAlign.right,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 18,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.blue[50],
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Flex(
                    direction: Axis.horizontal,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          'Hotel ab Stunden',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Expanded(
                        child: Text('${_settings.hotelAbH} h',
                            textAlign: TextAlign.right,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 18,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.blue[50],
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Flex(
                    direction: Axis.horizontal,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          'Mehrwertsteuersatz',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Expanded(
                        child: Text('${_settings.mwstSatz} %',
                            textAlign: TextAlign.right,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 18,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            color: Colors.grey.withOpacity(0.5),
          ),
          Center(
            child: Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Flex(
                  direction: Axis.vertical,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: Text(
                        'Geben Sie den neuen Wert ein.',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      width: 200,
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: 'Ihre Eingabe',
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.blue,
                            ))),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String getEuro(int zahl) {
    int euro = zahl ~/ 100;
    int zcent = (zahl - euro * 100) ~/ 10;
    int cent = zahl - euro * 100 - zcent * 10;
    return '$euro,$zcent$cent Euro';
  }
}
