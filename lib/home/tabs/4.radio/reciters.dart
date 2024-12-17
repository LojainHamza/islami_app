import 'package:flutter/material.dart';
import 'package:islami_app/my_app_color.dart';

class RecitersView extends StatefulWidget {
  const RecitersView({super.key});

  @override
  _RecitersUIState createState() => _RecitersUIState();
}

class _RecitersUIState extends State<RecitersView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        buildReciterContainer('Ibrahim Al-Akdar'),
        buildReciterContainer('Akram Alalaqmi'),
        buildReciterContainer('Majed Al-Enezi'),
        buildReciterContainer('Malik shaibat Alhamed'),
      ],
    );
  }

  Widget buildReciterContainer(String title) {
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
            image: isPlaying == false
                ? const DecorationImage(
                    image: AssetImage('assets/images/radio_background.png'),
              fit: BoxFit.cover,
                  )
                : const DecorationImage(
                    image: AssetImage('assets/images/soundWave.png'),
                    fit: BoxFit.cover,
                    opacity: 0.4),
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
