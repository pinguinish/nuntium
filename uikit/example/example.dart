import 'package:flutter/material.dart';
import 'package:uikit/const/gap.dart';
import 'package:uikit/const/nuntium_icons.dart';
import 'package:uikit/widgets/buttons/nuntium_button.dart';

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
              padding: Gap.horizontal.defaultSymmetric,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Gap.vertical.g34,
                  const Text(
                    
                    "Nuntium UIKit",
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      fontSize: 24,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Gap.vertical.g24,
                  Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    alignment: WrapAlignment.center,
                    children: icons.map((i) => Icon(i)).toList(),
                  ),
                  Gap.vertical.g24,
                  SizedBox(
                    width: double.infinity,
                    child: NuntiumButton(
                      label: 'Next',
                      onPressed: () {},
                    ),
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
