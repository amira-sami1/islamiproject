import 'package:flutter/material.dart';
import 'package:islami_project/utils/app_styles.dart';

class SuraContent1 extends StatelessWidget {
  final String content;
  const SuraContent1({required this.content,});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: width * 0.04
      ),
      child: Text(content,
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
          style: AppStyles.bold20primary,),
    );
  }
}
