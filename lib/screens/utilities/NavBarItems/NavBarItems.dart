import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavBarItem {
  const NavBarItem(this.icon, this.label);

  final Widget icon;
  final String label;

  static List<NavBarItem> getNavBarItem() {
    return [
      NavBarItem(
        SvgPicture.asset("assets/dashboard_svg_images/home_icon.svg"),
        "Home",
      ),
      NavBarItem(
        SvgPicture.asset("assets/dashboard_svg_images/history_icon.svg"),
        "History",
      ),
      NavBarItem(
        FaIcon(
          FontAwesomeIcons.gear,
          size: 16.sp,
        ),
        "Settings",
      ),
      NavBarItem(
        SvgPicture.asset("assets/dashboard_svg_images/more_icon.svg"),
        "More",
      ),
    ];
  }
}
