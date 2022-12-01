import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sme_cloud_version2/constants/app_constants.dart';
import 'package:sme_cloud_version2/widgets/custom_container/custom_container.dart';
import 'package:sme_cloud_version2/widgets/custom_elevated_button/custom_elevated_button.dart';
import 'package:sme_cloud_version2/widgets/custom_text/custom_text.dart';
import 'package:sme_cloud_version2/widgets/custom_text_field/custom_text_field.dart';

class ResetApiKey extends StatefulWidget {
  const ResetApiKey({Key? key}) : super(key: key);
  static const String id = "reset api key";

  @override
  State<ResetApiKey> createState() => _ResetApiKeyState();
}

class _ResetApiKeyState extends State<ResetApiKey> {
  final _password = TextEditingController();
  bool isTextFieldClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: kUnfocus,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.0.w, vertical: 27.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 27.h),
                SizedBox(
                  height: 66.h,
                  width: 390.w,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios,
                            color: kBlack, size: 20.sp),
                      ),
                      SizedBox(width: 40.w),
                      CustomText(
                        size: 16.sp,
                        colour: kBlack,
                        text: "Reset API Key",
                        weight: kSemiBold,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 45.h),
                CustomText(
                  size: 12.sp,
                  colour: kBlack,
                  text: "Current API key",
                  weight: kMedium,
                ),
                SizedBox(height: 5.h),
                FutureBuilder(
                    // future: ,
                    builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return CustomContainer(
                      width: 339.w,
                      height: 44.h,
                      colour: const Color(0xFFF2F2F2),
                      child: CustomText(
                        size: 12.sp,
                        colour: kBlack,
                        text: "235793bc2b4829f",
                      ),
                    );
                  }
                  return CustomContainer(
                    width: 339.w,
                    height: 44.h,
                    colour: const Color(0xFFF2F2F2),
                    padding: EdgeInsets.only(left: 8.w, top: 16.h),
                    borderRadius: BorderRadius.circular(7.r),
                    child: CustomText(
                      size: 12.sp,
                      colour: kBlack,
                      text: "nothing",
                    ),
                  );
                }),
                SizedBox(height: 27.h),
                CustomText(
                  size: 12.sp,
                  colour: kBlack,
                  text: "Enter Password",
                  weight: kMedium,
                ),
                SizedBox(height: 5.h),
                SizedBox(
                  height: 44.h,
                  width: 339.w,
                  child: CustomTextField(
                    controller: _password,
                    keyboardType: kPasswordInputType,
                    formatter: kFormatPassword,
                    inputAction: kInputActionNext,
                    hint: "",
                    onClick: () {
                      setState(() {
                        isTextFieldClicked = true;
                      });
                    },
                  ),
                ),
                SizedBox(height: 45.h),
                SizedBox(
                  height: 44.h,
                  width: 339.w,
                  child: CustomElevatedButton(
                    onClick: () {
                      displayConfirmation();

                      setState(() {
                        isTextFieldClicked = false;
                      });
                    },
                    circularBorderRadius: 5.r,
                    backgroundColour: isTextFieldClicked
                        ? kPurpleTheme
                        : const Color(0xBF913BD5),
                    child: CustomText(
                      size: 14.sp,
                      colour: kWhite,
                      text: "Reset",
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

  displayConfirmation() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: ((context) {
        return AlertDialog(
          insetPadding: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: 225.h,
          ),
          content: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: CircleAvatar(
                      radius: 11.r,
                      backgroundColor: kBlack,
                      child: Icon(
                        Icons.close,
                        color: kWhite,
                        size: 10.sp,
                      ),
                    ),
                  )
                ],
              ),
              CustomText(
                size: 14.sp,
                colour: kBlack,
                text: "API Key",
                weight: kSemiBold,
              ),
              SizedBox(height: 18.h),
              CustomContainer(
                  width: 249.w,
                  height: 34.h,
                  colour: const Color(0xFFDED9D9),
                  borderRadius: BorderRadius.circular(6.r),
                  child: Center(
                    child: FutureBuilder(
                        // future: ,
                        builder: ((context, snapshot) {
                      if (snapshot.hasData) {
                        return CustomText(
                            size: 12.sp,
                            colour: kBlack,
                            text: snapshot.data.toString());
                      }
                      return const Text("4279gdb429292c");
                    })),
                  )),
              SizedBox(height: 31.h),
              SizedBox(
                width: 339.w,
                height: 47.h,
                child: CustomElevatedButton(
                  onClick: () {
                    Navigator.pop(context);
                  },
                  circularBorderRadius: 5.r,
                  backgroundColour: kPurpleTheme,
                  child: CustomText(
                    size: 14.sp,
                    colour: kWhite,
                    text: "Continue",
                    weight: kBold,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
