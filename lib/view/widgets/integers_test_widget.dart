import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ksucta_math/constants/constantas.dart';
import 'package:ksucta_math/utils/math_utils.dart';
import 'package:ksucta_math/utils/ui_utils.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';

class IntegersTestWidget extends StatefulWidget {
  const IntegersTestWidget({Key? key}) : super(key: key);

  @override
  State<IntegersTestWidget> createState() => _IntegersTestWidgetState();
}

class _IntegersTestWidgetState extends State<IntegersTestWidget> {
  late Random random;

  late int a;
  late int b;
  late String symbol;

  int symbolIndex = 0;
  String keyboardValue = '';

  @override
  void initState() {
    random = Random();
    _generate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              5,
              (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: Text(
                    [a, symbol, b, '=', keyboardValue][index].toString(),
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: index == 4 ? FontWeight.bold : null,
                    ),
                  ),
                );
              },
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
    a = random.nextInt(100);
    b = random.nextInt(11);
    final index = random.nextInt(3);
    symbolIndex = MathUtils.validateIntegers(a, b, index) ? index : 0;
    symbol = Constantas.mathSymbols[symbolIndex];
    keyboardValue = '';
  }

  bool _calculate() {
    int result = 0;
    switch (symbolIndex) {
      case 0:
        result = a * b;
        break;
      case 1:
        result = a ~/ b;
        break;
      case 2:
        result = a + b;
        break;
      case 3:
        result = a - b;
    }
    return result.toString() == keyboardValue;
  }
}
