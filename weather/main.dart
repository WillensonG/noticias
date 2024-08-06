import 'package:flutter/material.dart';
//import 'weather_model.dart';
import 'weather_screen.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WeatherScreen(),
      theme: ThemeData.dark(),
    );
  }
}
