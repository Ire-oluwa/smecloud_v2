import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sme_cloud_version2/constants/app_constants.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    Key? key,
    required this.checkValue,
    required this.onClick,
  }) : super(key: key);
  final bool checkValue;
  final void Function(bool?) onClick;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      fillColor: MaterialStateProperty.all(kSubmissionButtonColour),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
      onChanged: onClick,
      value: checkValue,
    );
  }
}
