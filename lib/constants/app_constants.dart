import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const kPurpleTheme = Color(0xFF913BD5);
const kWhite = Color(0xFFFFFFFF);
const kSubmissionButtonColour = Color(0xFF9846D9);
const kBlack = Color(0xFF333333);
const kDimBlack = Color(0xFF949BA5);
const kInActiveBlack = Color(0xFF5B5B66);
const kDeeperBlack = Color(0xFF000000);
const kPurpleText = Color(0xFF7010B8);
const kVeryLightPurple = Color(0xFFE3CFF3);
const kNormalGreen = Color(0xFF23B371);
const kNormal = FontWeight.w400;
const kMedium = FontWeight.w500;
const kSemiBold = FontWeight.w600;
const kBold = FontWeight.w700;
const kTransparent = Colors.transparent;
void Function() kUnfocus = () {
  FocusManager.instance.primaryFocus?.unfocus();
};
const kInputActionNext = TextInputAction.next;
const kNameInputType = TextInputType.text;
const kNumberInputType = TextInputType.phone;
const kEmailInputType = TextInputType.emailAddress;
const kPasswordInputType = TextInputType.visiblePassword;

final kFormatName = [FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]"))];

final kFormatPhoneNumber = [FilteringTextInputFormatter.allow(RegExp("[0-9]"))];

final kFormatEmailAddress = [
  FilteringTextInputFormatter.allow(RegExp("[a-zA-Z._@0-9]"))
];

final kFormatPassword = [FilteringTextInputFormatter.deny(RegExp("[*@]"))];
final kColumnPadding = EdgeInsets.symmetric(horizontal: 32.w);
