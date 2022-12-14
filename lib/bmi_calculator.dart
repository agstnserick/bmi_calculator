import 'package:bootcamp_flutter/result_bmi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BMICalculator extends StatefulWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  double _height = 100.0;
  double _weight = 100.0;
  double _calculatedBmi = 0;
  String description = "";
  String image = "";
  Color accentColor = const Color(0xFFd81b60);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFFd81b60),
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    child: SvgPicture.asset("assets/whitepinkheart.svg"),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              const Text(
                "BMI Calculator",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.w800),
              )
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.8),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 25),
                const Text(
                  "How tall you are ?",
                  style: TextStyle(
                      color: Colors.black45,
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  child: Slider(
                    min: 60.0,
                    max: 250.0,
                    onChanged: (height) {
                      setState(() {
                        _height = height;
                      });
                    },
                    value: _height,
                    divisions: 380,
                    activeColor: accentColor,
                    label: "$_height CM",
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "$_height CM",
                  style: const TextStyle(
                      color: Color(0xFFd81b60),
                      fontSize: 35,
                      fontWeight: FontWeight.w900),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  "How much you weigh ?",
                  style: TextStyle(
                      color: Colors.black45,
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  child: Slider(
                    min: 30.0,
                    max: 250.0,
                    onChanged: (weight) {
                      setState(() {
                        _weight = weight;
                      });
                    },
                    value: _weight,
                    divisions: 440,
                    activeColor: accentColor,
                    label: "$_weight KG",
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "$_weight KG",
                  style: const TextStyle(
                      color: Color(0xFFd81b60),
                      fontSize: 35,
                      fontWeight: FontWeight.w900),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width / 1.3,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        border: Border(
                            top: BorderSide(color: Color(0xFFd81b60)),
                            bottom: BorderSide(color: Color(0xFFd81b60)),
                            left: BorderSide(color: Color(0xFFd81b60)),
                            right: BorderSide(color: Color(0xFFd81b60))),
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        )),
                    child: TextButton.icon(
                        onPressed: () {
                          setState(() {
                            _calculatedBmi =
                                _weight / ((_height / 100) * (_height / 100));
                            if (_calculatedBmi < 18.5) {
                              description = "You are Underweight";
                              image = "assets/underweight_body.svg";
                            } else if (_calculatedBmi > 18.5 &&
                                _calculatedBmi < 24.9) {
                              description = "You are Fit !";
                              image = "assets/gym_body.svg";
                            } else if (_calculatedBmi > 25 &&
                                _calculatedBmi < 29.9) {
                              description = "You are Overweight";
                              image = "assets/overweight_body.svg";
                            } else if (_calculatedBmi > 30) {
                              description = "You are Obese";
                              image = "assets/overweight_body.svg";
                            }
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ResultBMI(
                                      description: description,
                                      image: image,
                                      resultBmi: _calculatedBmi.toInt())));
                        },
                        icon: const Icon(
                          Icons.calculate,
                          color: Color(0xFFd81b60),
                        ),
                        label: const Text(
                          "Calculate",
                          style:
                              TextStyle(color: Color(0xFFd81b60), fontSize: 25),
                        )),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
