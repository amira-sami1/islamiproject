import 'package:flutter/material.dart';
import 'package:islami_project/ui/home/tabs/hadeth/hadeth_tab.dart';
import 'package:islami_project/ui/home/tabs/quran/quran_tab.dart';
import 'package:islami_project/ui/home/tabs/radio/radio_tab.dart';
import 'package:islami_project/ui/home/tabs/sebha/sebha_tab.dart';
import 'package:islami_project/ui/home/tabs/time/time_tab.dart';
import 'package:islami_project/utils/app_assets.dart';
import 'package:islami_project/utils/app_colors.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<String> backgroundImages = [
    AppAssets.quranBg,
    AppAssets.hadethBg,
    AppAssets.sebhaBg,
    AppAssets.radioBg,
    AppAssets.timeBg,

  ];
  List<Widget> tabs = [
    QuranTab(), HadethTab(), SebhaTab(), RadioTab(), TimeTab()

  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;

    return Stack(
      children: [
        Image.asset(backgroundImages[selectedIndex], width: double.infinity,
          height: double.infinity
          ,
          fit: BoxFit.fill,),
        Scaffold(
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
                canvasColor: AppColors.primaryColor
            ),
            child: BottomNavigationBar(
                currentIndex: selectedIndex,
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {

                  });
                },
                // backgroundColor: AppColors.primaryColor,
                //   type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(

                      icon: builtBottomNavigationTab(
                          index: 0, iconName: AppAssets.iconQuran),
                      label: 'quran'
                  ),
                  BottomNavigationBarItem(
                      icon: builtBottomNavigationTab(
                          index: 1, iconName: AppAssets.iconHadeth),
                      label: 'Hadeth'
                  ),
                  BottomNavigationBarItem(
                      icon: builtBottomNavigationTab(
                          index: 2, iconName: AppAssets.iconSebha),
                      label: 'Sebha'
                  ),
                  BottomNavigationBarItem(
                      icon: builtBottomNavigationTab(
                          index: 3, iconName: AppAssets.iconRadio),
                      label: 'Radio'
                  ),
                  BottomNavigationBarItem(
                      icon: builtBottomNavigationTab(
                          index: 4, iconName: AppAssets.iconTime),
                      label: 'Time'
                  ),
                ]
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(top: height * 0.03),
                child: Image.asset(AppAssets.logo,
                  height: height * 0.15,
                  width: width * 0.69,
                ),
              ),
              Expanded(child: tabs[selectedIndex])
            ],
          ),
        ),
      ],
    );
  }

  Widget builtBottomNavigationTab(
      {required int index, required String iconName}) {
    return selectedIndex == index ?
    Container(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(66),
            color: AppColors.lightBlackColor
        ),
        child: ImageIcon(AssetImage(iconName))) :
    ImageIcon(AssetImage(iconName));
  }
}
