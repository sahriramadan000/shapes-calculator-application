import 'package:flutter/material.dart';

class RectanglePage extends StatefulWidget {
  @override
  _RectanglePageState createState() => _RectanglePageState();
}

class _RectanglePageState extends State<RectanglePage> {
  final _formKey = GlobalKey<FormState>();
  double _length = 0;
  double _width = 0;
  double _area = 0;
  double _perimeter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rectangle'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: Image.asset('assets/rectangle.png', width: 100, height: 100,),
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
                      labelText: 'Length',
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a length';
                      }
                      return null;
                    },
                    onSaved: (value) {setState(() {
                        _length = double.parse(value!);
                      });
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Width',
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a width';
                      }
                      return null;
                    },
                    onSaved: (value) {setState(() {
                        _width = double.parse(value!);
                      });
                    },
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Area: ${_area.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Perimeter: ${_perimeter.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        setState(() {
                          _area = _length * _width;
                          _perimeter = 2 * (_length + _width);
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
      ),
    );
  }
}