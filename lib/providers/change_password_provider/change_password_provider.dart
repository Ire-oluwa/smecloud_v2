import 'package:flutter/material.dart';

class ChangePasswordProvider extends ChangeNotifier {
  final newPassword = TextEditingController();
  final confirmPassword = TextEditingController();

  bool isNewPasswordObscured = false;
  bool isConfirmedPasswordObscured = false;

  seeOrUnseeNewPassword() {
    isNewPasswordObscured = !isNewPasswordObscured;
    notifyListeners();
  }

  seeOrUnseeConfirmedPassword() {
    isConfirmedPasswordObscured = !isConfirmedPasswordObscured;
    notifyListeners();
  }
}
