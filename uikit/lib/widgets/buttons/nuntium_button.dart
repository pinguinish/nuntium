import 'package:flutter/material.dart';
import 'package:uikit/const/nuntium_dimensions.dart';
import 'package:uikit/const/nuntium_palette.dart';

const _defaultPaddingButton = EdgeInsets.symmetric(
  vertical: 24,
  horizontal: 40,
);

class NuntiumButton extends StatelessWidget {
  const NuntiumButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.padding,
  });

  final String label;
  final VoidCallback onPressed;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        backgroundColor: NuntiumPalette.purplePrimary,
        foregroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(NuntiumDimensions.defaultBorderRadius),
          ),
        ),
        padding: padding ?? _defaultPaddingButton,
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontFamily: 'SFProDisplay',
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
