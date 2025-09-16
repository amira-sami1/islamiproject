import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';
import '../home/home_screen.dart';

class IntroScreen extends StatefulWidget {
  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          titleWidget: const SizedBox.shrink(),
          bodyWidget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Image.asset(
                AppAssets.welcomeIslami,
                height: 630,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 79),
              Text(
                "Welcome To Islmi App",
                style: AppStyles.bold20primary,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          decoration: PageDecoration(
            pageColor: AppColors.lightBlackColor,
          ),
        ),

        PageViewModel(
          titleWidget: const SizedBox.shrink(),
          bodyWidget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Image.asset(
                AppAssets.welcomeQuran,
                height: 630,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 40),
              Text(
                "Reading the Quran",
                style: AppStyles.bold24primary,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              Text(
                "Read, and your Lord is the Most Generous",
                style: AppStyles.bold20primary,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          decoration: PageDecoration(
            pageColor: AppColors.lightBlackColor,
            contentMargin: EdgeInsets.zero,
          ),
        ),

        PageViewModel(
          titleWidget: const SizedBox.shrink(),
          bodyWidget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Image.asset(
                AppAssets.welcomeMosque,
                height: 630,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 40),
              Text(
                "Welcome To Islmi",
                style: AppStyles.bold24primary,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              Text(
                "We Are Very Excited To Have You In Our Community",
                style: AppStyles.bold20primary,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          decoration: PageDecoration(
            pageColor: AppColors.lightBlackColor,
            contentMargin: EdgeInsets.zero,
          ),
        ),

        PageViewModel(
          titleWidget: const SizedBox.shrink(),
          bodyWidget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Image.asset(
                AppAssets.welcomeSepha,
                height: 630,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 40),
              Text(
                "Bearish",
                style: AppStyles.bold24primary,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              Text(
                "Praise the name of your Lord, the Most High",
                style: AppStyles.bold20primary,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          decoration: PageDecoration(
            pageColor: AppColors.lightBlackColor,
            contentMargin: EdgeInsets.zero,
          ),
        ),

        PageViewModel(
          titleWidget: const SizedBox.shrink(),
          bodyWidget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Image.asset(
                AppAssets.welcomeRadio,
                height: 630,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 40),
              Text(
                "Holy Quran Radio",
                style: AppStyles.bold24primary,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              Text(
                "Listen to the Holy Quran Radio for free and easily",
                style: AppStyles.bold20primary,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          decoration: PageDecoration(
            pageColor: AppColors.lightBlackColor,
            contentMargin: EdgeInsets.zero,
          ),
        ),
      ],

      // ⬅️ هنا نراقب الصفحة الحالية
      onChange: (index) {
        setState(() {
          currentIndex = index;
        });
      },

      showBackButton: currentIndex != 4,
      back: Text("Back", style: AppStyles.bold16primary),
      next: Text("Next", style: AppStyles.bold16primary),
      done: Text("Finish", style: AppStyles.bold16primary),

      onDone: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => HomeScreen()),
        );
      },

      dotsDecorator: DotsDecorator(
        activeColor: AppColors.primaryColor,
        color: AppColors.lightBlackColor,
        size: Size(8, 8),
        activeSize: Size(12, 8),
      ),

      globalBackgroundColor: AppColors.lightBlackColor,
    );
  }
}
