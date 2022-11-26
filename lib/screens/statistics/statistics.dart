import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sme_cloud_version2/constants/app_constants.dart';
import 'package:sme_cloud_version2/widgets/custom_container/custom_container.dart';
import 'package:sme_cloud_version2/widgets/custom_elevated_button/custom_elevated_button.dart';
import 'package:sme_cloud_version2/widgets/custom_text/custom_text.dart';

class Statistics extends StatefulWidget {
  const Statistics({Key? key}) : super(key: key);
  static const String id = "statistics";

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  bool _isAllClicked = true;

  bool _isWalletClicked = false;

  bool _isServerClicked = false;

  final _period = ["Past", "Present", "Future"];
  late String _currentPeriod = _period.first;

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
          text: "Statistics",
          weight: kSemiBold,
        ),
      ),
      body: SizedBox(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 7.h),
              CustomContainer(
                width: 354.w,
                height: 35.h,
                borderRadius: BorderRadius.circular(5.r),
                colour: kVeryLightPurple,
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                child: Row(
                  children: [
                    _buildAll(),
                    SizedBox(width: 2.w),
                    _buildWallet(),
                    SizedBox(width: 2.w),
                    _buildServer(),
                  ],
                ),
              ),
              SizedBox(height: 17.h),
              _dropDownButton(
                border: Border(
                  left: BorderSide(width: 2.w, color: const Color(0xFFDDDDDD)),
                  right: BorderSide(width: 2.w, color: const Color(0xFFDDDDDD)),
                  top: BorderSide(width: 2.w, color: const Color(0xFFDDDDDD)),
                  bottom:
                      BorderSide(width: 2.w, color: const Color(0xFFDDDDDD)),
                ),
                onChanged: (currentPeriod) {
                  setState(() {
                    _currentPeriod = currentPeriod!;
                  });
                },
              ),
              SizedBox(height: 18.h),
              CustomText(
                size: 13.72.sp,
                colour: kBlack,
                text: "Chart",
                weight: kSemiBold,
              ),
              SizedBox(height: 284.h, width: 355.w),
              CustomContainer(
                height: 104.h,
                width: 168.w,
                colour: const Color(0xFFECE3F2),
                padding: EdgeInsets.only(left: 14.w, top: 14.0.h, bottom: 14.h),
                borderRadius: BorderRadius.circular(7.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Income",
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF5B5B66),
                        fontSize: 11.sp,
                        fontWeight: kMedium,
                      ),
                    ),
                    Text(
                      "N 100,000",
                      style: GoogleFonts.poppins(
                        color: kBlack,
                        fontSize: 17.sp,
                        fontWeight: kSemiBold,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "+ 2% ",
                          style: GoogleFonts.poppins(
                            color: kNormalGreen,
                            fontSize: 11.sp,
                            fontWeight: kMedium,
                          ),
                        ),
                        Text(
                          "more than last week",
                          style: GoogleFonts.poppins(
                            color: const Color(0xFF5B5B66),
                            fontSize: 11.sp,
                            fontWeight: kMedium,
                          ),
                        )
                      ],
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

  clickAll() {
    setState(() {
      _isAllClicked = true;
      _isWalletClicked = false;
      _isServerClicked = false;
    });
  }

  clickWallet() {
    setState(() {
      _isAllClicked = false;
      _isWalletClicked = true;
      _isServerClicked = false;
    });
  }

  clickServer() {
    setState(() {
      _isAllClicked = false;
      _isWalletClicked = false;
      _isServerClicked = true;
    });
  }

  Widget _buildAll() {
    return SizedBox(
      height: 31.h,
      width: 105.w,
      child: CustomElevatedButton(
        onClick: clickAll,
        circularBorderRadius: _isAllClicked ? 5.r : 0,
        backgroundColour: _isAllClicked ? kWhite : kTransparent,
        elevation: _isAllClicked ? 2 : 0,
        child: CustomText(
          size: 12.sp,
          colour: _isAllClicked ? kBlack : kInActiveBlack,
          text: "All",
        ),
      ),
    );
  }

  Widget _buildWallet() {
    return SizedBox(
      height: 31.h,
      width: 105.w,
      child: CustomElevatedButton(
        onClick: clickWallet,
        circularBorderRadius: _isWalletClicked ? 5.r : 0,
        elevation: _isWalletClicked ? 2 : 0,
        backgroundColour: _isWalletClicked ? kWhite : kVeryLightPurple,
        child: CustomText(
          size: 12.sp,
          colour: _isWalletClicked ? kBlack : kInActiveBlack,
          text: "Wallet",
        ),
      ),
    );
  }

  Widget _buildServer() {
    return SizedBox(
      height: 31.h,
      width: 105.w,
      child: CustomElevatedButton(
        onClick: clickServer,
        circularBorderRadius: _isServerClicked ? 5.r : 0,
        elevation: _isServerClicked ? 2 : 0,
        backgroundColour: _isServerClicked ? kWhite : kVeryLightPurple,
        child: CustomText(
          size: 12.sp,
          colour: _isServerClicked ? kBlack : kInActiveBlack,
          text: "Server",
        ),
      ),
    );
  }

  getDropdownItem() {
    return _period
        .map(
          (e) => DropdownMenuItem(
            value: e,
            child: CustomText(
              size: 12.sp,
              colour: kBlack,
              text: e,
            ),
          ),
        )
        .toList();
  }

  Widget _dropDownButton({onChanged, border}) {
    return CustomContainer(
      height: 32.h,
      width: 71.62.w,
      border: border,
      child: Center(
        child: DropdownButton(
          items: getDropdownItem(),
          onChanged: onChanged,
          borderRadius: BorderRadius.circular(5.r),
          autofocus: true,
          value: _currentPeriod,
          underline: Container(),
          icon: Icon(Icons.keyboard_arrow_down_sharp, size: 22.sp),
        ),
      ),
    );
  }
}
