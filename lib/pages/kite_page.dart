import 'package:flutter/material.dart';

class KitePage extends StatefulWidget {
  @override
  _KitePageState createState() => _KitePageState();
}

class _KitePageState extends State<KitePage> {
  final GlobalKey<FormState> _areaFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _perimeterFormKey = GlobalKey<FormState>();

  double _diagonal1 = 0;
  double _diagonal2 = 0;
  double _side1 = 0;
  double _side2 = 0;
  double _area = 0;
  double _perimeter = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Kite'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Area'),
              Tab(text: 'Perimeter'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Form(
              key: _areaFormKey,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/kite_area.png',
                      width: 130,
                      height: 130,
                    ), // Add image here
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Diagonal 1',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a diagonal 1';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          _diagonal1 = double.parse(value!);
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Diagonal 2',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a diagonal 2';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          _diagonal2 = double.parse(value!);
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (_areaFormKey.currentState!.validate()) {
                              _areaFormKey.currentState!.save();
                              setState(() {
                                _area = 0.5 * _diagonal1 * _diagonal2;
                              });
                            }
                          },
                          child: const Text('Calculate'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _areaFormKey.currentState!.reset();
                            setState(() {
                              _diagonal1 = 0;
                              _diagonal2 = 0;
                              _area = 0;
                            });
                          },
                          child: const Text('Clear'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Area: ${_area.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            Form(
              key: _perimeterFormKey,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/kite_perimeter.png',
                      width: 130,
                      height: 130,
                    ), // Add image here
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Side 1',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a side 1';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          _side1 = double.parse(value!);
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Side 2',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a side 2';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          _side2 = double.parse(value!);
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (_perimeterFormKey.currentState!.validate()) {
                              _perimeterFormKey.currentState!.save();
                              setState(() {
                                _perimeter = 2 * (_side1 + _side2);
                              });
                            }
                          },
                          child: const Text('Calculate'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _perimeterFormKey.currentState!.reset();
                            setState(() {
                              _side1 = 0;
                              _side2 = 0;
                              _perimeter = 0;
                            });
                          },
                          child: const Text('Clear'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Perimeter: ${_perimeter.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}