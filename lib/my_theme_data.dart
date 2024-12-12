import 'package:flutter/material.dart';
import 'package:islami_app/my_app_color.dart';

class MyThemeData {
  static final ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: MyAppColor.whiteColor,
        showSelectedLabels: true,
        unselectedItemColor: MyAppColor.blackColor,
        showUnselectedLabels: false,
        //backgroundColor: MyAppColor.goldColor,
        //type: BottomNavigationBarType.fixed,
    ),
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.transparent),
  );
}
