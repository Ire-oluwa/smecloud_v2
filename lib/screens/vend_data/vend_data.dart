import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sme_cloud_version2/constants/app_constants.dart';
import 'package:sme_cloud_version2/widgets/custom_elevated_button/custom_elevated_button.dart';
import 'package:sme_cloud_version2/widgets/custom_text/custom_text.dart';
import 'package:sme_cloud_version2/widgets/custom_text_field/custom_text_field.dart';

class VendData extends StatefulWidget {
  const VendData({Key? key}) : super(key: key);
  static const String id = "vend data";

  @override
  State<VendData> createState() => _VendDataState();
}

class _VendDataState extends State<VendData> {
  @override
  void initState() {
    getPhoneData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: kBlack),
        ),
        backgroundColor: kWhite,
        elevation: 0,
        title: CustomText(
          size: 16.sp,
          colour: kBlack,
          text: "Vend Data",
          weight: kSemiBold,
        ),
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: InkWell(
          onTap: kUnfocus,
          child: Padding(
            padding: EdgeInsets.only(left: 24.w, right: 33.w, top: 51.h),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    size: 14.sp,
                    colour: const Color(0xFF22347F),
                    text: "Phone number",
                    weight: kSemiBold,
                  ),
                  SizedBox(height: 5.h),
                  SizedBox(
                    // height: 48.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 240.w,
                          child: CustomTextField(
                            controller: _phoneNumber,
                            keyboardType: kNumberInputType,
                            formatter: kFormatPhoneNumber,
                            inputAction: kInputActionNext,
                            hint: "",
                          ),
                        ),
                        // SizedBox(width: 9.w),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              displayContacts();
                              // print(_contacts?.first.phones.elementAt(0).number);
                            },
                            child: SvgPicture.asset(
                              "assets/dashboard_svg_images/vend_data_contact.svg",
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildImage(
                        onClick: () {},
                        pictureLocation: "assets/dashboard_svg_images/mtn.png",
                      ),
                      _buildImage(
                        onClick: () {},
                        pictureLocation: "assets/dashboard_svg_images/glo.png",
                      ),
                      _buildImage(
                        onClick: () {},
                        pictureLocation:
                            "assets/dashboard_svg_images/airtel.png",
                      ),
                      _buildImage(
                        onClick: () {},
                        pictureLocation:
                            "assets/dashboard_svg_images/etisalat.png",
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  CustomText(
                    size: 14.sp,
                    colour: kBlack,
                    text: "Data Amount",
                    weight: kSemiBold,
                  ),
                  SizedBox(height: 5.h),
                  CustomTextField(
                    controller: _dataAmount,
                    keyboardType: kNumberInputType,
                    formatter: kFormatPhoneNumber,
                    inputAction: kInputActionNext,
                    hint: "",
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Switch.adaptive(
                        activeColor: kPurpleTheme,
                        value: _isSwitched,
                        onChanged: (newValue) {
                          setState(() {
                            _isSwitched = newValue;
                          });
                        },
                      ),
                      SizedBox(height: 10.h),
                      CustomText(
                        size: 12.sp,
                        colour: const Color(0xFFBA68C8),
                        text: "Save Beneficiary?",
                        weight: kNormal,
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    height: 47.h,
                    width: 339.w,
                    child: CustomElevatedButton(
                      onClick: () {
                        kUnfocus;
                        Future.delayed(const Duration(seconds: 1))
                            .then((value) => showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      scrollable: true,
                                      insetPadding: EdgeInsets.only(
                                        top: 150.h,
                                        bottom: 150.h,
                                        left: 20.w,
                                        right: 20.w,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25.r),
                                      ),
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomText(
                                            size: 13.sp,
                                            colour: const Color(0xFF605A5A),
                                            text: "Data",
                                            weight: kSemiBold,
                                          ),
                                          CustomText(
                                            size: 14.sp,
                                            colour: const Color(0xFF28C0F1),
                                            text: _dataAmount.text.trim(),
                                            weight: kSemiBold,
                                          ),
                                        ],
                                      ),
                                      content: Column(
                                        children: [
                                          CustomText(
                                            size: 24.sp,
                                            colour: const Color(0xFF309B15),
                                            text: "Successful",
                                            weight: kBold,
                                          ),
                                          SizedBox(height: 19.h),
                                          _buildPopUpDetails(
                                            name: "Movement",
                                            value: "MTN Data",
                                            valueWeight: kSemiBold,
                                          ),
                                          SizedBox(height: 18.h),
                                          _buildPopUpDetails(
                                            name: "Transaction type",
                                            value: "Successful",
                                            valueWeight: kSemiBold,
                                          ),
                                          SizedBox(height: 18.h),
                                          _buildPopUpDetails(
                                            name: "Date",
                                            value: _presentDate,
                                            valueWeight: kSemiBold,
                                          ),
                                          SizedBox(height: 18.h),
                                          _buildPopUpDetails(
                                            name: "Time",
                                            value: _presentTime,
                                            valueWeight: kSemiBold,
                                          ),
                                          SizedBox(height: 40.h),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              CustomText(
                                                size: 14.sp,
                                                colour: const Color(0xFF28C0F1),
                                                text: "Transaction ID",
                                                weight: kNormal,
                                              ),
                                              CustomText(
                                                size: 14.sp,
                                                colour: const Color(0xFF605A5A),
                                                text: "1332920",
                                                weight: kBold,
                                              ),
                                            ],
                                          ),
                                          // SizedBox(height: 20.h),
                                        ],
                                      ),
                                      actions: [
                                        SizedBox(
                                          height: 47.h,
                                          width: 339.w,
                                          child: CustomElevatedButton(
                                            onClick: () {
                                              Navigator.pop(context);
                                            },
                                            circularBorderRadius: 5.r,
                                            backgroundColour: kButtonBlue,
                                            child: CustomText(
                                              size: 14.sp,
                                              colour: kWhite,
                                              text: "Done",
                                              weight: kBold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ));
                      },
                      circularBorderRadius: 6.r,
                      backgroundColour: kPurpleTheme,
                      child: CustomText(
                        size: 14.sp,
                        colour: kWhite,
                        text: "Vend Data",
                        weight: kBold,
                      ),
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

  List<Contact>? _contacts;

  displayContacts() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return (_contacts?.length == null)
            ? SizedBox(
                height: 200.h,
                child: Center(
                  child: CircularProgressIndicator(
                    color: kPurpleTheme,
                    strokeWidth: 2.w,
                  ),
                ),
              )
            : ListView.builder(
                itemCount: _contacts?.length,
                itemBuilder: (context, index) {
                  Uint8List? image = _contacts?[index].photo;
                  return ListTile(
                    leading: (_contacts![index].photo == null)
                        ? const Icon(Icons.person)
                        : CircleAvatar(
                            backgroundColor: kPurpleTheme,
                            backgroundImage: MemoryImage(image!),
                          ),
                    title: CustomText(
                      size: 14.sp,
                      colour: kBlack,
                      text:
                          ("${_contacts?[index].name.first} ${_contacts?[index].name.last}") ??
                              "Anonymous",
                      weight: kSemiBold,
                    ),
                    subtitle: CustomText(
                      size: 12.sp,
                      colour: kBlack,
                      text: (_contacts![index].phones.isNotEmpty)
                          ? (_contacts![index].phones.first.number)
                          : "---- --- ----",
                      weight: kNormal,
                    ),
                    onTap: () {
                      print(_contacts?.length);
                      setState(() {
                        _phoneNumber.text =
                            _contacts?[index].phones.first.number ?? "";
                      });
                    },
                  );
                },
              );
      },
    );
  }

  void getPhoneData() async {
    if (await FlutterContacts.requestPermission()) {
      _contacts = await FlutterContacts.getContacts(
        withProperties: true,
        withPhoto: true,
      );
      setState(() {});
    }
  }

  //time and date must be obtained from backend.
  final _presentDate = DateTime.now().toIso8601String().substring(0, 10);

  final _presentTime = "${DateTime.now().hour}:${DateTime.now().minute}";

  final _phoneNumber = TextEditingController();

  final _dataAmount = TextEditingController();

  bool _isSwitched = false;

  Widget _buildImage({onClick, pictureLocation}) {
    return GestureDetector(onTap: onClick, child: Image.asset(pictureLocation));
  }

  Widget _buildPopUpDetails({name, value, valueWeight}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          size: 13.sp,
          colour: const Color(0xFF605A5A),
          text: name,
          weight: kSemiBold,
        ),
        CustomText(
          size: 13.sp,
          colour: const Color(0xFF605A5A),
          text: value,
          weight: valueWeight,
        ),
      ],
    );
  }
}
