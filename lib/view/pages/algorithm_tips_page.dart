import 'package:flutter/material.dart';
import 'package:ksucta_math/constants/constantas.dart';

class AlgorithmTipsPage extends StatelessWidget {
  const AlgorithmTipsPage({Key? key}) : super(key: key);

  List<String> get mathAlgorithms => Constantas.mathAlgorithms;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: mathAlgorithms.map((algorithm) {
            final index = mathAlgorithms.indexOf(algorithm);
            final symbols = algorithm.split(',');

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultTextStyle(
                    style: const TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                      fontSize: 15,
                    ),
                    child: Row(
                      children: [
                        Text((index < 2 ? '1' : '2').padLeft(14)),
                        Text((index < 2 ? '2' : '1').padLeft(9)),
                      ],
                    ),
                  ),
                  Text(
                    '${index + 1}) a ${symbols[0]} b ${symbols[1]} c = ..',
                    style: const TextStyle(fontSize: 24),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
