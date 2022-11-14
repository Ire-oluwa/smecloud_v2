import 'package:flutter/material.dart';

class SignUpProvider extends ChangeNotifier {
  final fullName = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();

  bool checkboxState = false;
}
