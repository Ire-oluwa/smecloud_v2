import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sme_cloud_version2/constants/app_constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.enabled,
    this.maxLength,
    required this.controller,
    required this.keyboardType,
    this.obscureText,
    required this.formatter,
    required this.inputAction,
    required this.hint,
    this.label,
    this.suffixIcon,
    this.onChanged,
    this.onClick,
  }) : super(key: key);
  final bool? enabled;
  final int? maxLength;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool? obscureText;
  final List<FilteringTextInputFormatter> formatter;
  final TextInputAction inputAction;
  final String hint;
  final String? label;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;
  final void Function()? onClick;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: onClick,
      onChanged: onChanged,
      enabled: enabled,
      maxLength: maxLength,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      inputFormatters: formatter,
      textInputAction: inputAction,
      cursorColor: kPurpleTheme,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        labelText: label,
        border: InputBorder.none,
        hintText: hint,
        filled: true,
        counterText: "",
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7.r),
          borderSide: BorderSide(
            color: kSubmissionButtonColour,
            width: 1.5.w,
          ),
        ),
      ),
    );
  }
}
