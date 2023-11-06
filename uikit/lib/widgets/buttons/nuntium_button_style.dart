import 'package:flutter/material.dart';
import 'package:uikit/const/nuntium_dimensions.dart';
import 'package:uikit/const/nuntium_palette.dart';

// TODO: Consider removing the code below.
//
// Instead of it try to replace with ThemeExtention
// in order to be able to adopt theme-switching easily

/// [NuntiumButtonStyle]
sealed class NuntiumButtonStyle extends ButtonStyle {
  const NuntiumButtonStyle();

  @override
  MaterialStateProperty<Color> get overlayColor =>
      MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.pressed)) {
          return NuntiumPalette.purpleDark.withOpacity(0.3);
        }
        return Colors.transparent;
      });

  @override
  MaterialStateProperty<EdgeInsetsGeometry> get padding =>
      const MaterialStatePropertyAll(
        EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 10,
        ),
      );

  @override
  MaterialStateProperty<OutlinedBorder> get shape =>
      const MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(NuntiumDimensions.defaultBorderRadius),
          ),
        ),
      );

  @override
  MaterialStateProperty<BorderSide> get side =>
      const MaterialStatePropertyAll(BorderSide.none);
}

/// [NuntiumDefaultButtonStyle]
final class NuntiumDefaultButtonStyle extends NuntiumButtonStyle {
  const NuntiumDefaultButtonStyle();
  @override
  MaterialStateProperty<Color> get backgroundColor =>
      const MaterialStatePropertyAll(NuntiumPalette.purplePrimary);

  @override
  MaterialStateProperty<Color> get foregroundColor =>
      const MaterialStatePropertyAll(Colors.white);
}

/// [NuntiumSocialMediaButtonStyle]
final class NuntiumSocialMediaButtonStyle extends NuntiumButtonStyle {
  const NuntiumSocialMediaButtonStyle();

  @override
  MaterialStateProperty<Color> get overlayColor =>
      const MaterialStatePropertyAll(Colors.transparent);

  @override
  MaterialStateProperty<Color> get backgroundColor =>
      const MaterialStatePropertyAll(Colors.white);

  @override
  MaterialStateProperty<Color> get foregroundColor =>
      const MaterialStatePropertyAll(NuntiumPalette.greyDart);

  @override
  MaterialStateProperty<BorderSide> get side => const MaterialStatePropertyAll(
      BorderSide(color: NuntiumPalette.greyLighter));
}
