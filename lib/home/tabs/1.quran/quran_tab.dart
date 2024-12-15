import 'package:flutter/material.dart';
import 'package:islami_app/home/tabs/1.quran/sura_details_screen.dart';
import 'package:islami_app/home/tabs/1.quran/sura_list_widget.dart';
import 'package:islami_app/model/sura_model.dart';
import 'package:islami_app/my_app_color.dart';

class QuranTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Image.asset('assets/images/islami_logo.png')),
          TextField(
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Sura English'),
                    Text('Sura Arabic'),
                    Text('Ayah Number'),
                  ],
                ),
                Image.asset('assets/images/most_recently_image.png'),
              ],
            ),
          ),
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
                  itemCount: SuraModel.getItemCount(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                            SuraDetailsScreen.routeName,
                            arguments: SuraModel.getSuraModel(index));
                      },
                      child: SuraListWidget(
                        suraModel: SuraModel.getSuraModel(index),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
