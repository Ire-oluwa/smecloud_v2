import 'package:flutter/material.dart';

class SignInProvider extends ChangeNotifier {
  final emailAddress = TextEditingController();
  final password = TextEditingController();

  bool signInCheckbox = false;
}
