import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/results_page.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon.dart';

const bottombarheight = 80.0;
const mainpagecolor = Color(0xFF1D1E33);
const activecolor = Color(0xFF1D1E33);
const inactivecolor = Color(0xFF111328);

void main() => runApp(BmiCalculator());

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({Key? key}) : super(key: key);

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

enum card {
  male,
  female,
  nothing,
}

class _BmiCalculatorState extends State<BmiCalculator> {
  card selectedgender = card.nothing;

  int height = 180;
  int weight = 60;
  int age = 30;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            backgroundColor: mainpagecolor,
            title: const Text(
              "BMI  Calculator",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 3,
              ),
            ),
            centerTitle: true,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedgender = card.male;
                          });
                        },
                        child: ReusableWidget(
                          colour: selectedgender == card.male
                              ? activecolor
                              : inactivecolor,
                          cardchild: topicon(
                            test: "MALE",
                            icon: FontAwesomeIcons.mars,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedgender = card.female;
                          });
                        },
                        child: ReusableWidget(
                          colour: selectedgender == card.female
                              ? activecolor
                              : inactivecolor,
                          cardchild: topicon(
                            test: "FEMALE",
                            icon: FontAwesomeIcons.venus,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ReusableWidget(
                  colour: mainpagecolor,
                  cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "HEIGHT",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF8D8E98),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toString(),
                            style: TextStyle(
                              fontSize: 50.0,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            "cm",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF8D8E98),
                            ),
                          ),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 16),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30),
                          activeTrackColor: Color(0xFFEB1555),
                          inactiveTrackColor: Color(0xFF8D8E98),
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0x29EB1555),
                        ),
                        child: Slider(
                            value: height.toDouble(),
                            min: 120.0,
                            max: 220.0,
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            }),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ReusableWidget(
                        colour: mainpagecolor,
                        cardchild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "WEIGHT",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF8D8E98),
                              ),
                            ),
                            Text(
                              weight.toString(),
                              style: TextStyle(
                                fontSize: 50.0,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Roundbutton(
                                  icon: FontAwesomeIcons.minus,
                                  onpress: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Roundbutton(
                                  icon: FontAwesomeIcons.plus,
                                  onpress: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: ReusableWidget(
                              colour: const Color(0xFF1D1E33),
                              cardchild: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "AGE",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xFF8D8E98),
                                    ),
                                  ),
                                  Text(
                                    age.toString(),
                                    style: TextStyle(
                                      fontSize: 50.0,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Roundbutton(
                                        icon: FontAwesomeIcons.minus,
                                        onpress: () {
                                          setState(() {
                                            age--;
                                          });
                                        },
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Roundbutton(
                                        icon: FontAwesomeIcons.plus,
                                        onpress: () {
                                          setState(() {
                                            age++;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              BottomButton(
                  Textt: "Calculate",
                  onTap: () {
                    Calculator calc =
                        Calculator(height: height, weight: weight);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultsPage(
                          bmiResult: calc.calculateBMI(),
                          resulttText: calc.gett(),
                          interpretation: calc.interpretation(),
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class Roundbutton extends StatelessWidget {
  const Roundbutton({Key? key, required this.icon, required this.onpress})
      : super(key: key);
  final IconData icon;
  final Function onpress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        onpress();
      },
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      child: Icon(icon),
    );
  }
}
