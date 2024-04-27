import 'package:flutter/material.dart';

class RectanglePage extends StatefulWidget {
  @override
  _RectanglePageState createState() => _RectanglePageState();
}

class _RectanglePageState extends State<RectanglePage> {
  final GlobalKey<FormState> _areaFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _perimeterFormKey = GlobalKey<FormState>();

  double _length = 0;
  double _width = 0;
  double _area = 0;
  double _perimeter = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Rectangle'),
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
                      'assets/rectangle_area.png',
                      width: 150,
                      height: 130,
                    ), // Add image here
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Length',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a length';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          _length = double.parse(value!);
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Width',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a width';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          _width = double.parse(value!);
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
                                _area = _length * _width;
                              });
                            }
                          },
                          child: const Text('Calculate'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _areaFormKey.currentState!.reset();
                            setState(() {
                              _length = 0;
                              _width = 0;
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
                      'assets/rectangle_perimeter.png',
                      width: 150,
                      height: 130,
                    ), // Add image here
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Length',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a length';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          _length = double.parse(value!);
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Width',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a width';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          _width = double.parse(value!);
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
                                _perimeter = 2 * (_length + _width);
                              });
                            }
                          },
                          child: const Text('Calculate'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _perimeterFormKey.currentState!.reset();
                            setState(() {
                              _length = 0;
                              _width = 0;
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