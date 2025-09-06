import 'package:flutter/material.dart';
import 'package:islami_project/ui/home/tabs/quran/quran_resources.dart';
import 'package:islami_project/utils/app_assets.dart';
import 'package:islami_project/utils/app_styles.dart';

class SuraItem extends StatelessWidget {
  final int index;
  const SuraItem({super.key,required this.index});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(AppAssets.vectorImage),
            Text('${index+1}',style: AppStyles.bold20white,)
          ],
        ),
        SizedBox(width: width * 0.06,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(QuranResources.quranSurahsEnglish[index],style: AppStyles.bold20white,),
            Text('${QuranResources.quranSurahAyahs[index]}  Verses',style: AppStyles.bold14white,)
          ],
        ),
        Spacer(),
        Text(QuranResources.quranSurahsArabic[index],style: AppStyles.bold20white,)
      ],
    );
  }
}
