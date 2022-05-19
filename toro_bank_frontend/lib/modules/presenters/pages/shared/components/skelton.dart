import 'package:flutter/material.dart';

class Skelton extends StatelessWidget {
  const Skelton({
    Key? key,
    this.height,
    this.width,
    this.margin,
    this.color = Colors.white,
  }) : super(key: key);

  final double? height, width;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: color!.withOpacity(0.1),
          borderRadius: const BorderRadius.all(Radius.circular(15))),
    );
  }
}
