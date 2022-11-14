import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sme_cloud_version2/constants/app_constants.dart';
import 'package:sme_cloud_version2/providers/forgot_password_provider/forgot_password_provider.dart';
import 'package:sme_cloud_version2/screens/otp_screen/otp_screen.dart';
import 'package:sme_cloud_version2/widgets/custom_elevated_button/custom_elevated_button.dart';
import 'package:sme_cloud_version2/widgets/custom_text/custom_text.dart';
import 'package:sme_cloud_version2/widgets/custom_text_field/custom_text_field.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);
  static const String id = "forgot password";
  final forgotPasswordText =
      "Enter your registered email below to receive\npassword reset instruction";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: kUnfocus,
          child: SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: Column(
                children: [
                  SizedBox(height: 34.h),
                  Center(
                    child: CustomText(
                      size: 24.sp,
                      colour: kDeeperBlack,
                      text: "Forgot Password",
                      weight: kSemiBold,
                    ),
                  ),
                  SizedBox(height: 42.h),
                  SvgPicture.asset(
                    "assets/svg_pictures/woman_forgot_password.svg",
                  ),
                  SizedBox(height: 39.h),
                  SizedBox(
                    width: 277.w,
                    height: 48.h,
                    child: CustomText(
                      align: TextAlign.center,
                      size: 14.sp,
                      colour: kDimBlack,
                      text: forgotPasswordText,
                      weight: kNormal,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  CustomTextField(
                    controller: context.read<ForgotPasswordProvider>().email,
                    keyboardType: kEmailInputType,
                    formatter: kFormatEmailAddress,
                    inputAction: kInputActionNext,
                    hint: "Email",
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    height: 40.h,
                    width: 346.w,
                    child: CustomElevatedButton(
                      onClick: () {
                        Navigator.of(context).pushNamed(OTPScreen.id);
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
      ),
    );
  }
}
