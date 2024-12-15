import 'package:flutter/material.dart';
import 'package:islami_app/model/hadeth_model.dart';
import 'package:islami_app/my_app_color.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = 'hadethDetails';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethModel;
    return Scaffold(
      appBar: AppBar(),
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
                args.title,
                style:
                    const TextStyle(color: MyAppColor.goldColor, fontSize: 24),
              ),
              Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.only(top: 20),
                    itemCount: args.content.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 22, horizontal: 5),
                        child: Text(
                          args.content[index],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: MyAppColor.goldColor, fontSize: 20),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
