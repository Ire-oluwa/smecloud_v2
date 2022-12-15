import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sme_cloud_version2/constants/app_constants.dart';
import 'package:sme_cloud_version2/screens/add_funds/add_funds.dart';
import 'package:sme_cloud_version2/screens/history/history.dart';
import 'package:sme_cloud_version2/screens/notification/notification.dart';
import 'package:sme_cloud_version2/screens/reset_api/reset_api.dart';
import 'package:sme_cloud_version2/screens/vend_data/vend_data.dart';
import 'package:sme_cloud_version2/widgets/custom_container/custom_container.dart';
import 'package:sme_cloud_version2/widgets/custom_text/custom_text.dart';
import 'package:sme_cloud_version2/widgets/portal_balance/portal_balance.dart';
import 'package:sme_cloud_version2/widgets/transaction_balance/transaction_balance.dart';
import 'package:sme_cloud_version2/widgets/wallet_balance/wallet_balance.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  static const String id = "home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int _currentImageIndex = 0;
  late bool isWalletBalanceHidden = true;
  late bool isTransactionBalanceHidden = true;
  late bool isPortalBalanceHidden = true;
  late String _name = "";

  void onWalletBalanceToggled() {
    setState(() {
      isWalletBalanceHidden = !isWalletBalanceHidden;
    });
  }

  void onTransactionBalanceToggled() {
    setState(() {
      isTransactionBalanceHidden = !isTransactionBalanceHidden;
    });
  }

  void onPortalBalanceToggled() {
    setState(() {
      isPortalBalanceHidden = !isPortalBalanceHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    late var carouselImages = [
      WalletBalance(
        isBalanceObscured: isWalletBalanceHidden,
        onIconToggled: onWalletBalanceToggled,
      ),
      TransactionBalance(
          isBalanceObscured: isTransactionBalanceHidden,
          onIconToggled: onTransactionBalanceToggled),
      PortalBalance(
        isBalanceObscured: isPortalBalanceHidden,
        onIconToggled: onPortalBalanceToggled,
      ),
    ];
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 28.h,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 22.5.r,
                        child: Image.asset(
                          "assets/dashboard_svg_images/profile_picture.png",
                        ),
                      ),
                      SizedBox(width: 10.w),
                      //TODO: username
                      FutureBuilder<String>(
                          future: getUsername(),
                          builder: (context, AsyncSnapshot<String> snapshot) {
                            if (snapshot.hasData) {
                              return SizedBox(
                                width: 100.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      size: 16.26.sp,
                                      colour: kDeeperBlack,
                                      text: snapshot.data ?? "Bruce Wayne",
                                      weight: kBold,
                                    ),
                                    CustomText(
                                      size: 13.55.sp,
                                      colour: kBlack,
                                      text: getMoment(),
                                      weight: kNormal,
                                    ),
                                  ],
                                ),
                              );
                            }
                            return CustomText(
                              size: 16.26.sp,
                              colour: kDeeperBlack,
                              text: "Mr. John Doe",
                              weight: kBold,
                            );
                          }),
                      SizedBox(width: 120.w),
                      IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Notifications.id);
                          },
                          icon: FaIcon(FontAwesomeIcons.bell, size: 16.sp)),
                    ],
                  ),
                  SizedBox(height: 15.97.h),
                  Column(
                    children: [
                      CarouselSlider.builder(
                        itemCount: carouselImages.length,
                        itemBuilder: (context, index, realIndex) {
                          final image = carouselImages[index];
                          return SizedBox(
                            child: image,
                          );
                        },
                        options: CarouselOptions(
                            onPageChanged: (index, reason) {
                              setState(() {
                                _currentImageIndex = index;
                              });
                            },
                            viewportFraction: 1.0,
                            height: 100.h),
                      ),
                      SizedBox(height: 16.h),
                      _buildDotIndicator(
                        count: carouselImages.length,
                        activeIndex: _currentImageIndex,
                      ),
                    ],
                  ),
                  SizedBox(height: 18.h),
                  Row(
                    children: [
                      _buildQuickOptions(
                        text: "Add Funds",
                        backgroundColour: const Color(0xFFC6C2F9),
                        imagePath: "assets/dashboard_svg_images/add_funds.svg",
                        onTap: () {
                          Navigator.of(context).pushNamed(AddFunds.id);
                        },
                      ),
                      SizedBox(width: 12.w),
                      _buildQuickOptions(
                        text: "Vend Data",
                        backgroundColour: const Color(0xFFFFC3C3),
                        imagePath: "assets/dashboard_svg_images/vend_data.svg",
                        onTap: () {
                          Navigator.of(context).pushNamed(VendData.id);
                        },
                      ),
                      SizedBox(width: 12.w),
                      _buildQuickOptions(
                        text: "Reset API Key",
                        backgroundColour: const Color(0xFFC7C6D8),
                        imagePath: "assets/dashboard_svg_images/api_key.svg",
                        onTap: () {
                          Navigator.of(context).pushNamed(ResetApiKey.id);
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 7.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        size: 14.sp,
                        colour: kBlack,
                        text: "Transactions",
                        weight: kSemiBold,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, History.id);
                        },
                        child: CustomText(
                          size: 12.sp,
                          colour: kPurpleTheme,
                          text: "See All",
                          weight: kSemiBold,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 2.h),
                  CustomContainer(
                    width: 363.w,
                    height: 380.h,
                    borderRadius: BorderRadius.circular(10.r),
                    colour: kWhite,
                    child: ListView.builder(
                      itemCount: 6,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 1.h,
                          ),
                          child: ListTile(
                            enabled: false,
                            leading: CircleAvatar(
                              radius: 20.r,
                              backgroundColor: kWhite,
                              child: Image.asset(
                                "assets/dashboard_svg_images/profile_picture.png",
                              ),
                            ),
                            title: CustomText(
                              size: 12.sp,
                              colour: kBlack,
                              text: "Ibukun Adekunle",
                              weight: kSemiBold,
                            ),
                            subtitle: CustomText(
                              size: 10.sp,
                              colour: kDimBlack,
                              text: "SME Activation",
                              weight: kMedium,
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
                                  colour: kDimBlack,
                                  text: "13 DEC 2022",
                                  weight: kMedium,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
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

  Future<String> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    _name = prefs.getString("username") ?? "";
    return _name;
  }

  getMoment() {
    if (DateTime.now().hour < 12) {
      return "Good Morning";
    } else if (DateTime.now().hour == 12) {
      return "What's good?";
    } else if (DateTime.now().hour > 12 && DateTime.now().hour < 16) {
      return "Good Afternoon";
    } else if (DateTime.now().hour > 16) {
      return "Good Evening";
    }
  }

  Widget _buildQuickOptions({
    imagePath,
    text,
    backgroundColour,
    onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: CustomContainer(
        width: 101.w,
        height: 97.h,
        colour: backgroundColour,
        borderRadius: BorderRadius.circular(8.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(imagePath),
            SizedBox(height: 4.h),
            CustomText(
              size: 12.sp,
              colour: kBlack,
              text: text,
              weight: kNormal,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDotIndicator({activeIndex, count}) {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: count,
      effect: ColorTransitionEffect(
        activeDotColor: kPurpleTheme,
        dotWidth: 20.w,
        dotHeight: 5.h,
        radius: 12.r,
      ),
    );
  }
}
