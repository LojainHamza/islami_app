import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/home/tabs/2.hadeth/hadeth_details_screen.dart';
import 'package:islami_app/model/hadeth_model.dart';
import 'package:islami_app/my_app_color.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<HadethModel> hadethList = [];

  @override
  Widget build(BuildContext context) {
    if (hadethList.isEmpty) {
      loadHadethFile();
    }
    return Column(
      children: [
        Center(child: Image.asset('assets/images/islami_logo.png')),
        Expanded(
            child: hadethList.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(
                    color: MyAppColor.goldColor,
                  )) // Loading indicator
                : CarouselSlider.builder(
                    options: CarouselOptions(
                      height: 450,
                      viewportFraction: 0.75,
                      enlargeCenterPage: true,
                    ),
                    itemCount: hadethList.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) =>
                        InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                            HadethDetailsScreen.routeName,
                            arguments: hadethList[itemIndex]);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: MyAppColor.goldColor,
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                              image: AssetImage(
                                  'assets/images/hadeth_background.png'),
                              fit: BoxFit.fill),
                        ),
                        child: Column(
                          children: [
                            Text(
                              hadethList[itemIndex].title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Expanded(
                              child: Text(
                                hadethList[itemIndex].content.join(''),
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
      ],
    );
  }

  void loadHadethFile() async {
    for (int i = 1; i <= 50; i++) {
      String hadethContent =
          await rootBundle.loadString('assets/files/h$i.txt');
      List<String> haderhLines = hadethContent.split('\n');
      String title = haderhLines[0];

      ///title
      haderhLines.removeAt(0);

      /// remove title
      HadethModel hadethModel = HadethModel(title: title, content: haderhLines);
      hadethList.add(hadethModel);
      setState(() {});
    }
  }
}
