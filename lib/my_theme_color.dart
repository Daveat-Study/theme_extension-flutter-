import 'package:flutter/material.dart';

class MyThemeColor extends ThemeExtension<MyThemeColor> {
  const MyThemeColor({
    required this.brandColor,
    required this.danger,
  });

  final Color? brandColor;
  final Color? danger;

  @override
  MyThemeColor copyWith({Color? branchColor, Color? danger}) {
    return MyThemeColor(
      brandColor: branchColor ?? this.brandColor,
      danger: danger ?? this.danger,
    );
  }

  @override
  ThemeExtension<MyThemeColor> lerp(
    covariant ThemeExtension<MyThemeColor>? other,
    double t,
  ) {
    if (other is! MyThemeColor) {
      return this;
    }
    return MyThemeColor(
      brandColor: Color.lerp(
        brandColor,
        other.brandColor,
        t,
      ),
      danger: Color.lerp(
        danger,
        other.danger,
        t,
      ),
    );
  }
}
