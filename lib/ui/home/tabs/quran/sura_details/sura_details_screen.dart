import 'package:flutter/material.dart';
import 'package:islami_project/ui/home/tabs/quran/quran_resources.dart';
import 'package:islami_project/utils/app_assets.dart';
import 'package:islami_project/utils/app_colors.dart';
import 'package:islami_project/utils/app_styles.dart';

class SuraDetailsScreen extends StatelessWidget {
  const SuraDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        title: Text(QuranResources.quranSurahsEnglish[index],
        style: AppStyles.bold20primary,
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: AppColors.lightBlackColor,
              child: Image.asset(
                AppAssets.detailsBg,
                width: double.infinity,
                fit: BoxFit.fill
              ),
          ),
        ],
      ),
    );
  }
}
