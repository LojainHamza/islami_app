import 'package:flutter/material.dart';
import 'package:islami_app/my_app_color.dart';

class SuraListWidget extends StatelessWidget {
  int index;
  String suraEngName;
  String suraArabName;
  String ayahNumber;

  SuraListWidget(
      {required this.index,
      required this.suraEngName,
      required this.suraArabName,
      required this.ayahNumber});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset('assets/images/vector_number_image.png'),
            Text(
              '$index',
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
            Text(suraEngName,
                style: const TextStyle(color: MyAppColor.whiteColor)),
            const SizedBox(height: 3),
            Text('$ayahNumber Verses',
                style: const TextStyle(color: MyAppColor.whiteColor)),
          ],
        ),
        const Spacer(),
        Text('$suraArabName', style: TextStyle(color: MyAppColor.whiteColor)),
      ],
    );
  }
}
