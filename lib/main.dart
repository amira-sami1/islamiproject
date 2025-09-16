import 'package:flutter/material.dart';
import 'package:islami_project/providers/most_recent_provider.dart';
import 'package:islami_project/ui/home/home_screen.dart';
import 'package:islami_project/ui/home/tabs/quran/sura_details/sura_details_screen.dart';
import 'package:islami_project/ui/home/tabs/quran/sura_details1/sura_details_screen1.dart';
import 'package:islami_project/ui/introduction/intro_screen.dart';
import 'package:islami_project/utils/app_routes.dart';
import 'package:islami_project/utils/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => MostRecentProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.introScreenName,
      routes: {
        AppRoutes.introScreenName: (context) => IntroScreen(),
        AppRoutes.homeRouteName: (context) => HomeScreen(),
        AppRoutes.suraDetailsScreenName: (context) => SuraDetailsScreen(),


      },
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
