import 'package:flutter/material.dart';
import 'package:islami_app/model/sura_model.dart';
import 'package:islami_app/my_app_color.dart';

class SuraListWidget extends StatelessWidget {
  SuraModel suraModel;

  SuraListWidget({required this.suraModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset('assets/images/vector_number_image.png'),
            Text(
              '${suraModel.index}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: MyAppColor.whiteColor,
              ),
            ),
          ],
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(suraModel.suraEnglishName,
                style: const TextStyle(color: MyAppColor.whiteColor)),
            const SizedBox(height: 3),
            Text('${suraModel.numOfVerses} Verses',
                style: const TextStyle(color: MyAppColor.whiteColor)),
          ],
        ),
        const Spacer(),
        Text(suraModel.suraArabicName,
            style: const TextStyle(color: MyAppColor.whiteColor)),
      ],
    );
  }
}
