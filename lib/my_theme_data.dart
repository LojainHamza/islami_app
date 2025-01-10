import 'package:flutter/material.dart';
import 'package:islami_app/my_app_color.dart';
import 'package:islami_app/my_app_styles.dart';

class MyThemeData {
  static final ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: MyAppColor.whiteColor,
        showSelectedLabels: true,
        unselectedItemColor: MyAppColor.blackColor,
        showUnselectedLabels: false,
          selectedLabelStyle: MyAppStyles.bold16White
          //backgroundColor: MyAppColor.goldColor,
        //type: BottomNavigationBarType.fixed,
    ),
    bottomSheetTheme:
        const BottomSheetThemeData(backgroundColor: Colors.transparent),
    appBarTheme: const AppBarTheme(
        backgroundColor: MyAppColor.blackColor,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: MyAppColor.goldColor,
        )),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
            color: MyAppColor.whiteColor,
            fontSize: 16,
            fontWeight: FontWeight.bold),
      ));
}
