import 'package:flutter/material.dart';
import 'package:islami_app/home/tabs/1.quran/sura_details_screen.dart';
import 'package:islami_app/home/tabs/1.quran/sura_list_widget.dart';
import 'package:islami_app/model/sura_model.dart';
import 'package:islami_app/my_app_color.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuranTab extends StatefulWidget {
  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  void addSuraList() {
    for (int i = 0; i < 114; i++) {
      SuraModel.suraList.add(SuraModel(
          suraEnglishName: SuraModel.suraEnglishNameList[i],
          suraArabicName: SuraModel.suraArabicNameList[i],
          numOfVerses: SuraModel.numOfVersesList[i],
          index: i + 1));
    }
  }

  @override
  void initState() {
    super.initState();
    addSuraList();
    loadLastSura();
  }

  List<SuraModel> filteredList = SuraModel.suraList;
  String searchText = '';
  Map<String, String> lastSura = {};

  /*
  suraList = 114
  filteredList = 114
  searchText => suraList => filteredList (updated)
   */

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Image.asset('assets/images/islami_logo.png')),
          TextField(
            onChanged: (text) {
              searchText = text;
              filteredList = SuraModel.suraList.where((sura) {
                return sura.suraArabicName.contains(searchText) ||
                    sura.suraEnglishName
                        .toLowerCase()
                        .contains(searchText.toLowerCase());
              }).toList();
              setState(() {});
            },
            style: const TextStyle(color: MyAppColor.whiteColor),
            cursorColor: MyAppColor.whiteColor,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: MyAppColor.goldColor,
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: MyAppColor.goldColor,
                    width: 2,
                  ),
                ),
                prefixIcon: const ImageIcon(
                    AssetImage('assets/images/icon_search.png'),
                    color: MyAppColor.goldColor),
                hintText: "Sura Name",
                hintStyle: const TextStyle(
                    color: MyAppColor.whiteColor, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 20),
          searchText.isNotEmpty ? const SizedBox() : buildMostRecently(),
          const SizedBox(height: 10),
          const Text(
            'Sura List',
            style: TextStyle(
              color: MyAppColor.whiteColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 2),
          Expanded(
              child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const Divider(
                      color: MyAppColor.whiteColor,
                      thickness: 2,
                      indent: 30.5,
                      endIndent: 25.5,
                    );
                  },
                  padding: EdgeInsets.zero,
                  itemCount: filteredList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        /// save data
                        saveLastSura(
                            suraEnName: filteredList[index].suraEnglishName,
                            suraArName: filteredList[index].suraArabicName,
                            numVerses: filteredList[index].numOfVerses);

                        /// navigate
                        Navigator.of(context).pushNamed(
                            SuraDetailsScreen.routeName,
                            arguments: filteredList[index]);
                      },
                      child: SuraListWidget(
                        //index: index,
                        suraModel: filteredList[index],
                      ),
                    );
                  }))
        ],
      ),
    );
  }

  Widget buildMostRecently() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Most Recently',
          style: TextStyle(
            color: MyAppColor.whiteColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: MyAppColor.goldColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: lastSura.isNotEmpty
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(lastSura['suraEnName'] ?? ''),
                        Text(lastSura['suraArName'] ?? ''),
                        Text('${lastSura['numVerses'] ?? ''} Verses'),
                      ],
                    ),
                    Image.asset('assets/images/most_recently_image.png'),
                  ],
                )
              : const Text(
                  'Nothing to show',
                  style: TextStyle(
                      color: MyAppColor.blackColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
        ),
      ],
    );
  }

  /// save data == write data
  Future<void> saveLastSura(
      {required String suraEnName,
      required String suraArName,
      required String numVerses}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('suraEnName', suraEnName);
    await prefs.setString('suraArName', suraArName);
    await prefs.setString('numVerses', numVerses);
    await loadLastSura();

    /// update after reload
  }

  /// get data == read data
  Future<Map<String, String>> getLastSura() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String suraEnName = prefs.getString('suraEnName') ?? '';
    String suraArName = prefs.getString('suraArName') ?? '';
    String numVerses = prefs.getString('numVerses') ?? '';
    return {
      'suraEnName': suraEnName,
      'suraArName': suraArName,
      'numVerses': numVerses,
    };
  }

  loadLastSura() async {
    lastSura = await getLastSura();
    setState(() {});
  }
}
