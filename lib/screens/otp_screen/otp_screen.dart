import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sme_cloud_version2/constants/app_constants.dart';
import 'package:sme_cloud_version2/screens/change_password/change_password.dart';
import 'package:sme_cloud_version2/widgets/custom_elevated_button/custom_elevated_button.dart';
import 'package:sme_cloud_version2/widgets/custom_text/custom_text.dart';
import 'package:sme_cloud_version2/widgets/custom_text_field/custom_text_field.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);
  static const String id = "otp screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: GestureDetector(
            onTap: kUnfocus,
            child: SizedBox(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0.w),
                child: Column(
                  children: [
                    SizedBox(height: 52.h),
                    Center(
                      child: CustomText(
                        size: 24.sp,
                        colour: kDeeperBlack,
                        text: "Let's Verify That It's You",
                      ),
                    ),
                    SizedBox(height: 14.h),
                    CustomTextField(
                      controller: TextEditingController(),
                      keyboardType: kNumberInputType,
                      formatter: kFormatPhoneNumber,
                      inputAction: TextInputAction.next,
                      maxLength: 6,
                      hint: "Enter OTP",
                    ),
                    SizedBox(height: 21.h),
                    SvgPicture.asset(
                      "assets/svg_texts/OTP_headline.svg",
                    ),
                    SizedBox(height: 15.h),
                    SvgPicture.asset(
                      "assets/svg_texts/otp_subtitle.svg",
                    ),
                    SizedBox(height: 15.h),
                    SizedBox(
                      height: 40.h,
                      width: 346.w,
                      child: CustomElevatedButton(
                        onClick: () {
                          Navigator.of(context).pushNamed(ChangePassword.id);
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
      ),
    );
  }
}
