import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sme_cloud_version2/constants/app_constants.dart';
import 'package:sme_cloud_version2/widgets/custom_container/custom_container.dart';
import 'package:sme_cloud_version2/widgets/custom_text/custom_text.dart';

class FAQ extends StatefulWidget {
  const FAQ({Key? key}) : super(key: key);
  static const String id = "faq";

  @override
  State<FAQ> createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  bool isQuestion1Clicked = false;
  bool isQuestion2Clicked = false;
  bool isQuestion3Clicked = false;
  bool isQuestion4Clicked = false;
  bool isQuestion5Clicked = false;

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
            size: 20.sp,
            color: kBlack,
          ),
        ),
        backgroundColor: kWhite,
        elevation: 0,
        title: CustomText(
          size: 16.sp,
          colour: kBlack,
          text: "FAQ",
          weight: kSemiBold,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15.w,
              vertical: 30.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //TODO: if isClicked is true, in a column, display question and  answer
                isQuestion1Clicked
                    ? Container(
                        height: 80,
                        color: kWhite,
                        padding: EdgeInsets.only(left: 8.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [question1(), answer1()],
                        ),
                      )
                    : question1(),
                SizedBox(height: 5.h),
                isQuestion2Clicked
                    ? Container(
                        height: 85,
                        color: kWhite,
                        padding: EdgeInsets.only(left: 8.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [question2(), answer2()],
                        ),
                      )
                    : question2(),
                SizedBox(height: 5.h),
                isQuestion3Clicked
                    ? Container(
                        height: 80,
                        color: kWhite,
                        padding: EdgeInsets.only(left: 8.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [question3(), answer3()],
                        ),
                      )
                    : question3(),
                SizedBox(height: 5.h),
                isQuestion4Clicked
                    ? Container(
                        height: 85,
                        color: kWhite,
                        padding: EdgeInsets.only(left: 8.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [question4(), answer4()],
                        ),
                      )
                    : question4(),
                SizedBox(height: 5.h),
                isQuestion5Clicked
                    ? Container(
                        height: 110,
                        color: kWhite,
                        padding: EdgeInsets.only(left: 8.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [question5(), answer5()],
                        ),
                      )
                    : question5(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  onQuestion1Clicked() {
    setState(() {
      isQuestion1Clicked = !isQuestion1Clicked;
    });
  }

  onQuestion2Clicked() {
    setState(() {
      isQuestion2Clicked = !isQuestion2Clicked;
    });
  }

  onQuestion3Clicked() {
    setState(() {
      isQuestion3Clicked = !isQuestion3Clicked;
    });
  }

  onQuestion4Clicked() {
    setState(() {
      isQuestion4Clicked = !isQuestion4Clicked;
    });
  }

  onQuestion5Clicked() {
    setState(() {
      isQuestion5Clicked = !isQuestion5Clicked;
    });
  }

  Widget question1() {
    return GestureDetector(
      onTap: onQuestion1Clicked,
      child: CustomContainer(
        width: 360.w,
        height: 39.h,
        colour: kWhite,
        borderRadius: BorderRadius.circular(6.r),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              size: 12.sp,
              colour: isQuestion1Clicked ? kPurpleTheme : kBlack,
              text: "When can I sign up?",
              weight: kSemiBold,
            ),
            CircleAvatar(
              backgroundColor: kPurpleTheme,
              radius: 7.r,
              child: Icon(
                Icons.add,
                color: kWhite,
                size: 10.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget question2() {
    return SizedBox(
      height: 39.h,
      child: GestureDetector(
        onTap: onQuestion2Clicked,
        child: CustomContainer(
          width: 360.w,
          height: 39.h,
          colour: kWhite,
          borderRadius: BorderRadius.circular(6.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                size: 12.sp,
                colour: isQuestion2Clicked ? kPurpleTheme : kBlack,
                text: "How many devices will I need?",
                weight: kSemiBold,
              ),
              CircleAvatar(
                backgroundColor: kPurpleTheme,
                radius: 7.r,
                child: Icon(
                  Icons.add,
                  color: kWhite,
                  size: 10.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget question3() {
    return SizedBox(
      height: 39.h,
      child: GestureDetector(
        onTap: onQuestion3Clicked,
        child: CustomContainer(
          width: 360.w,
          height: 39.h,
          colour: kWhite,
          borderRadius: BorderRadius.circular(6.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                size: 12.sp,
                colour: isQuestion3Clicked ? kPurpleTheme : kBlack,
                text: "Can I recharge on the platform?",
                weight: kSemiBold,
              ),
              CircleAvatar(
                backgroundColor: kPurpleTheme,
                radius: 7.r,
                child: Icon(
                  Icons.add,
                  color: kWhite,
                  size: 10.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget question4() {
    return SizedBox(
      height: 39.h,
      child: GestureDetector(
        onTap: onQuestion4Clicked,
        child: CustomContainer(
          width: 360.w,
          height: 39.h,
          colour: kWhite,
          borderRadius: BorderRadius.circular(6.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                size: 12.sp,
                colour: isQuestion4Clicked ? kPurpleTheme : kBlack,
                text: "How do I see my transactions?",
                weight: kSemiBold,
              ),
              CircleAvatar(
                backgroundColor: kPurpleTheme,
                radius: 7.r,
                child: Icon(
                  Icons.add,
                  color: kWhite,
                  size: 10.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget question5() {
    return SizedBox(
      height: 39.h,
      child: GestureDetector(
        onTap: onQuestion5Clicked,
        child: CustomContainer(
          width: 360.w,
          height: 39.h,
          colour: kWhite,
          borderRadius: BorderRadius.circular(6.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomText(
                  size: 12.sp,
                  colour: isQuestion5Clicked ? kPurpleTheme : kBlack,
                  text:
                      "If I refund a customer for a failed order, how can I terminate it so it won't reprocess with other pending ones?",
                  weight: kSemiBold,
                ),
              ),
              CircleAvatar(
                backgroundColor: kPurpleTheme,
                radius: 7.r,
                child: Icon(
                  Icons.add,
                  color: kWhite,
                  size: 10.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget answer1() {
    return SizedBox(
      height: 29.h,
      child: CustomText(
        size: 14.sp,
        colour: kBlack,
        text: "You can sign up as soon as possible.",
        weight: kBold,
      ),
    );
  }

  Widget answer2() {
    return SizedBox(
      height: 29.h,
      child: CustomText(
        size: 14.sp,
        colour: kBlack,
        text:
            "Depends on your transaction range but you may need more than one device.",
        weight: kBold,
      ),
    );
  }

  Widget answer3() {
    return SizedBox(
      height: 29.h,
      child: CustomText(
        size: 14.sp,
        colour: kBlack,
        text: "Yes, you can do both airtime and data on SMECLOUD",
        weight: kBold,
      ),
    );
  }

  Widget answer4() {
    return SizedBox(
      height: 29.h,
      child: CustomText(
        size: 14.sp,
        colour: kBlack,
        text: "All transactions are recorded under Transactions history",
        weight: kBold,
      ),
    );
  }

  Widget answer5() {
    return CustomText(
      size: 14.sp,
      colour: kBlack,
      text:
          "Follow the process  below\n1.Delete on the app\n2. Terminate on smecloud",
      weight: kBold,
    );
  }
}
