import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sme_cloud_version2/constants/app_constants.dart';
import 'package:sme_cloud_version2/providers/change_password_in_settings_provider/change_password_in_settings_provider.dart';
import 'package:sme_cloud_version2/widgets/custom_elevated_button/custom_elevated_button.dart';
import 'package:sme_cloud_version2/widgets/custom_text/custom_text.dart';
import 'package:sme_cloud_version2/widgets/custom_text_field/custom_text_field.dart';

class ChangePasswordSetting extends StatefulWidget {
  const ChangePasswordSetting({Key? key}) : super(key: key);
  static const String id = "change password in settings";

  @override
  State<ChangePasswordSetting> createState() => _ChangePasswordSettingState();
}

class _ChangePasswordSettingState extends State<ChangePasswordSetting> {
  bool isEdited = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: kUnfocus,
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: 20.sp,
                        ),
                      ),
                      SizedBox(width: 35.w),
                      CustomText(
                        size: 18.sp,
                        colour: kBlack,
                        text: "Change Password",
                        weight: kSemiBold,
                      ),
                    ],
                  ),
                  SizedBox(height: 66.h),
                  CustomText(
                    size: 12.sp,
                    colour: kBlack,
                    text: "Current Password",
                    weight: kMedium,
                  ),
                  SizedBox(height: 5.h),
                  CustomTextField(
                    controller: context
                        .read<ChangePasswordInSettingProvider>()
                        .currentPassword,
                    keyboardType: kPasswordInputType,
                    formatter: kFormatPassword,
                    inputAction: kInputActionNext,
                    hint: "",
                  ),
                  SizedBox(height: 22.h),
                  CustomText(
                    size: 12.sp,
                    colour: kBlack,
                    text: "New Password",
                    weight: kMedium,
                  ),
                  SizedBox(height: 5.h),
                  CustomTextField(
                    controller: context
                        .read<ChangePasswordInSettingProvider>()
                        .newPassword,
                    keyboardType: kPasswordInputType,
                    formatter: kFormatPassword,
                    inputAction: kInputActionNext,
                    hint: "",
                  ),
                  SizedBox(height: 45.h),
                  isEdited
                      ? SizedBox(
                          height: 47.h,
                          width: 339.w,
                          child: CustomElevatedButton(
                            onClick: () {
                              setState(() {
                                isEdited = !isEdited;
                              });
                            },
                            backgroundColour: kPurpleTheme,
                            circularBorderRadius: 6.r,
                            child: CustomText(
                              size: 14.sp,
                              colour: kWhite,
                              text: "Change Password",
                              weight: kBold,
                            ),
                          ),
                        )
                      : SizedBox(
                          height: 47.h,
                          width: 339.w,
                          child: CustomElevatedButton(
                            onClick: () {
                              setState(() {
                                isEdited = !isEdited;
                              });
                            },
                            backgroundColour: kPurpleTheme.withOpacity(0.75),
                            circularBorderRadius: 6.r,
                            child: CustomText(
                              size: 14.sp,
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
    );
  }
}
