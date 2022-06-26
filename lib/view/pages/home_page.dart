import 'package:flutter/material.dart';
import 'package:ksucta_math/constants/constantas.dart';
import 'package:ksucta_math/view/pages/math_test_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  List<String> get texts => Constantas.testTypes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          texts.length,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MathTestPage(
                      type: MathTestPageType.values[index],
                    ),
                  ),
                );
              },
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  texts[index],
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
