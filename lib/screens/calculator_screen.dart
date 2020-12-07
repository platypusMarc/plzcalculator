import 'dart:developer';

import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
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

  void pressButton(String key) {
    if (key == 'DEL') {
      if (_eingabe.length > 0) {
        setState(() {
          _eingabe = _eingabe.substring(0, _eingabe.length - 1);
        });
      }
    } else if (key == 'OK') {
      // TODO: Ok fehlt
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
