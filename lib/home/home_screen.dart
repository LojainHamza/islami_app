import 'package:flutter/material.dart';
import 'package:islami_app/home/tabs/1.quran/quran_tab.dart';
import 'package:islami_app/home/tabs/2.hadeth/hadeth_tab.dart';
import 'package:islami_app/home/tabs/3.sebha/sebha_tab.dart';
import 'package:islami_app/home/tabs/4.radio/radio_tab.dart';
import 'package:islami_app/home/tabs/5.time/time_tab.dart';
import 'package:islami_app/my_app_color.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'homeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<String> backgroundImages = [
    'assets/images/quran_bg.png',
    'assets/images/hadeth_bg.png',
    'assets/images/sebha_bg.png',
    'assets/images/radio_bg.png',
    'assets/images/time_bg.png',
  ];

  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(backgroundImages[selectedIndex],
            width: double.infinity, height: double.infinity, fit: BoxFit.fill),
        Scaffold(
          body: tabs[selectedIndex],
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: MyAppColor.goldColor,
            ),
            child: BottomNavigationBar(
                currentIndex: selectedIndex,
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                items: [
                  BottomNavigationBarItem(
                    icon: buildItemInBottomNavBar(
                        index: 0, imagePath: 'icon_quran'),
                    label: 'Quran',
                  ),
                  BottomNavigationBarItem(
                    icon: buildItemInBottomNavBar(
                        index: 1, imagePath: 'icon_hadeth'),
                    label: 'Hadeth',
                  ),
                  BottomNavigationBarItem(
                    icon: buildItemInBottomNavBar(
                        index: 2, imagePath: 'icon_sebha'),
                    label: 'Sebha',
                  ),
                  BottomNavigationBarItem(
                    icon: buildItemInBottomNavBar(
                        index: 3, imagePath: 'icon_radio'),
                    label: 'Radio',
                  ),
                  BottomNavigationBarItem(
                    icon: buildItemInBottomNavBar(
                        index: 4, imagePath: 'icon_time'),
                    label: 'Time',
                  ),
                ]),
          ),
        ),
      ],
    );
  }

  Widget buildItemInBottomNavBar(
      {required int index, required String imagePath}) {
    return selectedIndex == index
        ? Container(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(66),
              color: MyAppColor.blackBgColor,
            ),
            child: ImageIcon(
              AssetImage('assets/images/$imagePath.png'),
            ))
        : ImageIcon(
            AssetImage('assets/images/$imagePath.png'),
          );
  }
}
