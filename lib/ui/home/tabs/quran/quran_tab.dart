import 'package:flutter/material.dart';
import 'package:islami_project/ui/home/tabs/quran/quran_resources.dart';
import 'package:islami_project/ui/home/tabs/quran/widget/sura_item.dart';
import 'package:islami_project/utils/app_assets.dart';
import 'package:islami_project/utils/app_colors.dart';
import 'package:islami_project/utils/app_routes.dart';
import 'package:islami_project/utils/app_styles.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            cursorColor: AppColors.primaryColor,
            decoration: InputDecoration(
             // contentPadding: EdgeInsets.symmetric(horizontal: width * 0.02),
              enabledBorder: builtTextField(),
              focusedBorder: builtTextField(),
              prefixIcon: Padding(
                padding: EdgeInsets.only(left: width * 0.02),
                child: Image.asset(AppAssets.iconSearch),
              ),
              hintText: 'Sura Name',
              hintStyle: AppStyles.bold16white
            ),
          ),
          SizedBox(height: height * 0.02,),
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
                            Text('Al-Anbiya',style: AppStyles.bold24black,),
                            Text('الأنبياء',style: AppStyles.bold24black,),
                            Text('112 Verses',style: AppStyles.bold14black,)

                          ],
                        ),
                        Image.asset(AppAssets.mostRecently)
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(width: width * 0.02,),
                itemCount: 10,
            ),
          ),
          SizedBox(height: height * 0.02,),
          Text('Suras List',style: AppStyles.bold16white,),
          SizedBox(height: height * 0.02,),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    Navigator.of(context).pushNamed(AppRoutes.suraDetailsScreenName,
                    arguments: index);
                  },
                    child: SuraItem(index: index,)
                );
              },
              separatorBuilder: (context, index){
                return Divider(
                  color: AppColors.whiteColor,
                  indent: width * 0.10,
                  endIndent: width * 0.10,
                );
              },
              itemCount: QuranResources.quranSurahAyahs.length
          ),
          ),

        ],
      ),
    );
  }
  OutlineInputBorder builtTextField(){
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide:const BorderSide(
            color: AppColors.primaryColor,
            width: 2
        )
    );
  }
}
