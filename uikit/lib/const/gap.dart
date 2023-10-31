import 'package:flutter/material.dart';

typedef VerticalGap = ({
  SizedBox g120,
  SizedBox g76,
  SizedBox g48,
  SizedBox g40,
  SizedBox g34,
  SizedBox g32,
  SizedBox g28,
  SizedBox g24,
  SizedBox g16,
  SizedBox g8,
});

typedef HorizontalGap = ({
  EdgeInsets defaultSymmetric,
  SizedBox g16,
});

abstract class Gap {
  static const VerticalGap vertical = (
    g120: SizedBox(height: 120),
    g76: SizedBox(height: 76),
    g48: SizedBox(height: 48),
    g40: SizedBox(height: 40),
    g34: SizedBox(height: 34),
    g32: SizedBox(height: 32),
    g28: SizedBox(height: 28),
    g24: SizedBox(height: 24),
    g16: SizedBox(height: 16),
    g8: SizedBox(height: 8),
  );

  static const HorizontalGap horizontal = (
    defaultSymmetric: EdgeInsets.symmetric(horizontal: 20),
    g16: SizedBox(width: 16),
  );
}
