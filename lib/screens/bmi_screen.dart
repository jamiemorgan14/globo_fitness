import 'package:flutter/material.dart';
import 'package:globo_fitness/shared/menu_bottom.dart';
import 'package:globo_fitness/shared/menu_drawer.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  final TextEditingController txtHeight = TextEditingController();
  final TextEditingController txtWeight = TextEditingController();
  final double fontSize = 18;
  String result = '';
  bool isMetric = false;
  bool isImperial = true;
  double? height;
  double? weight;
  late List<bool> isSelected;
  String heightMessage = '';
  String weightMessage = '';

  @override
  void initState() {
    isSelected = [isImperial, isMetric];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    heightMessage =
        'Please insert your height in ${isMetric ? "meters" : "inches"}';
    weightMessage =
        'Please insert your weight in ${isMetric ? "kilos" : "pounds"}';
    return Scaffold(
      bottomNavigationBar: MenuBottom(),
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ToggleButtons(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Imperial',
                    style: TextStyle(fontSize: fontSize),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Metric',
                    style: TextStyle(fontSize: fontSize),
                  ),
                ),
              ],
              isSelected: isSelected,
              onPressed: toggleMeasure,
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: TextField(
                controller: txtHeight,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(hintText: heightMessage),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: TextField(
                controller: txtWeight,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  hintText: weightMessage,
                ),
              ),
            ),
            ElevatedButton(
              child: Text(
                'Calculate BMI',
                style: TextStyle(fontSize: fontSize),
              ),
              onPressed: findBMI,
            ),
            Text(
              result,
              style: TextStyle(fontSize: fontSize),
            )
          ],
        ),
      ),
      drawer: MenuDrawer(),
    );
  }

  void toggleMeasure(value) {
    if (value == 0) {
      isImperial = true;
      isMetric = false;
    } else {
      isImperial = false;
      isMetric = true;
    }
    setState(() {
      isSelected = [isImperial, isMetric];
    });
  }

  void findBMI() {
    double bmi = 0;
    double height = double.tryParse(txtHeight.text) ?? 0;
    double weight = double.tryParse(txtWeight.text) ?? 0;
    if (isImperial) {
      bmi = calculateImperial(height, weight);
    } else {
      bmi = calculateMetric(height, weight);
    }
    setState(() {
      result = 'Your BMI is ${bmi.toStringAsFixed(2)}';
    });
  }

  double calculateImperial(double height, double weight) {
    return weight * 703 / (height * height);
  }

  double calculateMetric(double height, double weight) {
    return weight / (height * height);
  }
}
