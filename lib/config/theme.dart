import 'package:flutter/material.dart';
import 'package:srh360app/gen/colors.gen.dart';

lightThemeData() {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: ColorName.secondaryColor),
    useMaterial3: true,
    sliderTheme: SliderThemeData(
      activeTrackColor: Colors.grey,
      trackShape: const RectangularSliderTrackShape(),
      thumbShape: SliderComponentShape.noThumb,
    ),
  );
}
