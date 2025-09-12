import 'package:flutter/material.dart';
import 'package:islami_project/utils/app_assets.dart';
import 'package:islami_project/utils/app_styles.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int count = 0;
  int index = 0;
  double rotationTurns = 0.0;

  final tasbeehList = [
    "سبحان الله",
    "الحمد لله",
    "لا إله إلا الله",
    "الله أكبر",
  ];

  void _increment() {
    setState(() {
      count++;
      rotationTurns += 1 / 33;
      if (count == 33) {
        count = 0;
        index = (index + 1) % tasbeehList.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final double outerSize = screenWidth * 0.9;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('سَبِّحِ اسْمَ رَبِّكَ الأعلى ', style: AppStyles.bold36white),
            SizedBox(height: 60),
            GestureDetector(
              onTap: _increment,
              child: SizedBox(
                width: outerSize,
                height: outerSize + 40,
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: -55,
                      left: (outerSize / 2) - 10,
                      child: Image.asset(AppAssets.sebhaHead, width: 80),
                    ),
                    AnimatedRotation(
                      turns: rotationTurns,
                      duration: Duration(milliseconds: 220),
                      curve: Curves.easeOut,
                      child: Image.asset(AppAssets.sebhaRing, width: outerSize),
                    ),

                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(tasbeehList[index], style: AppStyles.bold36white),
                        SizedBox(height: 8),
                        Text("$count", style: AppStyles.bold36white),
                      ],
                    ),
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
