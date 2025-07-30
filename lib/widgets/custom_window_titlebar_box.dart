import 'package:flutter/material.dart';

class CustomWindowTitleBarBox extends StatelessWidget {
  final Widget? child;
  final double height;

  const CustomWindowTitleBarBox({
    super.key,
    this.child,
    this.height = 40,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: child ?? Container(),
    );
  }
}
