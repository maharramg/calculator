import 'dart:math';

import 'package:calculator/button_item.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String? input = '';
  String? output = '';
  String? newOutput = '';

  String? inputText = '';
  String? outputText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.topRight,
            padding: const EdgeInsets.only(top: 100, right: 12),
            color: Colors.grey[900],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  inputText!,
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                Text(
                  outputText!,
                  style: const TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width,
            color: Colors.deepPurple,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      ButtonItem(
                        onTap: () => onButtonClicked('C'),
                        buttonText: 'C',
                        textColor: Colors.red,
                      ),
                      ButtonItem(
                        onTap: () => onButtonClicked('^'),
                        buttonText: '^',
                        textColor: Colors.orange,
                      ),
                      ButtonItem(
                        onTap: () => onButtonClicked('%'),
                        buttonText: '%',
                        textColor: Colors.orange,
                      ),
                      ButtonItem(
                        onTap: () => onButtonClicked('/'),
                        buttonText: '/',
                        textColor: Colors.orange,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      ButtonItem(
                        onTap: () => onButtonClicked('7'),
                        buttonText: '7',
                        textColor: Colors.white,
                      ),
                      ButtonItem(
                        onTap: () => onButtonClicked('8'),
                        buttonText: '8',
                        textColor: Colors.white,
                      ),
                      ButtonItem(
                        onTap: () => onButtonClicked('9'),
                        buttonText: '9',
                        textColor: Colors.white,
                      ),
                      ButtonItem(
                        onTap: () => onButtonClicked('*'),
                        buttonText: '*',
                        textColor: Colors.orange,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      ButtonItem(
                        onTap: () => onButtonClicked('4'),
                        buttonText: '4',
                        textColor: Colors.white,
                      ),
                      ButtonItem(
                        onTap: () => onButtonClicked('5'),
                        buttonText: '5',
                        textColor: Colors.white,
                      ),
                      ButtonItem(
                        onTap: () => onButtonClicked('6'),
                        buttonText: '6',
                        textColor: Colors.white,
                      ),
                      ButtonItem(
                        onTap: () => onButtonClicked('-'),
                        buttonText: '-',
                        textColor: Colors.orange,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      ButtonItem(
                        onTap: () => onButtonClicked('1'),
                        buttonText: '1',
                        textColor: Colors.white,
                      ),
                      ButtonItem(
                        onTap: () => onButtonClicked('2'),
                        buttonText: '2',
                        textColor: Colors.white,
                      ),
                      ButtonItem(
                        onTap: () => onButtonClicked('3'),
                        buttonText: '3',
                        textColor: Colors.white,
                      ),
                      ButtonItem(
                        onTap: () => onButtonClicked('+'),
                        buttonText: '+',
                        textColor: Colors.orange,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ButtonItem(
                            onTap: () => onButtonClicked('0'),
                            buttonText: '0',
                            textColor: Colors.white,
                          ),
                          ButtonItem(
                            onTap: () => onButtonClicked('.'),
                            buttonText: '.',
                            textColor: Colors.white,
                          ),
                        ],
                      ),
                      ButtonItem(
                        onTap: () => onButtonClicked('='),
                        buttonText: '=',
                        textColor: Colors.orange,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void solve() {
    if (input?.split('+').length == 2) {
      List<String>? numbers = input?.split('+');
      try {
        double d = double.parse(numbers![0]) + double.parse(numbers[1]);
        RegExp regex = RegExp(r'([.]*0)(?!.*\d)');

        setState(() {
          input = d.toString().replaceAll(regex, '');
          output = d.toString().replaceAll(regex, '');
          newOutput = cutDecimal(output!);
          outputText = newOutput!;
        });
      } catch (e) {
        setState(() {
          outputText = e.toString();
        });
      }
    }
    if (input?.split('*').length == 2) {
      List<String>? numbers = input?.split('*');
      try {
        double d = double.parse(numbers![0]) * double.parse(numbers[1]);
        RegExp regex = RegExp(r'([.]*0)(?!.*\d)');

        setState(() {
          input = d.toString().replaceAll(regex, '');
          output = d.toString().replaceAll(regex, '');
          newOutput = cutDecimal(output!);
          outputText = newOutput!;
        });
      } catch (e) {
        setState(() {
          outputText = e.toString();
        });
      }
    }
    if (input?.split('/').length == 2) {
      List<String>? numbers = input?.split('/');
      try {
        double d = double.parse(numbers![0]) / double.parse(numbers[1]);
        RegExp regex = RegExp(r'([.]*0)(?!.*\d)');

        setState(() {
          input = d.toString().replaceAll(regex, '');
          output = d.toString().replaceAll(regex, '');
          newOutput = cutDecimal(output!);
          outputText = newOutput!;
        });
      } catch (e) {
        setState(() {
          outputText = e.toString();
        });
      }
    }
    if (input?.split('^').length == 2) {
      List<String>? numbers = input?.split('^');
      try {
        num d = pow(num.parse(numbers![0]), num.parse(numbers[1]));
        RegExp regex = RegExp(r'([.]*0)(?!.*\d)');

        setState(() {
          input = d.toString().replaceAll(regex, '');
          output = d.toString().replaceAll(regex, '');
          newOutput = cutDecimal(output!);
          outputText = newOutput!;
        });
      } catch (e) {
        setState(() {
          outputText = e.toString();
        });
      }
    }
    if (input?.split('-').length == 2) {
      List<String>? numbers = input?.split('-');
      try {
        if (double.parse(numbers![0]) < double.parse(numbers[1])) {
          double d = double.parse(numbers[1]) - double.parse(numbers[0]);
          RegExp regex = RegExp(r'([.]*0)(?!.*\d)');

          setState(() {
            input = d.toString().replaceAll(regex, '');
            output = d.toString().replaceAll(regex, '');
            newOutput = cutDecimal(output!);
            outputText = '-${newOutput!}';
          });
        } else {
          double d = double.parse(numbers[0]) - double.parse(numbers[1]);
          RegExp regex = RegExp(r'([.]*0)(?!.*\d)');

          setState(() {
            input = d.toString().replaceAll(regex, '');
            output = d.toString().replaceAll(regex, '');
            newOutput = cutDecimal(output!);
            outputText = newOutput!;
          });
        }
      } catch (e) {
        setState(() {
          outputText = e.toString();
        });
      }
    }
  }

  void onButtonClicked(String operator) {
    switch (operator) {
      case "C":
        setState(() {
          input = '';
          output = '';
          newOutput = '';
          outputText = '';
        });

        break;

      case "^":
        if (input!.isNotEmpty && isNumeric(input!.substring(input!.length - 1, input!.length))) {
          solve();
          setState(() {
            input = '$input^';
          });
        }
        break;

      case "/":
        if (input!.isNotEmpty && isNumeric(input!.substring(input!.length - 1, input!.length))) {
          solve();
          setState(() {
            input = '$input/';
          });
        }
        break;

      case "*":
        if (input!.isNotEmpty && isNumeric(input!.substring(input!.length - 1, input!.length))) {
          solve();
          setState(() {
            input = '$input*';
          });
        }
        break;

      case "+":
        if (input!.isNotEmpty && isNumeric(input!.substring(input!.length - 1, input!.length))) {
          solve();
          setState(() {
            input = '$input+';
          });
        }
        break;

      case "-":
        if (input!.isNotEmpty && isNumeric(input!.substring(input!.length - 1, input!.length))) {
          solve();
          setState(() {
            input = '$input-';
          });
        }
        break;

      case "%":
        if (input!.isNotEmpty && isNumeric(input!.substring(input!.length - 1, input!.length))) {
          setState(() {
            input = '$input%';
          });

          double d = double.parse(inputText!) / 100;

          setState(() {
            outputText = d.toString();
          });
        }
        break;

      case "=":
        if (input!.isNotEmpty && isNumeric(input!.substring(input!.length - 1, input!.length))) {
          solve();
        }
        break;

      default:
        if (input == null) {
          setState(() {
            input = '';
          });
        }

        setState(() {
          input = '$input$operator';
        });
    }
    setState(() {
      inputText = input;
    });
  }

  String cutDecimal(String number) {
    List<String> n = number.split("\\.");
    if (n.length > 1) {
      if (n[1] == '0') {
        number = n[0];
      }
    }
    return number;
  }

  bool isNumeric(String? str) {
    if (str == null) {
      return false;
    }
    return double.tryParse(str) != null;
  }
}
