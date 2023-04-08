import 'dart:math';

import 'package:flutter/material.dart';

class CalculatorWidget extends StatelessWidget {
  CalculatorWidget({Key? key}) : super(key: key);

  /// controllers for the text fields.
  final TextEditingController principalController = TextEditingController();
  final TextEditingController tenureController = TextEditingController();
  final TextEditingController roiController = TextEditingController();

  /// value notifier for the interest.
  final interest = ValueNotifier<double>(0.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CI Calculator'),
        elevation: 2,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Enter your details below',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'to calculate your interest',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 18,
            ),
            SizedBox(
              width: 300,
              child: TextFormField(
                controller: principalController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Principal',
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            SizedBox(
              width: 300,
              child: TextFormField(
                controller: tenureController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Tenure in years',
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            SizedBox(
              width: 300,
              child: TextFormField(
                controller: roiController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Rate of Interest',
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  EdgeInsets.fromLTRB(
                    64,
                    20,
                    64,
                    20,
                  ),
                ),
              ),
              onPressed: () {
                /// get the values from the text fields.
                String principal = principalController.value.text;
                String tenure = tenureController.value.text;
                String roi = roiController.value.text;

                // Perform input validation.
                if (principal.isEmpty || tenure.isEmpty || roi.isEmpty) {
                  /// show a snackbar with an error message.
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Input values cannot be empty"),
                    ),
                  );
                  return;
                }

                /// convert the values to double.
                double? principalValue = double.tryParse(principal);
                double? tenureValue = double.tryParse(tenure);
                double? roiValue = double.tryParse(roi);

                // check if input values contain only numbers.
                if (principalValue == null ||
                    tenureValue == null ||
                    roiValue == null) {
                  /// show a snackbar with an error message.
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Input values must be numbers"),
                    ),
                  );
                  return;
                }

                /// calculate the interest.
                double amount =
                    principalValue * pow((1 + (roiValue / 100)), tenureValue);
                double interestValue = amount - principalValue;

                /// update the interest value.
                interest.value = interestValue;
              },
              child: Text('Calculate'),
            ),
            SizedBox(
              height: 32,
            ),
            ValueListenableBuilder(
              valueListenable: interest,
              builder: (context, value, widget) {
                return Text(
                  'Interest: \$${interest.value.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 20),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
