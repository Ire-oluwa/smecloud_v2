import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sme_cloud_version2/providers/add_funds_transaction_pin_provider/add_funds_transaction_pin_provider.dart';
import 'package:sme_cloud_version2/providers/change_password_in_settings_provider/change_password_in_settings_provider.dart';
import 'package:sme_cloud_version2/providers/change_password_provider/change_password_provider.dart';
import 'package:sme_cloud_version2/providers/change_pin_provider/change_pin_provider.dart';
import 'package:sme_cloud_version2/providers/forgot_password_provider/forgot_password_provider.dart';
import 'package:sme_cloud_version2/providers/profile_detail_provider/profile_detail_provider.dart';
import 'package:sme_cloud_version2/providers/sign_in_provider/sign_in_provider.dart';
import 'package:sme_cloud_version2/providers/sign_up_providers/sign_up_provider.dart';
import 'package:sme_cloud_version2/screens/add_funds/add_funds.dart';
import 'package:sme_cloud_version2/screens/change_password/change_password.dart';
import 'package:sme_cloud_version2/screens/change_password/change_password_message.dart';
import 'package:sme_cloud_version2/screens/change_password_in_settings/change_password_in_settings.dart';
import 'package:sme_cloud_version2/screens/change_pin/change_pin.dart';
import 'package:sme_cloud_version2/screens/dashboard/dashboard.dart';
import 'package:sme_cloud_version2/screens/forgot_password/forgot_password.dart';
import 'package:sme_cloud_version2/screens/help_and_support/faq.dart';
import 'package:sme_cloud_version2/screens/help_and_support/help_and_support.dart';
import 'package:sme_cloud_version2/screens/history/history.dart';
import 'package:sme_cloud_version2/screens/home/home.dart';
import 'package:sme_cloud_version2/screens/more/more.dart';
import 'package:sme_cloud_version2/screens/notification/notification.dart';
import 'package:sme_cloud_version2/screens/otp_screen/otp_screen.dart';
import 'package:sme_cloud_version2/screens/profile_details/profile_details.dart';
import 'package:sme_cloud_version2/screens/reset_api/reset_api.dart';
import 'package:sme_cloud_version2/screens/sign_in/sign_in.dart';
import 'package:sme_cloud_version2/screens/sign_up/sign_up.dart';
import 'package:sme_cloud_version2/screens/splash/final_splash.dart';
import 'package:sme_cloud_version2/screens/splash/initial_splash.dart';
import 'package:sme_cloud_version2/screens/statistics/statistics.dart';
import 'package:sme_cloud_version2/screens/terms_and_conditions/terms_and_conditions.dart';
import 'package:sme_cloud_version2/screens/vend_data/vend_data.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignUpProvider()),
        ChangeNotifierProvider(create: (_) => SignInProvider()),
        ChangeNotifierProvider(create: (_) => ForgotPasswordProvider()),
        ChangeNotifierProvider(create: (_) => ChangePasswordProvider()),
        ChangeNotifierProvider(create: (_) => AddFundsTransactionPinProvider()),
        ChangeNotifierProvider(create: (_) => ProfileDetailProvider()),
        ChangeNotifierProvider(
            create: (_) => ChangePasswordInSettingProvider()),
        ChangeNotifierProvider(create: (_) => ChangePinProvider()),
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
            More.id: (context) => const More(),
            HelpAndSupport.id: (context) => const HelpAndSupport(),
            ProfileDetails.id: (context) => const ProfileDetails(),
            ChangePasswordSetting.id: (context) =>
                const ChangePasswordSetting(),
            ChangePin.id: (context) => const ChangePin(),
            FAQ.id: (context) => const FAQ(),
            TermsAndConditions.id: (context) => const TermsAndConditions(),
            Notifications.id: (context) => const Notifications(),
          },
        );
      },
    );
  }
}
