import 'package:flutter/material.dart';

class SquarePage extends StatefulWidget {
  @override
  _SquarePageState createState() => _SquarePageState();
}

class _SquarePageState extends State<SquarePage> {
  final _formKey = GlobalKey<FormState>();
  double _sideLength = 0;
  double _area = 0;
  double _perimeter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Square'),
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
                      labelText: 'Side Length',
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a side length';
                      }
                      return null;
                    },
                    onSaved: (value) {setState(() {
                        _sideLength = double.parse(value!);
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
                          _area = _sideLength * _sideLength;
                          _perimeter = 4 * _sideLength;
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