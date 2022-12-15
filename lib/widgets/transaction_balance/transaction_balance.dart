import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sme_cloud_version2/constants/app_constants.dart';
import 'package:sme_cloud_version2/widgets/custom_container/custom_container.dart';
import 'package:sme_cloud_version2/widgets/custom_text/custom_text.dart';

class TransactionBalance extends StatelessWidget {
  const TransactionBalance({
    Key? key,
    required this.isBalanceObscured,
    required this.onIconToggled,
  }) : super(key: key);
  final bool isBalanceObscured;
  final void Function() onIconToggled;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      width: 366.w,
      height: 100.h,
      colour: const Color(0xFF0588E8),
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      borderRadius: BorderRadius.circular(8.r),
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 14.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset("assets/dashboard_svg_images/wallet.png"),
          SizedBox(width: 7.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                  size: 12.sp, colour: kWhite, text: "Transaction Balance"),
              CustomText(
                size: 16.sp,
                colour: kWhite,
                text: isBalanceObscured ? "*** *** *** **" : "N 100,000",
                weight: kSemiBold,
              ),
              CustomText(
                size: 12.sp,
                colour: kWhite,
                text: "Acct number   2345678765",
              ),
            ],
          ),
          SizedBox(width: 50.w),
          Center(
            child: IconButton(
              onPressed: onIconToggled,
              icon: FaIcon(
                isBalanceObscured
                    ? FontAwesomeIcons.solidEyeSlash
                    : FontAwesomeIcons.solidEye,
                size: 16.sp,
                color: kWhite,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
