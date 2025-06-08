 import 'package:flutter/material.dart';

class SpacingBox extends StatelessWidget {
  final double height;
  final double width;

  const SpacingBox.height(this.height, {super.key}) : width = 0;
  const SpacingBox.width(this.width, {super.key}) : height = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height, width: width);
  }
}
