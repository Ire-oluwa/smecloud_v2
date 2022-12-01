import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sme_cloud_version2/constants/app_constants.dart';

class OTPInput extends StatelessWidget {
  const OTPInput({Key? key, required this.controller}) : super(key: key);
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.h,
      width: 33.w,
      child: TextField(
        cursorColor: kPurpleTheme,
        cursorWidth: 3.w,
        cursorHeight: 16.h,
        controller: controller,
        // autofocus: true,
        textAlign: TextAlign.center,
        maxLength: 1,
        textInputAction: TextInputAction.next,
        keyboardType: kNumberInputType,
        style: TextStyle(fontSize: 14.sp),
        decoration: InputDecoration(
          border: InputBorder.none,
          filled: true,
          counterText: "",
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.r),
            borderSide: BorderSide(
              color: kPurpleTheme,
              width: 1.5.w,
            ),
          ),
        ),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}
