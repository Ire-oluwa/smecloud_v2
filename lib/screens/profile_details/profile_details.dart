import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sme_cloud_version2/constants/app_constants.dart';
import 'package:sme_cloud_version2/providers/profile_detail_provider/profile_detail_provider.dart';
import 'package:sme_cloud_version2/widgets/custom_elevated_button/custom_elevated_button.dart';
import 'package:sme_cloud_version2/widgets/custom_text/custom_text.dart';
import 'package:sme_cloud_version2/widgets/custom_text_field/custom_text_field.dart';

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({Key? key}) : super(key: key);
  static const String id = "profile details";

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  late String _fullName = "";
  late String _emailAddress = "";
  late String _userName = "";
  late String _phoneNumber = "";
  late bool _isEnabled = false;

  @override
  void initState() {
    _isEnabled = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.read<ProfileDetailProvider>();
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: kUnfocus,
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 27.h),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back_ios, size: 20.sp),
                        ),
                        SizedBox(width: 40.w),
                        CustomText(
                          size: 16.sp,
                          colour: kBlack,
                          text: "Profile Details",
                          weight: kSemiBold,
                        ),
                      ],
                    ),
                    SizedBox(height: 66.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          size: 12.sp,
                          colour: kBlack,
                          text: "Name",
                          weight: kMedium,
                        ),
                        SizedBox(height: 3.h),
                        FutureBuilder<String>(
                          future: getFullName(),
                          builder: (context, AsyncSnapshot<String> snapshot) {
                            if (snapshot.hasData) {
                              provider.fullName.text = snapshot.data ?? "";
                              return CustomTextField(
                                controller: provider.fullName,
                                keyboardType: kNameInputType,
                                formatter: kFormatName,
                                inputAction: kInputActionNext,
                                hint: "",
                                enabled: _isEnabled,
                              );
                            }
                            return CustomTextField(
                              controller: provider.fullName,
                              keyboardType: kNameInputType,
                              formatter: kFormatName,
                              inputAction: kInputActionNext,
                              hint: "",
                              enabled: _isEnabled,
                            );
                          },
                        ),
                        SizedBox(height: 22.h),
                        CustomText(
                          size: 12.sp,
                          colour: kBlack,
                          text: "Email Address",
                          weight: kMedium,
                        ),
                        SizedBox(height: 3.h),
                        FutureBuilder<String>(
                          future: getEmailAddress(),
                          builder: (context, AsyncSnapshot<String> snapshot) {
                            if (snapshot.hasData) {
                              provider.emailAddress.text = snapshot.data ?? "";
                              return CustomTextField(
                                controller: provider.emailAddress,
                                keyboardType: kEmailInputType,
                                formatter: kFormatEmailAddress,
                                inputAction: kInputActionNext,
                                hint: "",
                                enabled: _isEnabled,
                              );
                            }
                            return CustomTextField(
                              controller: provider.emailAddress,
                              keyboardType: kNameInputType,
                              formatter: kFormatName,
                              inputAction: kInputActionNext,
                              hint: "",
                              enabled: _isEnabled,
                            );
                          },
                        ),
                        SizedBox(height: 22.h),
                        CustomText(
                          size: 12.sp,
                          colour: kBlack,
                          text: "Username",
                          weight: kMedium,
                        ),
                        SizedBox(height: 3.h),
                        FutureBuilder<String>(
                          future: getUsername(),
                          builder: (context, AsyncSnapshot<String> snapshot) {
                            if (snapshot.hasData) {
                              provider.username.text = snapshot.data ?? "";
                              return CustomTextField(
                                controller: provider.username,
                                keyboardType: kNameInputType,
                                formatter: kFormatName,
                                inputAction: kInputActionNext,
                                hint: "",
                                enabled: _isEnabled,
                              );
                            }
                            return CustomTextField(
                              controller: provider.username,
                              keyboardType: kNameInputType,
                              formatter: kFormatName,
                              inputAction: kInputActionNext,
                              hint: "",
                              enabled: _isEnabled,
                            );
                          },
                        ),
                        SizedBox(height: 22.h),
                        CustomText(
                          size: 12.sp,
                          colour: kBlack,
                          text: "Phone Number",
                          weight: kMedium,
                        ),
                        SizedBox(height: 3.h),
                        FutureBuilder<String>(
                          future: getPhoneNumber(),
                          builder: (context, AsyncSnapshot<String> snapshot) {
                            if (snapshot.hasData) {
                              provider.phoneNumber.text = snapshot.data ?? "";
                              return CustomTextField(
                                controller: provider.phoneNumber,
                                keyboardType: kNumberInputType,
                                formatter: kFormatPhoneNumber,
                                inputAction: kInputActionNext,
                                hint: "",
                                enabled: _isEnabled,
                              );
                            }
                            return CustomTextField(
                              controller: provider.phoneNumber,
                              keyboardType: kNumberInputType,
                              formatter: kFormatPhoneNumber,
                              inputAction: kInputActionNext,
                              hint: "",
                              enabled: _isEnabled,
                            );
                          },
                        ),
                        SizedBox(height: 30.h),
                        _isEnabled
                            ? SizedBox(
                                height: 47.h,
                                width: 339.w,
                                child: CustomElevatedButton(
                                  onClick: () async {
                                    await saveNewFullName();
                                    await saveNewEmailAddress();
                                    await saveNewUserName();
                                    await saveNewPhoneNumber();
                                    if (!mounted) return;
                                    setState(() {
                                      _isEnabled = !_isEnabled;
                                    });
                                  },
                                  circularBorderRadius: 6.r,
                                  backgroundColour: kPurpleTheme,
                                  child: CustomText(
                                    size: 14.sp,
                                    colour: kWhite,
                                    text: "Save Changes",
                                    weight: kBold,
                                  ),
                                ),
                              )
                            : SizedBox(
                                height: 47.h,
                                width: 339.w,
                                child: CustomElevatedButton(
                                  onClick: () {
                                    setState(() {
                                      _isEnabled = !_isEnabled;
                                    });
                                  },
                                  circularBorderRadius: 6.r,
                                  backgroundColour: const Color(0xBF913BD5),
                                  child: CustomText(
                                    size: 14.sp,
                                    colour: kWhite,
                                    text: "Edit",
                                    weight: kBold,
                                  ),
                                ),
                              ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<String> getFullName() async {
    final preferences = await SharedPreferences.getInstance();
    _fullName = preferences.getString("fullName") ?? "";
    return _fullName;
  }

  Future<String> getEmailAddress() async {
    final preferences = await SharedPreferences.getInstance();
    _emailAddress = preferences.getString("email") ?? "";
    return _emailAddress;
  }

  Future<String> getUsername() async {
    final preferences = await SharedPreferences.getInstance();
    _userName = preferences.getString("username") ?? "";
    return _userName;
  }

  Future<String> getPhoneNumber() async {
    final preferences = await SharedPreferences.getInstance();
    _phoneNumber = preferences.getString("phoneNumber") ?? "";
    return _phoneNumber;
  }

  saveNewFullName() async {
    final newFullName = await SharedPreferences.getInstance();
    if (!mounted) return;
    newFullName.setString(
      "fullName",
      context.read<ProfileDetailProvider>().fullName.text,
    );
  }

  saveNewEmailAddress() async {
    final newEmailAddress = await SharedPreferences.getInstance();
    if (!mounted) return;
    newEmailAddress.setString(
      "email",
      context.read<ProfileDetailProvider>().emailAddress.text,
    );
  }

  saveNewUserName() async {
    final newUsername = await SharedPreferences.getInstance();
    if (!mounted) return;
    newUsername.setString(
      "username",
      context.read<ProfileDetailProvider>().username.text,
    );
  }

  saveNewPhoneNumber() async {
    final newPhoneNumber = await SharedPreferences.getInstance();
    if (!mounted) return;
    newPhoneNumber.setString(
      "phoneNumber",
      context.read<ProfileDetailProvider>().phoneNumber.text,
    );
  }
}
