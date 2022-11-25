import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sme_cloud_version2/constants/app_constants.dart';
import 'package:sme_cloud_version2/providers/sign_up_providers/sign_up_provider.dart';
import 'package:sme_cloud_version2/screens/dashboard/dashboard.dart';
import 'package:sme_cloud_version2/screens/sign_in/sign_in.dart';
import 'package:sme_cloud_version2/widgets/custom_checkbox/custom_checkbox.dart';
import 'package:sme_cloud_version2/widgets/custom_elevated_button/custom_elevated_button.dart';
import 'package:sme_cloud_version2/widgets/custom_text/custom_text.dart';
import 'package:sme_cloud_version2/widgets/custom_text_field/custom_text_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  static const String id = "sign up";

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: kUnfocus,
        child: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.w),
                child: Column(
                  children: [
                    SizedBox(height: 28.h),
                    Center(
                      child: CustomText(
                        size: 24.sp,
                        colour: kDeeperBlack,
                        text: "Create Account",
                        weight: kSemiBold,
                      ),
                    ),
                    SizedBox(height: 22.h),
                    SvgPicture.asset(
                      "assets/svg_pictures/woman_create_account.svg",
                    ),
                    SizedBox(height: 17.h),
                    CustomTextField(
                      controller: context.read<SignUpProvider>().fullName,
                      keyboardType: kNameInputType,
                      formatter: kFormatName,
                      hint: "Full Name",
                      inputAction: kInputActionNext,
                    ),
                    SizedBox(height: 8.h),
                    CustomTextField(
                      controller: context.read<SignUpProvider>().email,
                      keyboardType: kEmailInputType,
                      formatter: kFormatEmailAddress,
                      hint: "Email",
                      inputAction: kInputActionNext,
                    ),
                    SizedBox(height: 8.h),
                    CustomTextField(
                      controller: context.read<SignUpProvider>().phoneNumber,
                      keyboardType: kEmailInputType,
                      formatter: kFormatPhoneNumber,
                      hint: "Phone Number",
                      inputAction: kInputActionNext,
                      maxLength: 11,
                    ),
                    SizedBox(height: 8.h),
                    CustomTextField(
                      controller: context.read<SignUpProvider>().username,
                      keyboardType: kEmailInputType,
                      formatter: kFormatName,
                      hint: "Desired Username",
                      inputAction: kInputActionNext,
                    ),
                    SizedBox(height: 8.h),
                    CustomTextField(
                      controller: context.read<SignUpProvider>().password,
                      keyboardType: kPasswordInputType,
                      formatter: kFormatPassword,
                      hint: "Password",
                      inputAction: kInputActionNext,
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        CustomCheckBox(
                          checkValue:
                              context.read<SignUpProvider>().checkboxState,
                          onClick: (currentState) {
                            context.read<SignUpProvider>().checkboxState =
                                currentState!;
                            setState(() {});
                          },
                        ),
                        RichText(
                          text: TextSpan(
                            text: "",
                            children: [
                              WidgetSpan(
                                child: CustomText(
                                  size: 12.sp,
                                  colour: kDeeperBlack,
                                  text: "I agree to the ",
                                ),
                              ),
                              WidgetSpan(
                                child: CustomText(
                                  size: 12.sp,
                                  colour: kPurpleText,
                                  text: "Terms and Conditions",
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 5.h),
                    SizedBox(
                      height: 40.h,
                      width: 346.w,
                      child: CustomElevatedButton(
                        onClick: () async {
                          await storeUsername();
                          if (!mounted) return;
                          Navigator.of(context).pushNamed(Dashboard.id);
                        },
                        circularBorderRadius: 15.r,
                        backgroundColour: kSubmissionButtonColour,
                        child: CustomText(
                          text: "Sign Up",
                          size: 15.06.sp,
                          weight: kBold,
                          colour: kWhite,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    buildTextAndLink(context: context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  storeUsername() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (!mounted) return;
    preferences.setString(
      "username",
      context.read<SignUpProvider>().username.text,
    );
  }
}

Widget buildTextAndLink({context}) {
  return RichText(
    text: TextSpan(
      text: "",
      children: [
        WidgetSpan(
          child: CustomText(
            size: 14.sp,
            colour: kBlack,
            text: "Already have an account? ",
            weight: kSemiBold,
          ),
        ),
        WidgetSpan(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(SignIn.id);
            },
            child: CustomText(
              size: 14.sp,
              colour: kSubmissionButtonColour,
              text: "Sign In",
            ),
          ),
        ),
      ],
    ),
  );
}
