import 'package:flutter/material.dart';
import 'package:islami_project/ui/home/home_screen.dart';
import 'package:islami_project/ui/home/tabs/quran/sura_details/sura_details_screen.dart';
import 'package:islami_project/ui/home/tabs/quran/sura_details1/sura_details_screen1.dart';
import 'package:islami_project/utils/app_routes.dart';
import 'package:islami_project/utils/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homeRouteName,
      routes: {
        AppRoutes.homeRouteName: (context) => HomeScreen(),
        AppRoutes.suraDetailsScreenName: (context) => SuraDetailsScreen(),


      },
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
