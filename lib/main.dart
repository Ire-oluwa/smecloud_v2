import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sme_cloud_version2/providers/change_password_provider/change_password_provider.dart';
import 'package:sme_cloud_version2/providers/forgot_password_provider/forgot_password_provider.dart';
import 'package:sme_cloud_version2/providers/sign_in_provider/sign_in_provider.dart';
import 'package:sme_cloud_version2/providers/sign_up_providers/sign_up_provider.dart';
import 'package:sme_cloud_version2/screens/add_funds/add_funds.dart';
import 'package:sme_cloud_version2/screens/change_password/change_password.dart';
import 'package:sme_cloud_version2/screens/change_password/change_password_message.dart';
import 'package:sme_cloud_version2/screens/dashboard/dashboard.dart';
import 'package:sme_cloud_version2/screens/forgot_password/forgot_password.dart';
import 'package:sme_cloud_version2/screens/history/history.dart';
import 'package:sme_cloud_version2/screens/home/home.dart';
import 'package:sme_cloud_version2/screens/otp_screen/otp_screen.dart';
import 'package:sme_cloud_version2/screens/reset_api/reset_api.dart';
import 'package:sme_cloud_version2/screens/sign_in/sign_in.dart';
import 'package:sme_cloud_version2/screens/sign_up/sign_up.dart';
import 'package:sme_cloud_version2/screens/splash/final_splash.dart';
import 'package:sme_cloud_version2/screens/splash/initial_splash.dart';
import 'package:sme_cloud_version2/screens/statistics/statistics.dart';
import 'package:sme_cloud_version2/screens/vend_data/vend_data.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignUpProvider()),
        ChangeNotifierProvider(create: (_) => SignInProvider()),
        ChangeNotifierProvider(create: (_) => ForgotPasswordProvider()),
        ChangeNotifierProvider(create: (_) => ChangePasswordProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(),
          initialRoute: InitialSplash.id,
          routes: {
            InitialSplash.id: (context) => const InitialSplash(),
            FinalSplash.id: (context) => const FinalSplash(),
            SignUp.id: (context) => const SignUp(),
            SignIn.id: (context) => const SignIn(),
            ForgotPassword.id: (context) => const ForgotPassword(),
            OTPScreen.id: (context) => const OTPScreen(),
            ChangePassword.id: (context) => const ChangePassword(),
            ChangePasswordMessage.id: (context) =>
                const ChangePasswordMessage(),
            Dashboard.id: (context) => const Dashboard(),
            Home.id: (context) => const Home(),
            History.id: (context) => const History(),
            AddFunds.id: (context) => const AddFunds(),
            ResetApiKey.id: (context) => const ResetApiKey(),
            Statistics.id: (context) => const Statistics(),
            VendData.id: (context) => const VendData(),
          },
        );
      },
    );
  }
}
