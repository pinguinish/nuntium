import 'package:flutter/material.dart';
import 'package:uikit/const/nuntium_icons.dart';

void main(List<String> args) => runApp(const ExampleUIKit());

List<IconData> icons = const [
  NuntiumIcons.angelRight,
  NuntiumIcons.arrowLeft,
  NuntiumIcons.book,
  NuntiumIcons.bookmark,
  NuntiumIcons.categories,
  NuntiumIcons.envelope,
  NuntiumIcons.eye,
  NuntiumIcons.home,
  NuntiumIcons.microphone,
  NuntiumIcons.padlock,
  NuntiumIcons.person,
  NuntiumIcons.search,
  NuntiumIcons.share,
  NuntiumIcons.signout,
];

class ExampleUIKit extends StatelessWidget {
  const ExampleUIKit({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 48),
                  const Text(
                    "Nuntium UIKit",
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    alignment: WrapAlignment.center,
                    children: icons.map((i) => Icon(i)).toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
