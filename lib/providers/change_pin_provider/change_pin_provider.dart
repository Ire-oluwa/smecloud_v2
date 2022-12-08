import 'package:flutter/material.dart';

class ChangePinProvider extends ChangeNotifier {
  final newPin = TextEditingController();
  final currentPin = TextEditingController();
}
