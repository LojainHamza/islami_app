import 'package:flutter/material.dart';
import 'package:islami_app/my_app_color.dart';

class SuraContentItem extends StatelessWidget {
  String content;
  int index;

  SuraContentItem({required this.content, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: MyAppColor.goldColor,
          width: 2,
        ),
      ),
      child: Text(
        '$content [${index + 1}] ',
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
        style: const TextStyle(
          fontSize: 18,
          color: MyAppColor.goldColor,
        ),
      ),
    );
  }
}
