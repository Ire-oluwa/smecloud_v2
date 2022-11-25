import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sme_cloud_version2/constants/app_constants.dart';
import 'package:sme_cloud_version2/widgets/custom_container/custom_container.dart';
import 'package:sme_cloud_version2/widgets/custom_elevated_button/custom_elevated_button.dart';
import 'package:sme_cloud_version2/widgets/custom_text/custom_text.dart';
import 'package:sme_cloud_version2/widgets/custom_text_field/custom_text_field.dart';

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
          text: "Add Funds",
          weight: kSemiBold,
        ),
      ),
      body: GestureDetector(
        onTap: kUnfocus,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 26.w),
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
                child: CustomElevatedButton(
                  onClick: () {},
                  circularBorderRadius: 5.r,
                  backgroundColour: kPurpleTheme,
                  child: CustomText(
                    size: 14.sp,
                    colour: kWhite,
                    text: "Confirm",
                    weight: kBold,
                  ),
                ),
              ),
            ],
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
