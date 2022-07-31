import 'package:flutter/material.dart';
import 'package:salon_secret/Config/Utils/color.dart';

class AppStateNotifier extends ChangeNotifier {
  //
  bool isDarkModeOn = false;

  void updateTheme(bool isDarkModeOn) {
    this.isDarkModeOn = isDarkModeOn;
    AppColors.isdarktheme=isDarkModeOn;
    notifyListeners();
  }
}