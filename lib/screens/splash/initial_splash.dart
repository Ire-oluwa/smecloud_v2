import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sme_cloud_version2/screens/dashboard/dashboard.dart';
import 'package:sme_cloud_version2/screens/splash/final_splash.dart';

class InitialSplash extends StatefulWidget {
  const InitialSplash({Key? key}) : super(key: key);
  static const String id = "initial splash";

  @override
  State<InitialSplash> createState() => _InitialSplashState();
}

class _InitialSplashState extends State<InitialSplash>
    with SingleTickerProviderStateMixin {
  late bool isLoggedIn;
  late AnimationController _animationController;
  late Animation<double> _sizeAnimation;

  Future<bool?> checkLogInStatus() async {
    WidgetsFlutterBinding.ensureInitialized();
    final prefs = await SharedPreferences.getInstance();
    isLoggedIn = prefs.getBool("isLoggedIn") ?? false;
    return isLoggedIn;
  }

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    checkLogInStatus();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    //control the size of what is being animated
    _sizeAnimation = Tween<double>(begin: 50.0, end: 200.0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            isLoggedIn
                ? Navigator.of(context).pushReplacementNamed(Dashboard.id)
                : Navigator.of(context).pushReplacementNamed(FinalSplash.id);
          }
        },
      );

    //allow animationController update its state
    _animationController.addListener(() {
      setState(() {});
    });
    _animationController.forward();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    getDeviceId();
    (value) => deviceId = value!;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // child: SvgPicture.asset(
        //   "assets/svg_pictures/man_in_workspace.svg",
        //   height: _sizeAnimation.value,
        //   width: _sizeAnimation.value,
        // ),
        child: Image.asset(
          "assets/sme_cloud_logo.png",
          height: _sizeAnimation.value.h,
          width: _sizeAnimation.value.w,
        ),
      ),
    );
  }
}

String deviceId = "";

Future<String?> getDeviceId() async {
  deviceId = (await PlatformDeviceId.getDeviceId)!;
  return deviceId;
}

//TODO: set first time user
//TODO: check for first time user
//TODO: check for logged-in user
