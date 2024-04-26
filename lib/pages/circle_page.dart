import 'package:flutter/material.dart';
import 'dart:math';

class CirclePage extends StatefulWidget {
  @override
  _CirclePageState createState()=> _CirclePageState();
}

class _CirclePageState extends State<CirclePage> {
  final _formKey = GlobalKey<FormState>();
  double _radius = 0;
  double _area = 0;
  double _circumference = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Circle'),
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
                      labelText: 'Radius',
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a radius';
                      }
                      return null;
                    },
                    onSaved: (value) {setState(() {
                        _radius = double.parse(value!);
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
                    'Circumference: ${_circumference.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        setState(() {
                          _area = pi * pow(_radius, 2);
                          _circumference = 2 * pi * _radius;
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