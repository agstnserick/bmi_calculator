import 'package:bootcamp_flutter/bmi_calculator.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Height and Weight Measurement',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BMICalculator(),
    );
  }
}
