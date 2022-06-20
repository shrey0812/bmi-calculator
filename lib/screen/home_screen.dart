import 'package:bmi_calculator/widgets/left_bar.dart';
import 'package:bmi_calculator/widgets/right_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("BMI CALCULATOR"),
          titleTextStyle: const TextStyle(
              color: Color.fromARGB(255, 193, 191, 39),
              fontWeight: FontWeight.w300),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: const Color.fromARGB(255, 29, 29, 26),
        body: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 130,
                  child: TextField(
                    controller: _heightController,
                    style: const TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Color.fromARGB(255, 193, 191, 39)),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Height',
                        hintStyle: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w300,
                          color: Colors.white.withOpacity(.8),
                        )),
                  ),
                ),
                SizedBox(
                  width: 130,
                  child: TextField(
                    controller: _weightController,
                    style: const TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Color.fromARGB(255, 193, 191, 39)),
                    keyboardType: const TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Weight',
                        hintStyle: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w300,
                          color: Colors.white.withOpacity(.8),
                        )),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Calculated')));

                  double h = double.parse(_heightController.text);
                  double w = double.parse(_weightController.text);
                  setState(() {
                    _bmiResult = w / (h * h);
                    if (_bmiResult > 25) {
                      _textResult = "You are overweight";
                    } else if (_bmiResult < 25 && _bmiResult > 18.5) {
                      _textResult = "You have normal weight";
                    } else {
                      _textResult = "You are under weight";
                    }
                  });
                },
                child: const Text("Calculate",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 193, 191, 39)))),
            const SizedBox(
              height: 50,
            ),
            Container(
                child: Text(_bmiResult.toStringAsFixed(2),
                    style: const TextStyle(
                        fontSize: 90,
                        color: Color.fromARGB(255, 193, 191, 39)))),
            const SizedBox(
              height: 30,
            ),
            Visibility(
              visible: _textResult.isNotEmpty,
              child: Container(
                  child: Text(_textResult,
                      style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 193, 191, 39)))),
            ),
            const SizedBox(
              height: 30,
            ),
            const LeftBar(
              barWidth: 40,
            ),
            const SizedBox(
              height: 20,
            ),
            const LeftBar(
              barWidth: 70,
            ),
            const SizedBox(
              height: 20,
            ),
            const LeftBar(
              barWidth: 40,
            ),
            const SizedBox(
              height: 30,
            ),
            const RightBar(
              barWidth: 40,
            ),
            const SizedBox(
              height: 20,
            ),
            const RightBar(
              barWidth: 70,
            ),
            const SizedBox(
              height: 20,
            ),
            const RightBar(
              barWidth: 40,
            ),
          ]),
        ));
  }
}
