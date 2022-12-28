import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sme_cloud_version2/constants/app_constants.dart';
import 'package:sme_cloud_version2/providers/change_pin_provider/change_pin_provider.dart';
import 'package:sme_cloud_version2/widgets/custom_elevated_button/custom_elevated_button.dart';
import 'package:sme_cloud_version2/widgets/custom_text/custom_text.dart';
import 'package:sme_cloud_version2/widgets/custom_text_field/custom_text_field.dart';

class ChangePin extends StatefulWidget {
  const ChangePin({Key? key}) : super(key: key);

  @override
  State<ChangePin> createState() => _ChangePinState();
  static const String id = "change pin";
}

class _ChangePinState extends State<ChangePin> {
  bool _isEdited = false;

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
                        text: "Change Pin",
                        weight: kSemiBold,
                      ),
                    ],
                  ),
                  SizedBox(height: 66.h),
                  CustomText(
                    size: 12.sp,
                    colour: kBlack,
                    text: "Current Pin",
                    weight: kMedium,
                  ),
                  SizedBox(height: 5.h),
                  CustomTextField(
                    controller: context.read<ChangePinProvider>().currentPin,
                    keyboardType: kPasswordInputType,
                    formatter: kFormatPassword,
                    inputAction: kInputActionNext,
                    hint: "",
                  ),
                  SizedBox(height: 22.h),
                  CustomText(
                    size: 12.sp,
                    colour: kBlack,
                    text: "New Pin",
                    weight: kMedium,
                  ),
                  SizedBox(height: 5.h),
                  CustomTextField(
                    controller: context.read<ChangePinProvider>().newPin,
                    keyboardType: kPasswordInputType,
                    formatter: kFormatPassword,
                    inputAction: kInputActionNext,
                    hint: "",
                  ),
                  SizedBox(height: 45.h),
                  _isEdited
                      ? SizedBox(
                          height: 47.h,
                          width: 339.w,
                          child: CustomElevatedButton(
                            onClick: () {
                              setState(() {
                                _isEdited = !_isEdited;
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
                                _isEdited = !_isEdited;
                              });
                            },
                            backgroundColour: kPurpleTheme.withOpacity(0.75),
                            circularBorderRadius: 6.r,
                            child: CustomText(
                              size: 14.sp,
                              colour: kWhite,
                              text: "Change Pin",
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
