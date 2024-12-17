import 'dart:math';

import 'package:flutter/material.dart';
import 'package:islami_app/my_app_color.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  String tasbeehWord = 'سبحان الله';
  int counter = 1;
  double rotationAngle = 0;

  final List<String> tasbeehWords = [
    'سبحان الله',
    'الحمد لله',
    'لا إله إلا الله',
    'الله أكبر',
    'لا حول ولا قوة إلا بالله',
  ];

  void onSebhaTap() {
    setState(() {
      counter++;

      if (counter > 33) {
        counter = 1;
        int currentIndex = tasbeehWords.indexOf(tasbeehWord);
        tasbeehWord = tasbeehWords[(currentIndex + 1) % tasbeehWords.length];
      }

      rotationAngle += pi / 12;
    });
  }

  void resetSebha() {
    setState(() {
      tasbeehWord = 'سبحان الله';
      counter = 1;
      rotationAngle = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Center(child: Image.asset('assets/images/islami_logo.png')),
            const SizedBox(height: 20),
            Image.asset('assets/images/tasbeeh.png'),
            Expanded(
              child: GestureDetector(
                onTap: onSebhaTap,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: -10,
                      child: Image.asset(
                        'assets/images/sebha_head.png',
                        height: 100,
                      ),
                    ),
                    Transform.rotate(
                      angle: rotationAngle,
                      child: SizedBox(
                        child: Image.asset(
                          'assets/images/Sebha_body.png',
                          width: 280,
                          height: 280,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 25),
                        Text(
                          tasbeehWord,
                          style: const TextStyle(
                            color: MyAppColor.whiteColor,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '$counter',
                          style: const TextStyle(
                            color: MyAppColor.whiteColor,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 5,
          right: 5,
          child: ElevatedButton(
            onPressed: resetSebha,
            style: ElevatedButton.styleFrom(
              backgroundColor: MyAppColor.goldColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text(
              'Reset',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: MyAppColor.blackBgColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
