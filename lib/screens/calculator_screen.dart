import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plzcalculator/providers/map_provider_interface.dart';
import 'package:plzcalculator/functions/functions.dart';
import 'package:plzcalculator/models/eingabe.dart';
import 'package:plzcalculator/models/resultat.dart';
import 'package:plzcalculator/screens/resultat_screen.dart';

class CalculatorScreen extends StatefulWidget {
  static String routeName = '/';
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _eingabe = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PLZ-Calculator',
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Get.toNamed('/settings');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.black,
            width: double.infinity,
            height: 80,
            child: Center(
              child: Text(
                _eingabe,
                style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 48,
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height -
                80 -
                AppBar().preferredSize.height,
            padding: EdgeInsets.fromLTRB(100, 50, 100, 25),
            width: MediaQuery.of(context).size.width,
            child: GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              children: _buildKeys(),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildKeys() {
    List<Widget> list = [];
    for (int x = 1; x <= 12; x++) {
      if (x < 10) {
        list.add(
          Card(
            color: Colors.grey[350],
            child: InkWell(
              splashColor: Colors.blue,
              onTap: () {
                pressButton(x.toString());
              },
              child: Center(
                child: Text(
                  x.toString(),
                  style: TextStyle(
                    fontSize: 32,
                  ),
                ),
              ),
            ),
          ),
        );
      } else if (x == 10) {
        list.add(
          Card(
            color: Colors.grey[350],
            child: InkWell(
              splashColor: Colors.blue,
              onTap: () {
                pressButton('DEL');
              },
              child: Center(
                child: Text(
                  '<-',
                  style: TextStyle(
                    fontSize: 32,
                  ),
                ),
              ),
            ),
          ),
        );
      } else if (x == 11) {
        list.add(
          Card(
            color: Colors.grey[350],
            child: InkWell(
              splashColor: Colors.blue,
              onTap: () {
                pressButton('0');
              },
              child: Center(
                child: Text(
                  '0',
                  style: TextStyle(
                    fontSize: 32,
                  ),
                ),
              ),
            ),
          ),
        );
      } else {
        list.add(
          Card(
            color: Colors.grey[350],
            child: InkWell(
              splashColor: Colors.blue,
              onTap: () {
                pressButton('OK');
              },
              child: Center(
                child: Text(
                  'OK',
                  style: TextStyle(
                    fontSize: 32,
                  ),
                ),
              ),
            ),
          ),
        );
      }
    }
    return list;
  }

  void pressButton(String key) async {
    if (key == 'DEL') {
      if (_eingabe.length > 0) {
        setState(() {
          _eingabe = _eingabe.substring(0, _eingabe.length - 1);
        });
      }
    } else if (key == 'OK') {
      if (_eingabe != null &&
          _eingabe.length == 5 &&
          Funktionen.isNumeric(_eingabe)) {
        MapProvider mp = MapProvider();
        Resultat resultat = await mp.getResult(Eingabe(_eingabe));
        if (resultat != null) {
          Get.to(ResultatScreen(resultat));
        }
      }
    } else {
      if (_eingabe.length < 5) {
        setState(() {
          _eingabe = '$_eingabe$key';
        });
      }
    }
    // log('Eingabe danach: $_eingabe');
  }
}
