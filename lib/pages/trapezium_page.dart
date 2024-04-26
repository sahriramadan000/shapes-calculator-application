import 'package:flutter/material.dart';

class TrapeziumPage extends StatefulWidget {
  @override
  _TrapeziumPageState createState() => _TrapeziumPageState();
}

class _TrapeziumPageState extends State<TrapeziumPage> {
  final _formKey = GlobalKey<FormState>();
  double _base1 = 0;
  double _base2 = 0;
  double _height = 0;
  double _area = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trapezium'),
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
                      labelText: 'Base 1',
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a base';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        _base1 = double.parse(value!);
                      });
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Base 2',
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a base';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        _base2 = double.parse(value!);
                      });
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Height',
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a height';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        _height = double.parse(value!);
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
                          _area = 0.5 * _height * (_base1 + _base2);
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