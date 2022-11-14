import 'package:flutter/material.dart';
import 'package:sme_cloud_version2/constants/app_constants.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    Key? key,
    this.margin,
    this.padding,
    required this.width,
    required this.height,
    this.colour,
    this.decorationImage,
    this.borderRadius,
    this.border,
    this.gradient,
    this.shadowColour,
    this.blurRadius,
    this.spreadRadius,
    required this.child,
  }) : super(key: key);
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double width;
  final double height;
  final Color? colour;
  final DecorationImage? decorationImage;
  final BorderRadiusGeometry? borderRadius;
  final BoxBorder? border;
  final Gradient? gradient;
  final Color? shadowColour;
  final double? blurRadius;
  final double? spreadRadius;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: colour,
        image: decorationImage,
        borderRadius: borderRadius,
        border: border,
        gradient: gradient,
        boxShadow: [
          BoxShadow(
            color: shadowColour ?? kTransparent,
            blurRadius: blurRadius ?? 0.0,
            spreadRadius: spreadRadius ?? 0.0,
          ),
        ],
      ),
      child: child,
    );
  }
}
