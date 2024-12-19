
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  _CalculatorState createState() => _CalculatorState();  // Fixed the syntax here
}

class _CalculatorState extends State<Calculator> {
  String userInput = '';  // store the user input as a string
  String result = '0'; // store the calculated result

// funtion of the button
  Widget calcbutton(String btntxt, Color btncolor, Color txtcolor) {
    return Container(
      width: 80,
      height: 80,
      child: ElevatedButton(
        onPressed: () {
          //Call the onbuttonPressed funtion with the button's text
          onButtonPressed(btntxt);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: btncolor,
          shape: CircleBorder(),
          padding: EdgeInsets.all(20),
        ),
        child: Text(
          btntxt,
          style: TextStyle(
            fontSize: 30,
            color: txtcolor,
          ),
        ),
      ),
    );
  }

  // Handles the logic for button presses
  void onButtonPressed(String btntxt) {
    setState(() {
      if (btntxt == 'AC') {
        // Clear the input and reset the result
        userInput = '';
        result = '0';
      } else if (btntxt == '=') {
        // Evaluate the expression and display the result
        calculateResult();
      } else if (btntxt == '+/-') {
        // Toggle between positive and negative numbers
        if (userInput.isNotEmpty) {
          if (userInput.startsWith('-')) {
            userInput = userInput.substring(1); // Remove the negative sign
          } else {
            userInput = '-$userInput'; // Add a negative sign
          }
        }
      } else {
        // Append the pressed button's text to the input
        userInput += btntxt;
      }
    });
  }

  // funtion of the mathematical expression
  void calculateResult (){
    try{
      // Use the math_expressions package for safe evaluation
      Parser parser = Parser();

      // Replace 'X' with '*' and '÷' with '/' for proper calculation
      Expression exp = parser.parse(userInput.replaceAll('X', '*').replaceAll('÷', '/'));
      ContextModel cm = ContextModel();

      // Evaluate the expression
      double eval = exp.evaluate(EvaluationType.REAL, cm);

      // Convert the result to a string and remove trailing '.00' if present
      result = eval.toStringAsFixed(2).replaceAll(RegExp(r'\.00$'), '');
    } catch (e) {
      // If there's an error in evaluation, show "Error"
      result = 'Error';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Calculator'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Display the user input at the top
            Container(
              alignment: Alignment.centerRight,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,  // Changed to horizontal for better number display
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    userInput,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 40,
                    ),
                  ),
                ),
              ),
            ),
            // Display the result
            Container(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  result, // Display the result of the calculation
                  style: TextStyle(
                    color: Colors.white, // Result text color
                    fontSize: 80, // Font size for result
                    fontWeight: FontWeight.bold, // Bold result text
                  ),
                ),
              ),
            ),
            SizedBox(height: 20), // Add space between the display and buttons
            // Button rows
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcbutton('AC', Colors.grey, Colors.black),
                calcbutton('+/-', Colors.grey, Colors.black),
                calcbutton('%', Colors.grey, Colors.black),
                calcbutton('÷', Colors.amber[700]!, Colors.white),
              ],
            ),
            SizedBox(height: 10),  // Added spacing at the bottom

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcbutton('7', Colors.grey[850]!, Colors.white),
                calcbutton('8', Colors.grey[850]!, Colors.white),
                calcbutton('9', Colors.grey[850]!, Colors.white),
                calcbutton('x', Colors.amber[700]!, Colors.white),

              ],
            ),
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcbutton('4', Colors.grey[850]!, Colors.white),
                calcbutton('5', Colors.grey[850]!, Colors.white),
                calcbutton('6', Colors.grey[850]!, Colors.white),
                calcbutton('-', Colors.amber[700]!, Colors.white),

              ],
            ),
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcbutton('1', Colors.grey[850]!, Colors.white),
                calcbutton('2', Colors.grey[850]!, Colors.white),
                calcbutton('3', Colors.grey[850]!, Colors.white),
                calcbutton('+', Colors.amber[700]!, Colors.white),

              ],
            ),
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Design the '0' button
                ElevatedButton(
                  onPressed: () {
                    // button function
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(34, 20, 128, 20),
                    shape: const StadiumBorder(),
                    backgroundColor: Colors.grey[850], // Button background color
                  ),
                  child: const Text("0",
                    style: TextStyle(fontSize: 35, color: Colors.white, // Text color
                    ),
                  ),
                ),
                calcbutton('.', Colors.grey[850]!, Colors.white),
                calcbutton('=' , Colors.amber[700]!, Colors.white),

              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
  //calculator logic

}