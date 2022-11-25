import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    required this.onClick,
    required this.circularBorderRadius,
    required this.child,
    required this.backgroundColour,
    this.elevation,
  }) : super(key: key);
  final void Function() onClick;
  final double circularBorderRadius;
  final Widget child;
  final Color backgroundColour;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClick,
      style: ElevatedButton.styleFrom(
        elevation: elevation,
        backgroundColor: backgroundColour,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(circularBorderRadius),
        ),
      ),
      child: child,
    );
  }
}
