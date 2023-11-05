import 'package:flutter/material.dart';
import 'package:uikit/widgets/buttons/nuntium_button_style.dart';

class NuntiumButton extends StatelessWidget {
  const NuntiumButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.style = const NuntiumDefaultButtonStyle(),
  });

  final String label;
  final VoidCallback onPressed;
  final ButtonStyle style;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: style,
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

  factory NuntiumButton.icon({
    required String label,
    required VoidCallback onPressed,
    required Widget icon,
    double? spacing,
    double? runSpacing,
    ButtonStyle? style,
  }) {
    return _NuntiumButtonWithIcon(
      label: label,
      onPressed: onPressed,
      icon: icon,
      runSpacing: runSpacing ?? 10,
      spacing: spacing ?? 10,
      style: style ?? const NuntiumDefaultButtonStyle(),
    );
  }

  static ({
    NuntiumSocialMediaButtonStyle socialMedia,
    NuntiumDefaultButtonStyle default_,
  }) styles = (
    socialMedia: const NuntiumSocialMediaButtonStyle(),
    default_: const NuntiumDefaultButtonStyle(),
  );
}

class _NuntiumButtonWithIcon extends NuntiumButton {
  const _NuntiumButtonWithIcon({
    required this.icon,
    required super.label,
    required super.onPressed,
    required this.runSpacing,
    required this.spacing,
    super.style,
  });

  final double spacing;
  final double runSpacing;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: super.onPressed,
      style: style,
      child: Wrap(
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        runSpacing: runSpacing,
        spacing: spacing,
        children: [
          SizedBox(
            height: 24,
            width: 24,
            child: icon,
          ),
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: 'SFProDisplay',
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
