import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sme_cloud_version2/constants/app_constants.dart';
import 'package:sme_cloud_version2/widgets/custom_container/custom_container.dart';
import 'package:sme_cloud_version2/widgets/custom_elevated_button/custom_elevated_button.dart';
import 'package:sme_cloud_version2/widgets/custom_text/custom_text.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);
  static const String id = "history";

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  bool isAllClicked = true;
  bool isWalletClicked = false;
  bool isServerClicked = false;

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
          text: "History",
          weight: kSemiBold,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0.w),
          child: Column(
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
              SizedBox(height: 18.h),
              FutureBuilder(
                // future:,
                builder: (context, snapshot) {
                  return isAllClicked
                      ? _buildList()
                      : isWalletClicked
                          ? _buildList()
                          : _buildList();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  clickAll() {
    setState(() {
      isAllClicked = true;
      isWalletClicked = false;
      isServerClicked = false;
    });
  }

  clickWallet() {
    setState(() {
      isAllClicked = false;
      isWalletClicked = true;
      isServerClicked = false;
    });
  }

  clickServer() {
    setState(() {
      isAllClicked = false;
      isWalletClicked = false;
      isServerClicked = true;
    });
  }

  Widget _buildAll() {
    return SizedBox(
      height: 31.h,
      width: 105.w,
      child: CustomElevatedButton(
        onClick: clickAll,
        circularBorderRadius: isAllClicked ? 5.r : 0,
        backgroundColour: isAllClicked ? kWhite : kTransparent,
        elevation: isAllClicked ? 2 : 0,
        child: CustomText(
          size: 12.sp,
          colour: isAllClicked ? kBlack : kInActiveBlack,
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
        circularBorderRadius: isWalletClicked ? 5.r : 0,
        elevation: isWalletClicked ? 2 : 0,
        backgroundColour: isWalletClicked ? kWhite : kVeryLightPurple,
        child: CustomText(
          size: 12.sp,
          colour: isWalletClicked ? kBlack : kInActiveBlack,
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
        circularBorderRadius: isServerClicked ? 5.r : 0,
        elevation: isServerClicked ? 2 : 0,
        backgroundColour: isServerClicked ? kWhite : kVeryLightPurple,
        child: CustomText(
          size: 12.sp,
          colour: isServerClicked ? kBlack : kInActiveBlack,
          text: "Server",
        ),
      ),
    );
  }

  Widget _buildList() {
    return CustomContainer(
      width: 363.w,
      height: MediaQuery.of(context).size.height,
      borderRadius: BorderRadius.circular(8.r),
      child: ListView.builder(
        shrinkWrap: true,
        //TODO: change item count
        itemCount: 20,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: kDimBlack,
              radius: 17.r,
            ),
            title: CustomText(
              size: 12.sp,
              colour: kBlack,
              text: "David Dagboru",
              weight: kSemiBold,
            ),
            subtitle: CustomText(
              size: 10.sp,
              colour: kBlack,
              text: "SME Activation",
              weight: kNormal,
            ),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  size: 12.sp,
                  colour: kBlack,
                  text: "30GB",
                  weight: kSemiBold,
                ),
                CustomText(
                  size: 10.sp,
                  colour: kBlack,
                  text: "13 OCT 2022",
                  weight: kNormal,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
