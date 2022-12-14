import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResultBMI extends StatefulWidget {
  final String description;
  final int resultBmi;
  final String image;

  ResultBMI(
      {required this.description,
      required this.resultBmi,
      required this.image});

  @override
  State<ResultBMI> createState() => _ResultBMIState();
}

class _ResultBMIState extends State<ResultBMI> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 200,
            width: 200,
            child: SvgPicture.asset(widget.image),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "Your BMI score is ${widget.resultBmi}",
            style: const TextStyle(
                color: Color(0xFFd81b60),
                fontSize: 34,
                fontWeight: FontWeight.w700),
          ),
          Text(
            widget.description,
            style: const TextStyle(
                color: Color(0xFFd81b60),
                fontSize: 34,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
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
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_rounded),
              label: const Text("Recalculate BMI"),
              style: TextButton.styleFrom(primary: const Color(0xFFd81b60)),
            ),
          )
        ],
      ),
    ));
  }
}
