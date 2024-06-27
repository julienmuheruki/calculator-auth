import 'package:flutter/material.dart';

void main() => runApp(CalculatorApp());

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculator(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
      ),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _output = "0";
  String _currentInput = "";
  String _operator = "";
  double _num1 = 0;
  double _num2 = 0;

  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        _output = "0";
        _currentInput = "";
        _operator = "";
        _num1 = 0;
        _num2 = 0;
      } else if (buttonText == "+" ||
          buttonText == "-" ||
          buttonText == "×" ||
          buttonText == "÷") {
        _num1 = double.parse(_output);
        _operator = buttonText;
        _currentInput = "";
      } else if (buttonText == "=") {
        _num2 = double.parse(_output);
        switch (_operator) {
          case "+":
            _output = (_num1 + _num2).toString();
            break;
          case "-":
            _output = (_num1 - _num2).toString();
            break;
          case "×":
            _output = (_num1 * _num2).toString();
            break;
          case "÷":
            _output = (_num1 / _num2).toString();
            break;
        }
        _operator = "";
        _currentInput = "";
      } else {
        _currentInput += buttonText;
        _output = _currentInput;
      }
    });
  }

  Widget _buildButton(String buttonText,
      {Color textColor = Colors.white, Color backgroundColor = Colors.grey}) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(4.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(20.0),
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          onPressed: () => _buttonPressed(buttonText),
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 28, color: textColor),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
            child: Text(
              _output,
              style: TextStyle(fontSize: 48, color: Colors.white),
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          Column(
            children: [
              Row(
                children: <Widget>[
                  _buildButton("7"),
                  _buildButton("8"),
                  _buildButton("9"),
                  _buildButton("÷",
                      textColor: Colors.white, backgroundColor: Colors.orange),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton("4"),
                  _buildButton("5"),
                  _buildButton("6"),
                  _buildButton("×",
                      textColor: Colors.white, backgroundColor: Colors.orange),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton("1"),
                  _buildButton("2"),
                  _buildButton("3"),
                  _buildButton("-",
                      textColor: Colors.white, backgroundColor: Colors.orange),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton("."),
                  _buildButton("0"),
                  _buildButton("00"),
                  _buildButton("+",
                      textColor: Colors.white, backgroundColor: Colors.orange),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton("C",
                      textColor: Colors.white, backgroundColor: Colors.red),
                  _buildButton("=",
                      textColor: Colors.white, backgroundColor: Colors.green),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
