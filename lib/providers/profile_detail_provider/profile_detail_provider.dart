import 'package:flutter/material.dart';

class ProfileDetailProvider extends ChangeNotifier {
  final fullName = TextEditingController();
  final emailAddress = TextEditingController();
  final username = TextEditingController();
  final phoneNumber = TextEditingController();
}
