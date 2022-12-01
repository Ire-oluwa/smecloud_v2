import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sme_cloud_version2/constants/app_constants.dart';
import 'package:sme_cloud_version2/widgets/custom_container/custom_container.dart';
import 'package:sme_cloud_version2/widgets/custom_text/custom_text.dart';

class HelpAndSupport extends StatelessWidget {
  const HelpAndSupport({Key? key}) : super(key: key);
  static const String id = "help and support";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: kBlack,
            size: 18.sp,
          ),
        ),
        backgroundColor: kWhite,
        elevation: 0,
        title: CustomText(
          size: 18.sp,
          colour: kBlack,
          text: "Help and Support",
          weight: kSemiBold,
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          child: Column(
            children: [
              SizedBox(height: 30.h),
              InkWell(
                onTap: () {},
                child: CustomContainer(
                  width: 360.w,
                  height: 92.h,
                  colour: kWhite,
                  margin: EdgeInsets.symmetric(horizontal: 15.w),
                  borderRadius: BorderRadius.circular(6.r),
                  padding: EdgeInsets.only(left: 22.w, top: 14.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        size: 14.sp,
                        colour: kBlack,
                        text: "FAQ",
                        weight: kSemiBold,
                      ),
                      SizedBox(height: 13.h),
                      Wrap(
                        children: [
                          SizedBox(
                            height: 28.h,
                            width: 241.w,
                            child: CustomText(
                              size: 11.sp,
                              colour: kInActiveBlack,
                              text:
                                  "The following are the answers that may guide you to\nsolve your questions",
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 14.h),
              CustomContainer(
                width: 360.w,
                height: 109.h,
                colour: kWhite,
                margin: EdgeInsets.symmetric(horizontal: 15.w),
                borderRadius: BorderRadius.circular(6.r),
                padding: EdgeInsets.only(left: 22.w, top: 14.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      size: 14.sp,
                      colour: kBlack,
                      text: "Support",
                      weight: kSemiBold,
                    ),
                    SizedBox(height: 18.h),
                    SizedBox(
                      width: 286.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Image.asset(
                              "assets/dashboard_svg_images/logos_whatsapp-icon.png",
                            ),
                          ),
                          _buildSvgImage(
                            onClick: () {},
                            imageLocation:
                                "assets/dashboard_svg_images/facebook_icon.svg",
                          ),
                          _buildSvgImage(
                            onClick: () {},
                            imageLocation:
                                "assets/dashboard_svg_images/twitter_icon.svg",
                          ),
                          _buildSvgImage(
                            onClick: () {},
                            imageLocation:
                                "assets/dashboard_svg_images/instagram_icon.svg",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSvgImage({imageLocation, onClick}) {
    return GestureDetector(
      onTap: onClick,
      child: SvgPicture.asset(imageLocation),
    );
  }
}
