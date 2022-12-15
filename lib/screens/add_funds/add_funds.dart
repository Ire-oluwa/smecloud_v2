import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sme_cloud_version2/constants/app_constants.dart';
import 'package:sme_cloud_version2/providers/add_funds_transaction_pin_provider/add_funds_transaction_pin_provider.dart';
import 'package:sme_cloud_version2/widgets/custom_container/custom_container.dart';
import 'package:sme_cloud_version2/widgets/custom_elevated_button/custom_elevated_button.dart';
import 'package:sme_cloud_version2/widgets/custom_text/custom_text.dart';
import 'package:sme_cloud_version2/widgets/custom_text_field/custom_text_field.dart';
import 'package:sme_cloud_version2/widgets/otp_input/otp_input.dart';

class AddFunds extends StatefulWidget {
  const AddFunds({Key? key}) : super(key: key);
  static const String id = "add funds";

  @override
  State<AddFunds> createState() => _AddFundsState();
}

class _AddFundsState extends State<AddFunds> {
  final amount = TextEditingController();
  final _items = ["Bank Transfer", "B", "C"];
  late String _currentItem = _items.first;

  @override
  Widget build(BuildContext context) {
    final pinProvider = context.read<AddFundsTransactionPinProvider>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhite,
        elevation: 0,
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
        title: CustomText(
          size: 18.sp,
          colour: kBlack,
          text: "Add Funds",
          weight: kSemiBold,
        ),
      ),
      body: GestureDetector(
        onTap: kUnfocus,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 26.w),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 34.h),
                CustomText(
                  size: 12.sp,
                  colour: kBlack,
                  text: "Outstanding Bill",
                  weight: kMedium,
                ),
                SizedBox(height: 5.h),
                CustomContainer(
                  width: 339.w,
                  height: 44.h,
                  colour: kVeryLightPurple,
                  padding: EdgeInsets.only(left: 8.w),
                  borderRadius: BorderRadius.circular(5.r),
                  child: FutureBuilder(
                      // future: ,
                      builder: (context, snapshot) {
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: CustomText(
                        size: 12.sp,
                        colour: const Color(0xFF929191),
                        text: "0.00",
                        weight: kMedium,
                      ),
                    );
                  }),
                ),
                SizedBox(height: 20.h),
                CustomText(
                  size: 12.sp,
                  colour: kBlack,
                  text: "Amount",
                  weight: kMedium,
                ),
                SizedBox(height: 5.h),
                SizedBox(
                  height: 44.h,
                  width: 339.w,
                  child: CustomTextField(
                    controller: amount,
                    keyboardType: kNumberInputType,
                    formatter: kFormatPhoneNumber,
                    inputAction: kInputActionNext,
                    hint: "000000",
                  ),
                ),
                SizedBox(height: 20.h),
                CustomText(
                  size: 12.sp,
                  colour: kBlack,
                  text: "Payment Method",
                  weight: kMedium,
                ),
                SizedBox(height: 5.h),
                //TODO: dropdown
                CustomContainer(
                  height: 44.h,
                  width: 339.w,
                  borderRadius: BorderRadius.circular(5.r),
                  colour: const Color(0xFFF2F2F2),
                  padding: EdgeInsets.only(left: 18.w, right: 8.w),
                  child: DropdownButton(
                      borderRadius: BorderRadius.circular(5.r),
                      autofocus: true,
                      value: _currentItem,
                      isExpanded: true,
                      underline: Container(),
                      items: getDropDownItem(),
                      onChanged: (currentItem) {
                        setState(() {
                          _currentItem = currentItem!;
                        });
                      }),
                ),
                SizedBox(height: 37.h),
                SizedBox(
                  height: 47.h,
                  width: 339.w,
                  child: Builder(builder: (context) {
                    return CustomElevatedButton(
                      onClick: () {
                        // _scaffoldKey.currentState;
                        showBottomSheet(
                          enableDrag: false,
                          context: context,
                          elevation: 7.h,
                          builder: (context) {
                            return GestureDetector(
                              onTap: kUnfocus,
                              child: SizedBox(
                                height: 164.h,
                                width: 390.w,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 20.w,
                                        top: 18.h,
                                      ),
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: CircleAvatar(
                                              backgroundColor: kBlack,
                                              radius: 9.r,
                                              child: Icon(
                                                Icons.close,
                                                size: 16.sp,
                                                color: kWhite,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    CustomText(
                                      size: 14.sp,
                                      colour: kBlack,
                                      text: "Enter Transaction Pin",
                                      weight: kSemiBold,
                                    ),
                                    SizedBox(height: 19.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        OTPInput(
                                          controller: pinProvider.firstDigit,
                                        ),
                                        SizedBox(width: 10.w),
                                        OTPInput(
                                          controller: pinProvider.secondDigit,
                                        ),
                                        SizedBox(width: 10.w),
                                        OTPInput(
                                          controller: pinProvider.thirdDigit,
                                        ),
                                        SizedBox(width: 10.w),
                                        Flexible(
                                          child: OTPInput(
                                            controller: pinProvider.fourthDigit,
                                          ),
                                        ),
                                        //
                                      ],
                                    ),
                                    SizedBox(height: 19.h),
                                    GestureDetector(
                                      onTap: () {},
                                      child: CustomText(
                                        size: 12.sp,
                                        colour: kPurpleTheme,
                                        text: "Forgot Transaction Pin?",
                                        weight: kSemiBold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      circularBorderRadius: 5.r,
                      backgroundColour: kPurpleTheme,
                      child: CustomText(
                        size: 14.sp,
                        colour: kWhite,
                        text: "Confirm",
                        weight: kBold,
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  getDropDownItem() {
    return _items
        .map((e) => DropdownMenuItem(
            value: e, child: CustomText(size: 12.sp, colour: kBlack, text: e)))
        .toList();
  }
}

// RoundedRectangleBorder(
// borderRadius: BorderRadius.only(
// topLeft: Radius.circular(5.r),
// topRight: Radius.circular(5.r),
// ),
// ),
