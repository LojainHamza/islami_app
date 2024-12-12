import 'package:flutter/material.dart';
import 'package:islami_app/home/home_screen.dart';
import 'package:islami_app/my_app_color.dart';
import 'package:islami_app/onBoarding/onBoardingItems.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routeName = 'onBoardingScreen';

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = OnBoardingItems();
  final pageController = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyAppColor.blackBgColor,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: PageView.builder(
            itemCount: controller.items.length,
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                onLastPage = controller.items.length - 1 == index;
              });
            },
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Image.asset('assets/images/islami_logo.png'),
                  Image.asset(controller.items[index].imagePath),
                  Text(controller.items[index].title,
                      style: const TextStyle(
                          color: MyAppColor.goldColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 24)),
                  const SizedBox(height: 10),
                  Text(controller.items[index].description,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: MyAppColor.goldColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                ],
              );
            }),
      ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
              onPressed: () => pageController.previousPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn),
              child: const Text(
                'Back',
                style: TextStyle(color: MyAppColor.goldColor, fontSize: 18),
              )),
          SmoothPageIndicator(
            controller: pageController,
            count: controller.items.length,
            onDotClicked: (index) => pageController.animateToPage(index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn),
            effect: const WormEffect(
              activeDotColor: MyAppColor.goldColor,
              dotHeight: 10,
              dotColor: MyAppColor.grayColor,
              dotWidth: 10,
            ),
          ),
          onLastPage
              ? TextButton(
                  onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return HomeScreen();
                      })),
                  child: const Text(
                    'Finish',
                    style: TextStyle(color: MyAppColor.goldColor, fontSize: 18),
                  ))
              : TextButton(
                  onPressed: () => pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn),
                  child: const Text(
                    'Next',
                    style: TextStyle(color: MyAppColor.goldColor, fontSize: 18),
                  ))
        ],
      ),
    );
  }
}
