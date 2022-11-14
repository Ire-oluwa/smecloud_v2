import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sme_cloud_version2/constants/app_constants.dart';
import 'package:sme_cloud_version2/screens/sign_in/sign_in.dart';
import 'package:sme_cloud_version2/widgets/custom_elevated_button/custom_elevated_button.dart';
import 'package:sme_cloud_version2/widgets/custom_text/custom_text.dart';

class ChangePasswordMessage extends StatelessWidget {
  const ChangePasswordMessage({Key? key}) : super(key: key);
  static const String id = "change password message";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          child: Padding(
            padding: kColumnPadding,
            child: Column(
              children: [
                SizedBox(height: 73.h),
                SvgPicture.asset("assets/svg_pictures/change_password.svg"),
                SizedBox(height: 32.h),
                SizedBox(
                  height: 40.h,
                  width: 346.w,
                  child: CustomElevatedButton(
                    onClick: () {
                      Navigator.pushNamed(context, SignIn.id);
                    },
                    circularBorderRadius: 15.r,
                    backgroundColour: kSubmissionButtonColour,
                    child: CustomText(
                      size: 15.06.sp,
                      colour: kWhite,
                      text: "Continue",
                      weight: kBold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
