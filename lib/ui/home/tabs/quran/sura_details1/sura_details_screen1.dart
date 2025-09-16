import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_project/ui/home/tabs/quran/quran_resources.dart';
import 'package:islami_project/ui/home/tabs/quran/sura_details/sura_details_screen.dart';
import 'package:islami_project/ui/home/tabs/quran/sura_details1/sura_content1.dart';
import 'package:islami_project/utils/app_assets.dart';
import 'package:islami_project/utils/app_colors.dart';
import 'package:islami_project/utils/app_styles.dart';

class SuraDetailsScreen1 extends StatefulWidget {
  SuraDetailsScreen1({super.key});

  @override
  State<SuraDetailsScreen1> createState() => _SuraDetailsScreen1State();
}

class _SuraDetailsScreen1State extends State<SuraDetailsScreen1> {
  String suraLines = '';

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    int index = ModalRoute.of(context)!.settings.arguments as int;
    if( suraLines.isEmpty) {
      loadSuraFile(index);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(QuranResources.quranSurahsEnglish[index],
          style: AppStyles.bold20primary,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.view_agenda), // أيقونة ترجع للشكل الأول
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => SuraDetailsScreen(),
                  settings: RouteSettings(arguments: index),
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: AppColors.lightBlackColor,
          image: DecorationImage(image: AssetImage(AppAssets.detailsBg),
              fit: BoxFit.fill
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: height * 0.04
          ),
          child: Column(
            children: [
              Text(QuranResources.quranSurahsArabic[index],
                style: AppStyles.bold24primary,
              ),
              Expanded(
                  child: suraLines.isEmpty?
                      CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      )
                      :
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.04),
                    child: SingleChildScrollView(
                        child: SuraContent1(
                            content: suraLines
                        ),
                    ),
                  ),
              ),
              SizedBox(height: height * 0.10,),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> loadSuraFile(int index)async{
    String fileContent = await rootBundle.loadString('assets/files/quran/${index+1}.txt');
    List<String> suraContent = fileContent.split('\n');
    for(int i = 0 ; i < suraContent.length ; i++){
      suraContent[i] += '[${i + 1}]';
    }
    suraLines=suraContent.join();
    setState(() {

    });
  }
}
