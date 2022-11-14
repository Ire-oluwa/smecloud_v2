import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.size,
    this.weight,
    this.align,
    required this.colour,
    required this.text,
  }) : super(key: key);
  final double size;
  final FontWeight? weight;
  final TextAlign? align;
  final Color colour;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      textAlign: align,
      style: GoogleFonts.getFont(
        "Nunito",
        textStyle: TextStyle(
          color: colour,
          fontSize: size,
          fontWeight: weight,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
