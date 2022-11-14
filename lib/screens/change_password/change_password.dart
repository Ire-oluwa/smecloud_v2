import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sme_cloud_version2/constants/app_constants.dart';
import 'package:sme_cloud_version2/providers/change_password_provider/change_password_provider.dart';
import 'package:sme_cloud_version2/screens/change_password/change_password_message.dart';
import 'package:sme_cloud_version2/widgets/custom_elevated_button/custom_elevated_button.dart';
import 'package:sme_cloud_version2/widgets/custom_text/custom_text.dart';
import 'package:sme_cloud_version2/widgets/custom_text_field/custom_text_field.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);
  static const String id = "change password";

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: GestureDetector(
            onTap: kUnfocus,
            child: SizedBox(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.w),
                child: Column(
                  children: [
                    SizedBox(height: 47.h),
                    Center(
                      child: CustomText(
                        size: 24.sp,
                        colour: kDeeperBlack,
                        text: "Enter New Password",
                        weight: kSemiBold,
                      ),
                    ),
                    SizedBox(height: 42.h),
                    CustomTextField(
                      controller:
                          context.read<ChangePasswordProvider>().newPassword,
                      keyboardType: kPasswordInputType,
                      formatter: kFormatPassword,
                      inputAction: kInputActionNext,
                      obscureText: context
                          .read<ChangePasswordProvider>()
                          .isNewPasswordObscured,
                      hint: "New Password",
                      suffixIcon: IconButton(
                        onPressed: () {
                          WidgetsBinding.instance.addPostFrameCallback(
                            (timeStamp) => setState(() {
                              context
                                  .read<ChangePasswordProvider>()
                                  .seeOrUnseeNewPassword();
                            }),
                          );
                        },
                        icon: context
                                .read<ChangePasswordProvider>()
                                .isNewPasswordObscured
                            ? FaIcon(
                                FontAwesomeIcons.solidEyeSlash,
                                size: 19.sp,
                                color: Colors.grey,
                              )
                            : FaIcon(
                                FontAwesomeIcons.solidEye,
                                color: kPurpleText,
                                size: 19.sp,
                              ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    CustomTextField(
                      controller: context
                          .read<ChangePasswordProvider>()
                          .confirmPassword,
                      keyboardType: kPasswordInputType,
                      formatter: kFormatPassword,
                      inputAction: kInputActionNext,
                      hint: "Confirm Password",
                      obscureText: context
                          .read<ChangePasswordProvider>()
                          .isConfirmedPasswordObscured,
                      suffixIcon: IconButton(
                        onPressed: () {
                          WidgetsBinding.instance.addPostFrameCallback(
                            (timeStamp) => setState(() {
                              context
                                  .read<ChangePasswordProvider>()
                                  .seeOrUnseeConfirmedPassword();
                            }),
                          );
                        },
                        icon: context
                                .read<ChangePasswordProvider>()
                                .isConfirmedPasswordObscured
                            ? FaIcon(
                                FontAwesomeIcons.solidEyeSlash,
                                size: 19.sp,
                                color: Colors.grey,
                              )
                            : FaIcon(
                                FontAwesomeIcons.solidEye,
                                color: kPurpleText,
                                size: 19.sp,
                              ),
                      ),
                    ),
                    SizedBox(height: 32.h),
                    SizedBox(
                      height: 40.h,
                      width: 346.w,
                      child: CustomElevatedButton(
                        onClick: () {
                          Navigator.of(context)
                              .pushNamed(ChangePasswordMessage.id);
                        },
                        circularBorderRadius: 15.r,
                        backgroundColour: kSubmissionButtonColour,
                        child: CustomText(
                          size: 15.06.sp,
                          colour: kWhite,
                          text: "Change Password",
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
