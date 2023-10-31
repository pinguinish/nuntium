import 'package:flutter/material.dart';

void main(List<String> args) => runApp(const ExampleUIKit());

class ExampleUIKit extends StatelessWidget {
  const ExampleUIKit({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 24),
                Text(
                  "Nuntium UIKit",
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
