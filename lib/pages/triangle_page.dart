import 'package:flutter/material.dart';

class TrianglePage extends StatefulWidget {
  @override
  _TrianglePageState createState() => _TrianglePageState();
}

class _TrianglePageState extends State<TrianglePage> {
  final GlobalKey<FormState> _areaFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _perimeterFormKey = GlobalKey<FormState>();

  double _base = 0;
  double _height = 0;
  double _side = 0;
  double _area = 0;
  double _perimeter = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Triangle'),
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
                      'assets/triangle_area.png',
                      width: 150,
                      height: 130,
                    ), // Add image here
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Base',
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
                          _base = double.parse(value!);
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: const InputDecoration(
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
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (_areaFormKey.currentState!.validate()) {
                              _areaFormKey.currentState!.save();
                              setState(() {
                                _area = 0.5 * _base * _height;
                              });
                            }
                          },
                          child: const Text('Calculate'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _areaFormKey.currentState!.reset();
                            setState(() {
                              _base = 0;
                              _height = 0;
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
                      'assets/triangle_equilateral_perimeter.png',
                      width: 150,
                      height: 130,
                    ), // Add image here
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Side',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a side';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          _side = double.parse(value ?? '0');
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
                                _perimeter = _side * 3;
                              });
                            }
                          },
                          child: const Text('Calculate'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _perimeterFormKey.currentState!.reset();
                            setState(() {
                              _side = 0;
                              _perimeter = 0;
                            });
                          },
                          child: Text('Clear'),
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