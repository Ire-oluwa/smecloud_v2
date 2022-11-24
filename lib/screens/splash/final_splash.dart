import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sme_cloud_version2/constants/app_constants.dart';
import 'package:sme_cloud_version2/screens/sign_up/sign_up.dart';
import 'package:sme_cloud_version2/widgets/custom_container/custom_container.dart';
import 'package:sme_cloud_version2/widgets/custom_elevated_button/custom_elevated_button.dart';
import 'package:sme_cloud_version2/widgets/custom_text/custom_text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FinalSplash extends StatefulWidget {
  const FinalSplash({Key? key}) : super(key: key);

  @override
  State<FinalSplash> createState() => _FinalSplashState();
  static const String id = "final splash";
}

class _FinalSplashState extends State<FinalSplash> {
  int currentIndex = 0;
  final carouselImages = [
    Column(
      children: [
        SvgPicture.asset("assets/svg_pictures/man_in_workspace.svg"),
        SvgPicture.asset("assets/svg_texts/first_carousel_title.svg"),
        SvgPicture.asset("assets/svg_texts/first_carousel_headline.svg")
      ],
    ),
    Column(
      children: [
        SvgPicture.asset("assets/svg_pictures/woman_analytics.svg"),
        SvgPicture.asset("assets/svg_texts/second_carousel_title.svg"),
        SvgPicture.asset("assets/svg_texts/second_carousel_headline.svg"),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          child: Padding(
            padding: EdgeInsets.only(left: 43.0.w, top: 31.0.h, right: 43.0.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(SignUp.id);
                      },
                      child: CustomText(
                        text: "Skip",
                        size: 14.sp,
                        colour: kDeeperBlack,
                        weight: kSemiBold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 43.h),
                CarouselSlider.builder(
                  itemCount: carouselImages.length,
                  itemBuilder: (context, index, realIndex) {
                    final image = carouselImages[index];
                    return SizedBox(
                      height: 445.h,
                      child: Column(
                        children: [
                          buildImage(
                            image: image,
                          ),
                        ],
                      ),
                    );
                  },
                  options: CarouselOptions(
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 2),
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    height: 320.0.h,
                    //the space each image should occupy at once i.e 1.0 = 100%
                    viewportFraction: 1.0,
                  ),
                ),
                SizedBox(height: 16.h),
                buildDotIndicator(
                  activeIndex: currentIndex,
                  count: carouselImages.length,
                ),
                SizedBox(height: 22.h),
                SizedBox(
                  height: 33.h,
                  width: 238.w,
                  child: CustomElevatedButton(
                    backgroundColour: kPurpleTheme,
                    onClick: () {
                      Navigator.of(context).pushNamed(SignUp.id);
                    },
                    circularBorderRadius: 10.r,
                    child: CustomText(
                      text: "Get Started",
                      size: 14.sp,
                      colour: kWhite,
                      weight: kSemiBold,
                    ),
                  ),
                ),
                SizedBox(height: 17.h),
                buildTextAndLink(context: context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildImage({
  image,
}) {
  return CustomContainer(
    height: 320.h,
    width: 304.w,
    // colour: Colors.grey,
    margin: EdgeInsets.symmetric(horizontal: 15.w),
    child: image,
  );
}

Widget buildDotIndicator({activeIndex, count}) {
  return AnimatedSmoothIndicator(
    activeIndex: activeIndex,
    count: count,
    effect: ColorTransitionEffect(
      activeDotColor: kPurpleTheme,
      dotWidth: 10.w,
      dotHeight: 9.h,
      radius: 12.r,
    ),
  );
}

Widget buildTextAndLink({context}) {
  return RichText(
    text: TextSpan(
      text: "",
      children: [
        WidgetSpan(
          child: CustomText(
            size: 14.sp,
            colour: kBlack,
            text: "Don't have an account? ",
            weight: kSemiBold,
          ),
        ),
        WidgetSpan(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(SignUp.id);
            },
            child: CustomText(
              size: 14.sp,
              colour: kSubmissionButtonColour,
              text: "Sign Up",
            ),
          ),
        ),
      ],
    ),
  );
}
