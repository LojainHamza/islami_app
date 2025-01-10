import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/model/sura_model.dart';
import 'package:islami_app/my_app_color.dart';
import 'package:islami_app/my_app_styles.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'suraaDetails';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];
  String contentSura = '';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if (contentSura.isEmpty) {
      loadSuraFiles(args.index);
    }
    // if (verses.isEmpty) {
    //   loadSuraFiles(args.index);
    // }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          args.suraEnglishName,
          style: MyAppStyles.bold24Gold,
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
                style: MyAppStyles.bold24Black
                    .copyWith(color: MyAppColor.goldColor),
              ),
              Expanded(
                child: contentSura.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(
                        color: MyAppColor.goldColor,
                      ))
                    : Padding(
                        padding: const EdgeInsets.all(10),
                        child: SingleChildScrollView(
                            child: Text(contentSura,
                                style: MyAppStyles.bold20Gold,
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.center)),
                      ),
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
    for (int i = 0; i < suraLines.length; i++) {
      suraLines[i] += '[${i + 1}]';
    }
    contentSura = suraLines.join();
    setState(() {});
  }

/*
  void loadSuraFiles(int index) async {
    String sureContent = await rootBundle.loadString('assets/files/$index.txt');
    List<String> suraLines = sureContent.split('\n');
    for (int i = 0; i < suraLines.length; i++) {}
    verses = suraLines;
    setState(() {});
  }
   */

// void loadSuraFiles1(int index) async {
//   String sureContent =
//   await rootBundle.loadString('assets/files/$fileName');
//   List<String> suraLines = sureContent.split('\n');
//   for (int i = 0; i < suraLines.length; i++) {}
//   verses = suraLines;
//   setState(() {});
// }
}
