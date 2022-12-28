import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sme_cloud_version2/constants/app_constants.dart';

class CustomSelectableText extends StatelessWidget {
  const CustomSelectableText({
    Key? key,
    required this.text,
    required this.textSize,
  }) : super(key: key);
  final String text;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return SelectableText(
      text,
      style: GoogleFonts.nunito(
        color: kWhite,
        fontSize: textSize,
      ),
      cursorColor: kPurpleTheme,
      toolbarOptions: const ToolbarOptions(copy: true, selectAll: true),
    );
  }
}
