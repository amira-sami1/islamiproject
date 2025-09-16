import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_project/providers/most_recent_provider.dart';
import 'package:islami_project/ui/home/tabs/quran/quran_resources.dart';
import 'package:islami_project/ui/home/tabs/quran/sura_details/sura_content.dart';
import 'package:islami_project/ui/home/tabs/quran/sura_details1/sura_details_screen1.dart';
import 'package:islami_project/utils/app_assets.dart';
import 'package:islami_project/utils/app_colors.dart';
import 'package:islami_project/utils/app_routes.dart';
import 'package:islami_project/utils/app_styles.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  const SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];
  late MostRecentProvider mostRecentProvider;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    mostRecentProvider.readMostRecentList();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    mostRecentProvider = Provider.of<MostRecentProvider>(context);

    int index = ModalRoute.of(context)!.settings.arguments as int;
    if (verses.isEmpty) loadSuraFile(index);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          QuranResources.quranSurahsEnglish[index],
          style: AppStyles.bold20primary,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => SuraDetailsScreen1(),
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
          image: DecorationImage(
            image: AssetImage(AppAssets.detailsBg),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: height * 0.02),
          child: Column(
            children: [
              Text(
                QuranResources.quranSurahsArabic[index],
                style: AppStyles.bold24primary,
              ),
              Expanded(
                child: verses.isEmpty
                    ? Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                )
                    : ListView.separated(
                  padding: EdgeInsets.only(top: height * 0.07),
                  itemBuilder: (context, i) {
                    return SuraContent(content: verses[i], index: i);
                  },
                  separatorBuilder: (context, i) =>
                      SizedBox(height: height * 0.02),
                  itemCount: verses.length,
                ),
              ),
              SizedBox(height: height * 0.10,),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> loadSuraFile(int index) async {
    String fileContent =
    await rootBundle.loadString('assets/files/quran/${index + 1}.txt');
    List<String> suraContent = fileContent.split('\n');
    verses = suraContent;
    Future.delayed(Duration(seconds: 1),() => setState(() {
    }),);
  }
}
