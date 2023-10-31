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

const verticalGap = SizedBox(height: 24);

class ExampleUIKit extends StatelessWidget {
  const ExampleUIKit({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                verticalGap,
                const Text(
                  "Nuntium UIKit",
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    fontSize: 24,
                  ),
                ),
                verticalGap,
                Wrap(
                  spacing: 20,
                  alignment: WrapAlignment.center,
                  children: icons.map((i) => Icon(i)).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
