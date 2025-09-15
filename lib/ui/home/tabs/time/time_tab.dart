import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_project/utils/app_assets.dart';
import 'package:islami_project/utils/app_colors.dart';
import 'package:islami_project/utils/app_styles.dart';

class TimeTab extends StatefulWidget {
  const TimeTab({super.key});

  @override
  State<TimeTab> createState() => _TimeTabState();
}

class _TimeTabState extends State<TimeTab> {
  int currentIndex = 0;

  final List<Map<String, String>> prayers = [
    {'name': 'Fajr', 'time': '04:15'},
    {'name': 'Dhuhr', 'time': '12:30'},
    {'name': 'Asr', 'time': '03:45'},
    {'name': 'Maghrib', 'time': '06:20'},
    {'name': 'Isha', 'time': '07:45'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      AppAssets.timeCard,
                    ),
                  ),

                  Positioned(
                    top: 10,
                    left: 0,
                    right: 0,
                    child: Row(
                      children: [
                        const SizedBox(width: 40),
                        Column(
                          children: [
                            Text('16 Jul,', style: AppStyles.bold16white),
                            Text('2024', style: AppStyles.bold16white),
                          ],
                        ),
                        const SizedBox(width: 60),
                        Expanded(
                          child: Column(
                            children: [
                              Text('Pray Time', style: AppStyles.bold20brown),
                              Text('Tuesday', style: AppStyles.bold20black),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text('09 Muh,', style: AppStyles.bold16white),
                              Text('1446', style: AppStyles.bold16white),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Positioned(
                    top: 100,
                    left: 10,
                    right: 10,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 150,
                          child: CarouselSlider.builder(
                            itemCount: prayers.length,
                            options: CarouselOptions(
                              height: 130,
                              enlargeCenterPage: false,
                              viewportFraction: 0.3,
                              scrollDirection: Axis.horizontal,
                              onPageChanged: (index, reason) {
                                setState(() => currentIndex = index);
                              },
                            ),
                            itemBuilder: (context, index, realIdx) {
                              bool isCenter = index == currentIndex;
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: Transform.translate(
                                  offset: Offset(0, isCenter ? -10 : 0),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 3),
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Color(0xFF202020),
                                          Color(0xFFB19768),
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          prayers[index]['name']!,
                                          style: AppStyles.bold16white,
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          prayers[index]['time']!,
                                          style: TextStyle(
                                            fontSize: isCenter ? 32 : 24,
                                            color: AppColors.whiteColor,
                                          ),
                                        ),
                                        Text('PM',style: AppStyles.bold16white,)
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 100.0),
                                child: Text(
                                  'Next Pray - ${prayers[(currentIndex + 1) % prayers.length]['time']}',
                                  style: AppStyles.bold16black,
                                ),
                              ),
                              Spacer(),
                              Icon(Icons.volume_off),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(height: 20,),
            Text('Azkar',style: AppStyles.bold16white,),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(9.0),
                child: Row(
                  children: [
                    Image.asset(AppAssets.eveningAzkar),
                    SizedBox(width: 20,),
                    Image.asset(AppAssets.morningAzkar)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}