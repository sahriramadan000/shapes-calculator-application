import 'package:flutter/material.dart';
import 'package:shapes_calculator_application/pages/rectangle_page.dart';
import 'package:shapes_calculator_application/pages/circle_page.dart';
import 'package:shapes_calculator_application/pages/square_page.dart';
import 'package:shapes_calculator_application/pages/triangle_page.dart';
import 'package:shapes_calculator_application/pages/kite_page.dart';
import 'package:shapes_calculator_application/pages/parallelogram_page.dart';
import 'package:shapes_calculator_application/pages/rhombus_page.dart';
import 'package:shapes_calculator_application/pages/trapezium_page.dart';

class Shape {
  final String name;
  final String imagePath;
  final Widget page;

  Shape({required this.name, required this.imagePath, required this.page});
}

final List<Shape> shapes = [
  Shape(
    name: 'Square',
    imagePath: 'assets/geometry/square.png',
    page: SquarePage(),
  ),
  Shape(
    name: 'Rectangle',
    imagePath: 'assets/geometry/rectangle.png',
    page: RectanglePage(),
  ),
  Shape(
    name: 'Triangle',
    imagePath: 'assets/geometry/triangle.png',
    page: TrianglePage(),
  ),
  Shape(
    name: 'Circle',
    imagePath: 'assets/geometry/circle.png',
    page: CirclePage(),
  ),
  Shape(
    name: 'Kite',
    imagePath: 'assets/geometry/kite.png',
    page: KitePage(),
  ),
  Shape(
    name: 'Rhombus',
    imagePath: 'assets/geometry/rhombus.png',
    page: RhombusPage(),
  ),
  Shape(
    name: 'Parallelogram',
    imagePath: 'assets/geometry/Parallelogram.png',
    page: ParallelogramPage(),
  ),
  Shape(
    name: 'Trapezium',
    imagePath: 'assets/geometry/trapezium.png',
    page: TrapeziumPage(),
  ),
];