import 'package:flutter/material.dart';
import 'package:islami_project/providers/most_recent_provider.dart';
import 'package:islami_project/ui/home/tabs/quran/quran_resources.dart';
import 'package:islami_project/utils/shared_prefrences_helper.dart';
import 'package:provider/provider.dart';

import '../../../../../utils/app_assets.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_styles.dart';

class MostRecentlyWidget extends StatefulWidget {
   MostRecentlyWidget({super.key});

  @override
  State<MostRecentlyWidget> createState() => _MostRecentlyWidgetState();
}

class _MostRecentlyWidgetState extends State<MostRecentlyWidget> {
   late MostRecentProvider mostRecentProvider;

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      mostRecentProvider.readMostRecentList();
    },);
   }



  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var mostRecentProvider = Provider.of<MostRecentProvider>(context);
    return Visibility(
      visible: mostRecentProvider.mostRecentList.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Most Recently',style: AppStyles.bold16white,),
          SizedBox(height: height * 0.02,),
          SizedBox(
            height: height * 0.18,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.04
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.primaryColor
                  ),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                          QuranResources.quranSurahsEnglish[mostRecentProvider.mostRecentList[index]],
                          style: AppStyles.bold24black,),
                          Text(QuranResources.quranSurahsArabic[mostRecentProvider.mostRecentList[index]],
                            style: AppStyles.bold24black,),
                          Text('${QuranResources.quranSurahAyahs[mostRecentProvider.mostRecentList[index]]}  Verses',
                            style: AppStyles.bold14black,)
      
                        ],
                      ),
                      Image.asset(AppAssets.mostRecently)
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(width: width * 0.02,),
              itemCount:mostRecentProvider.mostRecentList.length,
            ),
          ),
        ],
      ),
    );
  }
}
