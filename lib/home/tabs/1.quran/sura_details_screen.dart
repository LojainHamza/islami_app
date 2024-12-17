import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/home/tabs/1.quran/sura_content_item.dart';
import 'package:islami_app/model/sura_model.dart';
import 'package:islami_app/my_app_color.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'suraaDetails';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if (verses.isEmpty) {
      loadSuraFiles(args.index);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          args.suraEnglishName,
          style: const TextStyle(color: MyAppColor.goldColor),
        ),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            color: MyAppColor.blackColor,
            child: Image.asset('assets/images/details_bg.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill),
          ),
          Column(
            children: [
              const SizedBox(height: 22),
              Text(
                args.suraArabicName,
                style:
                    const TextStyle(color: MyAppColor.goldColor, fontSize: 24),
              ),
              Expanded(
                child: verses.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(
                        color: MyAppColor.goldColor,
                      ))
                    : ListView.builder(
                        padding: const EdgeInsets.only(top: 20),
                        itemCount: verses.length,
                        itemBuilder: (context, index) {
                          return SuraContentItem(
                              content: verses[index], index: index);
                        }),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void loadSuraFiles(int index) async {
    String sureContent = await rootBundle.loadString('assets/files/$index.txt');
    List<String> suraLines = sureContent.split('\n');
    for (int i = 0; i < suraLines.length; i++) {}
    verses = suraLines;
    setState(() {});
  }

// void loadSuraFiles1(int index) async {
//   String sureContent =
//   await rootBundle.loadString('assets/files/$fileName');
//   List<String> suraLines = sureContent.split('\n');
//   for (int i = 0; i < suraLines.length; i++) {}
//   verses = suraLines;
//   setState(() {});
// }
}
