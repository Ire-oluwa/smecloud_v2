import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sme_cloud_version2/constants/app_constants.dart';
import 'package:sme_cloud_version2/providers/sign_in_provider/sign_in_provider.dart';
import 'package:sme_cloud_version2/screens/forgot_password/forgot_password.dart';
import 'package:sme_cloud_version2/screens/sign_up/sign_up.dart';
import 'package:sme_cloud_version2/widgets/custom_checkbox/custom_checkbox.dart';
import 'package:sme_cloud_version2/widgets/custom_elevated_button/custom_elevated_button.dart';
import 'package:sme_cloud_version2/widgets/custom_text/custom_text.dart';
import 'package:sme_cloud_version2/widgets/custom_text_field/custom_text_field.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);
  static const String id = "sign in";

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: kUnfocus,
        child: SingleChildScrollView(
          child: SafeArea(
            child: SizedBox(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0.w),
                child: Column(
                  children: [
                    SizedBox(height: 28.h),
                    Center(
                      child: CustomText(
                        size: 24.sp,
                        colour: kDeeperBlack,
                        text: "Sign In",
                        weight: kSemiBold,
                      ),
                    ),
                    SizedBox(height: 29.h),
                    SvgPicture.asset("assets/svg_pictures/woman_login.svg"),
                    SizedBox(height: 14.h),
                    CustomTextField(
                      controller: context.read<SignInProvider>().emailAddress,
                      keyboardType: kEmailInputType,
                      formatter: kFormatEmailAddress,
                      inputAction: kInputActionNext,
                      hint: "Email",
                    ),
                    SizedBox(height: 8.h),
                    CustomTextField(
                      controller: context.read<SignInProvider>().password,
                      keyboardType: kPasswordInputType,
                      formatter: kFormatPassword,
                      inputAction: kInputActionNext,
                      hint: "Password",
                    ),
                    SizedBox(height: 28.h),
                    Row(
                      children: [
                        CustomCheckBox(
                          checkValue:
                              context.read<SignInProvider>().signInCheckbox,
                          onClick: (currentState) {
                            setState(() {
                              context.read<SignInProvider>().signInCheckbox =
                                  currentState!;
                            });
                          },
                        ),
                        _buildTextAndLink(
                          context: context,
                          normalText: "Forgot Password? ",
                          linkText: "Click here",
                          onClick: () {
                            Navigator.of(context).pushNamed(ForgotPassword.id);
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    SizedBox(
                      height: 40.h,
                      width: 346.w,
                      child: CustomElevatedButton(
                        onClick: () {},
                        circularBorderRadius: 15.r,
                        backgroundColour: kSubmissionButtonColour,
                        child: CustomText(
                          size: 15.06.sp,
                          colour: kWhite,
                          text: "Sign In",
                          weight: kBold,
                        ),
                      ),
                    ),
                    SizedBox(height: 14.h),
                    _buildTextAndLink(
                      context: context,
                      normalText: "Don't have an account? ",
                      linkText: "Sign Up",
                      onClick: () {
                        Navigator.pushNamed(context, SignUp.id);
                      },
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

Widget _buildTextAndLink({context, normalText, linkText, onClick}) {
  return RichText(
    text: TextSpan(
      text: "",
      children: [
        WidgetSpan(
          child: CustomText(
            size: 14.sp,
            colour: kBlack,
            text: normalText,
            weight: kSemiBold,
          ),
        ),
        WidgetSpan(
          child: GestureDetector(
            onTap: onClick,
            child: CustomText(
              size: 14.sp,
              colour: kSubmissionButtonColour,
              text: linkText,
            ),
          ),
        ),
      ],
    ),
  );
}
