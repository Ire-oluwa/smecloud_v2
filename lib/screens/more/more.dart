import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sme_cloud_version2/constants/app_constants.dart';
import 'package:sme_cloud_version2/screens/help_and_support/help_and_support.dart';
import 'package:sme_cloud_version2/screens/reset_api/reset_api.dart';
import 'package:sme_cloud_version2/widgets/custom_text/custom_text.dart';

class More extends StatefulWidget {
  const More({Key? key}) : super(key: key);
  static const String id = "more";

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  String name = "";
  String email = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 29.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      // Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 24.sp,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: FaIcon(
                      FontAwesomeIcons.bell,
                      size: 22.sp,
                    ),
                  ),
                ],
              ),
              CircleAvatar(
                radius: 35.r,
                backgroundColor: kDimBlack,
              ),
              SizedBox(height: 13.h),
              futureBuilder(
                future: getFullName(),
                textColour: kBlack,
                textSize: 18.sp,
                textWeight: kBold,
              ),
              SizedBox(height: 3.h),
              futureBuilder(
                future: getUserEmail(),
                textWeight: kMedium,
                textSize: 14.sp,
                textColour: kBlack,
              ),
              SizedBox(height: 45.h),
              buildTile(
                title: "User Information",
                subtitle: "Manage your profile",
                onClick: () {},
              ),
              SizedBox(height: 14.h),
              buildTile(
                  title: "Reset API Key",
                  subtitle: "Change or check your API Key",
                  onClick: () {
                    Navigator.of(context).pushNamed(ResetApiKey.id);
                  }),
              SizedBox(height: 14.h),
              buildTile(
                title: "Change Password",
                subtitle: "Update your password",
                onClick: () {},
              ),
              SizedBox(height: 14.h),
              buildTile(
                title: "Change Pin",
                subtitle: "Update your pin",
                onClick: () {},
              ),
              SizedBox(height: 14.h),
              buildTile(
                title: "Terms & Conditions",
                subtitle: "Contains our contract with you",
                onClick: () {},
              ),
              SizedBox(height: 14.h),
              buildTile(
                title: "Help & Support",
                subtitle: "Got any query? send us a message now",
                onClick: () {
                  Navigator.of(context).pushNamed(HelpAndSupport.id);
                },
              ),
              SizedBox(height: 14.h),
              buildTile(
                title: "Sign Out",
                subtitle: "Remove your current credentials from the app",
                onClick: () {},
              ),
              SizedBox(height: 22.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Image.asset(
                      "assets/dashboard_svg_images/logos_whatsapp-icon.png",
                      height: 24.h,
                      width: 26.w,
                    ),
                  ),
                  SizedBox(width: 64.w),
                  buildSvgImage(
                    imageLocation:
                        "assets/dashboard_svg_images/facebook_icon.svg",
                    onClick: () {},
                  ),
                  SizedBox(width: 64.w),
                  buildSvgImage(
                    imageLocation:
                        "assets/dashboard_svg_images/twitter_icon.svg",
                    onClick: () {},
                  ),
                  SizedBox(width: 64.w),
                  buildSvgImage(
                    imageLocation:
                        "assets/dashboard_svg_images/instagram_icon.svg",
                    onClick: () {},
                  ),
                ],
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Future<String> getFullName() async {
    final namePreference = await SharedPreferences.getInstance();
    name = namePreference.getString("fullName") ?? "";
    return name;
  }

  Future<String> getUserEmail() async {
    final emailPreference = await SharedPreferences.getInstance();
    email = emailPreference.getString("email") ?? "";
    return email;
  }

  Widget futureBuilder({future, textSize, textWeight, textColour}) {
    return FutureBuilder<String>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return CustomText(
            size: textSize,
            colour: textColour,
            text: snapshot.data ?? "",
            weight: textWeight,
          );
        }
        return CustomText(
          size: 18.sp,
          colour: kDeeperBlack,
          text: "Mr. John Doe",
          weight: kBold,
        );
      },
    );
  }

  Widget buildTile({title, subtitle, onClick}) {
    return ListTile(
      tileColor: kWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
      onTap: onClick,
      leading: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
            size: 14.sp,
            colour: kBlack,
            text: title,
            weight: kSemiBold,
          ),
          CustomText(
            size: 11.sp,
            colour: const Color(0xFF838080),
            text: subtitle,
            weight: kNormal,
          ),
        ],
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 15.sp,
        color: kBlack,
      ),
    );
  }

  Widget buildSvgImage({imageLocation, onClick}) {
    return GestureDetector(
      onTap: onClick,
      child: SvgPicture.asset(imageLocation),
    );
  }
}
