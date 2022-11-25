import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sme_cloud_version2/constants/app_constants.dart';
import 'package:sme_cloud_version2/widgets/custom_text/custom_text.dart';

class ResetApiKey extends StatelessWidget {
  const ResetApiKey({Key? key}) : super(key: key);
  static const String id = "reset api key";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: kPurpleTheme,
        centerTitle: true,
        title: CustomText(
          size: 16.sp,
          colour: kWhite,
          text: "Reset API Key",
          weight: kSemiBold,
        ),
      ),
    );
  }
}
