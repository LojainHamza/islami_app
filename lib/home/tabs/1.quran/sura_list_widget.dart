import 'package:flutter/material.dart';
import 'package:islami_app/model/sura_model.dart';
import 'package:islami_app/my_app_styles.dart';

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
              style: MyAppStyles.bold16White,
            ),
          ],
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(suraModel.suraEnglishName, style: MyAppStyles.bold20White),
            const SizedBox(height: 3),
            Text('${suraModel.numOfVerses} Verses',
                style: MyAppStyles.bold20White),
          ],
        ),
        const Spacer(),
        Text(suraModel.suraArabicName, style: MyAppStyles.bold20White),
      ],
    );
  }
}
