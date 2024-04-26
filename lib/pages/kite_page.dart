import 'package:flutter/material.dart';

class KitePage extends StatefulWidget {
  @override
  _KitePageState createState() => _KitePageState();
}

class _KitePageState extends State<KitePage> {
  final _formKey = GlobalKey<FormState>();
  double _diagonal1 = 0;
  double _diagonal2 = 0;
  double _area = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kite'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: Image.asset('assets/circle-shapes.png', width: 100, height: 100,),
          ),
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Diagonal 1',
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a diagonal';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        _diagonal1 = double.parse(value!);
                      });
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Diagonal 2',
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a diagonal';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                      _diagonal2 = double.parse(value!);
                      });
                    },
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Area: ${_area.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        setState(() {
                          _area = 0.5 * _diagonal1 * _diagonal2;
                        });
                      }
                    },
                    child: Text('Calculate'),
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}
