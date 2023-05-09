import 'package:flutter/material.dart';

enum Gender { male, female }

class BmiCalculatorPage extends StatefulWidget {
  static String routeName = "/bmiCalculatorPage";

  const BmiCalculatorPage({Key? key}) : super(key: key);

  @override
  State<BmiCalculatorPage> createState() => _BmiCalculatorPageState();
}

class _BmiCalculatorPageState extends State<BmiCalculatorPage> {
  double _weight = 50;
  TextEditingController heightController = TextEditingController();

  Gender gender = Gender.male;

  String message = "";
  double bmiValue = 0;

  calculateBMI() {
    double height = double.parse(heightController.text);
    if (gender == Gender.male) {
      bmiValue = _weight / (height * height) * 10000;
    } else {
      bmiValue = _weight / (height * height) * 10000 * 0.9;
    }

    if (bmiValue < 18.5) {
      message = 'You are underweight';
    } else if (bmiValue >= 18.5 && bmiValue < 25) {
      message = 'You have a normal weight';
    } else if (bmiValue >= 25 && bmiValue < 30) {
      message = 'You are overweight';
    } else {
      message = 'You are obese';
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI Calculator',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 0,
                child: SizedBox(
                  height: 110,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      "Your BMI ${bmiValue.toStringAsFixed(2)},\n $message",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                elevation: 15,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 120,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Weight(kg)",
                      ),
                      Text(
                        "${_weight.toStringAsFixed(2)} kg",
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      Slider(
                        max: 150,
                        min: 10,
                        value: _weight,
                        onChanged: (value) {
                          _weight = value;
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                elevation: 15,
                child: TextField(
                  controller: heightController,
                  decoration: const InputDecoration(
                    labelText: 'Height (cm)',
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      gender = Gender.male;
                      setState(() {});
                    },
                    child: Card(
                      elevation: 15,
                      color: gender == Gender.male
                          ? Colors.blue[200]
                          : Colors.white,
                      child: SizedBox(
                        height: 150,
                        width: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Male",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Icon(
                              Icons.check_circle,
                              color: gender == Gender.male
                                  ? Colors.green
                                  : Colors.grey,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      gender = Gender.female;
                      setState(() {});
                    },
                    child: Card(
                      elevation: 15,
                      color: gender == Gender.female
                          ? Colors.pink[200]
                          : Colors.white,
                      child: SizedBox(
                        height: 150,
                        width: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Female",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Icon(
                              Icons.check_circle,
                              color: gender == Gender.female
                                  ? Colors.green
                                  : Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                height: 60,
                minWidth: double.infinity,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
                onPressed: () {
                  calculateBMI();
                },
                color: const Color(0xFF311B92),
                child: const Text(
                  "Calculate",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
