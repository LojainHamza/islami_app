import 'package:flutter/material.dart';
import 'package:islami_app/my_app_color.dart';

class RadioView extends StatefulWidget {
  const RadioView({super.key});

  @override
  _RadioUIState createState() => _RadioUIState();
}

class _RadioUIState extends State<RadioView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        buildRadioContainer('Radio Ibrahim Al-Akdar'),
        buildRadioContainer('Radio Al-Qaria Yassen'),
        buildRadioContainer('Radio Ahmed Al-Trabulsi'),
        buildRadioContainer('Radio Addokali Mohammad Alalim'),
      ],
    );
  }

  Widget buildRadioContainer(String title) {
    bool isFavorited = false;
    bool isPlaying = false;
    bool isMuted = false;

    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: MyAppColor.goldColor,
            image: const DecorationImage(
              image: AssetImage('assets/images/radio_background.png'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      isFavorited ? Icons.favorite : Icons.favorite_border,
                      color: MyAppColor.blackColor,
                    ),
                    onPressed: () {
                      setState(() {
                        isFavorited = !isFavorited;
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      isPlaying ? Icons.pause : Icons.play_arrow,
                      color: MyAppColor.blackColor,
                    ),
                    onPressed: () {
                      setState(() {
                        isPlaying = !isPlaying;
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      isMuted ? Icons.volume_off : Icons.volume_up,
                      color: MyAppColor.blackColor,
                    ),
                    onPressed: () {
                      setState(() {
                        isMuted = !isMuted;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
