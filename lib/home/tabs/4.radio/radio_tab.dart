import 'package:flutter/material.dart';
import 'package:islami_app/home/tabs/4.radio/radio.dart';
import 'package:islami_app/home/tabs/4.radio/reciters.dart';
import 'package:islami_app/my_app_color.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Image.asset('assets/images/islami_logo.png'),
      DefaultTabController(
        length: 2,
        child: Expanded(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xb3202020),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TabBar(
                  unselectedLabelColor: Colors.white,
                  labelColor: Colors.black,
                  labelStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  indicator: BoxDecoration(
                    color: MyAppColor.goldColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                    indicatorColor: Colors.transparent,
                    tabs: const [
                    Tab(text: 'Radio'),
                    Tab(text: 'Reciters'),
                  ],
                    overlayColor:
                        const WidgetStatePropertyAll(Colors.transparent)),
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    RadioView(),
                    RecitersView(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
