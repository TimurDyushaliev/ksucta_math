import 'package:flutter/material.dart';
import 'package:ksucta_math/constants/constantas.dart';
import 'package:ksucta_math/view/pages/algorithm_tips_page.dart';
import 'package:ksucta_math/view/widgets/algorithm_test_widget.dart';
import 'package:ksucta_math/view/widgets/integers_test_widget.dart';

enum MathTestPageType { integers, algorithm }

class MathTestPage extends StatelessWidget {
  const MathTestPage({
    Key? key,
    this.type = MathTestPageType.integers,
  }) : super(key: key);

  final MathTestPageType type;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constantas.testTypes[type.index]),
        actions: [
          if (type == MathTestPageType.algorithm)
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const AlgorithmTipsPage(),
                  ),
                );
              },
              icon: const Icon(Icons.help_outline),
            ),
        ],
      ),
      body: type == MathTestPageType.integers
          ? const IntegersTestWidget()
          : const AlgorithmTestWidget(),
    );
  }
}
