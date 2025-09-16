import 'package:flutter/material.dart';
import 'package:islami_project/ui/home/tabs/quran/quran_resources.dart';
import 'package:islami_project/ui/home/tabs/quran/widget/most_recently_widget.dart';
import 'package:islami_project/ui/home/tabs/quran/widget/sura_item.dart';
import 'package:islami_project/utils/app_assets.dart';
import 'package:islami_project/utils/app_colors.dart';
import 'package:islami_project/utils/app_routes.dart';
import 'package:islami_project/utils/app_styles.dart';
import 'package:islami_project/utils/shared_prefrences_helper.dart';

class QuranTab extends StatefulWidget {
   QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
   List<int> filterList = List.generate(114, (index) => index,);

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
            style: AppStyles.bold16white,
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
            onChanged: (newText) {
              searchByNewText(newText);

            },
          ),
          SizedBox(height: height * 0.02,),
          MostRecentlyWidget(),
          SizedBox(height: height * 0.02,),
          Text('Suras List',style: AppStyles.bold16white,),
          SizedBox(height: height * 0.02,),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    saveLastSuraIndex(filterList[index]);
                    Navigator.of(context).pushNamed(AppRoutes.suraDetailsScreenName,
                    arguments: filterList[index]);
                  },
                    child: SuraItem(index: filterList[index],)
                );
              },
              separatorBuilder: (context, index){
                return Divider(
                  color: AppColors.whiteColor,
                  indent: width * 0.10,
                  endIndent: width * 0.10,
                );
              },
              itemCount: filterList.length
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

  void searchByNewText(String newText) {
    List<int> searchList = [];
    for(int i = 0 ; i < QuranResources.quranSurahsEnglish.length ; i++){
      if(QuranResources.quranSurahsEnglish[i].toLowerCase().contains(newText.toLowerCase())){
        searchList.add(i);
      }
      if(QuranResources.quranSurahsArabic[i].contains(newText)){
        searchList.add(i);
      }
    }
    filterList = searchList;
    setState(() {

    });
  }
}
