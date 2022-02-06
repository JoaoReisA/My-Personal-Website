import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorPickerWidget extends StatelessWidget {
  ColorPickerWidget(
      {required this.color, required this.onColorChanged, Key? key})
      : super(key: key);
  Color color;
  Function(Color value) onColorChanged;
  @override
  Widget build(BuildContext context) {
    return ColorPicker(
        pickerColor: color,
        onColorChanged: onColorChanged,
        enableAlpha: false,
        pickerAreaBorderRadius: BorderRadius.circular(8));
  }
}
