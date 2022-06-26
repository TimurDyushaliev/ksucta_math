import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ksucta_math/constants/constantas.dart';
import 'package:ksucta_math/utils/math_utils.dart';
import 'package:ksucta_math/utils/ui_utils.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';

class AlgorithmTestWidget extends StatefulWidget {
  const AlgorithmTestWidget({Key? key}) : super(key: key);

  @override
  State<AlgorithmTestWidget> createState() => _AlgorithmTestWidgetState();
}

class _AlgorithmTestWidgetState extends State<AlgorithmTestWidget> {
  late Random random;
  late int a, b, c, algorithmIndex;

  String keyboardValue = '';

  @override
  void initState() {
    random = Random();
    _generate();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final symbols = Constantas.mathAlgorithms[algorithmIndex].split(',');

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Center(
            child: RichText(
              text: TextSpan(
                text: '$a ${symbols[0]} $b ${symbols[1]} $c = ',
                style: const TextStyle(fontSize: 30, color: Colors.black),
                children: [
                  TextSpan(
                    text: keyboardValue,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        NumericKeyboard(
          rightIcon: const Icon(Icons.backspace),
          leftIcon: const Icon(Icons.done),
          rightButtonFn: () {
            if (keyboardValue.isNotEmpty) {
              setState(() {
                keyboardValue =
                    keyboardValue.substring(0, keyboardValue.length - 1);
              });
            }
          },
          leftButtonFn: () {
            final result = _calculate();
            showResultDialog(context, result, onDismiss: () {
              if (result) {
                _generate();
              } else {
                keyboardValue = '';
              }
              setState(() {});
            });
          },
          onKeyboardTap: (value) {
            if (keyboardValue.length < 3) {
              setState(() {
                keyboardValue += value;
              });
            }
          },
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      ],
    );
  }

  void _generate() {
    a = random.nextInt(31);
    b = random.nextInt(31);
    c = random.nextInt(31);

    final randomIndex = random.nextInt(4);

    algorithmIndex =
        MathUtils.validateAlgorithm(a, b, c, randomIndex) ? randomIndex : 0;

    keyboardValue = '';
  }

  bool _calculate() {
    int? result;
    switch (algorithmIndex) {
      case 0:
        result = a * b + c;
        break;
      case 1:
        result = a ~/ b - c;
        break;
      case 2:
        result = a + b ~/ c;
        break;
      case 3:
        result = c * b - a;
        break;
    }
    return result.toString() == keyboardValue;
  }
}
