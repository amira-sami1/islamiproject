import 'package:flutter/material.dart';
import 'package:islami_project/utils/app_colors.dart';
import 'package:islami_project/utils/app_styles.dart';

class SuraContent extends StatefulWidget {
  final String content;
  final int index;

  const SuraContent({
    super.key,
    required this.content,
    required this.index,
  });

  @override
  State<SuraContent> createState() => _SuraContentState();
}

class _SuraContentState extends State<SuraContent> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: width * 0.06),
        padding: EdgeInsets.symmetric(vertical: height * 0.02),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : AppColors.transparentColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: isSelected ? AppColors.primaryColor : Colors.grey,
            width: 1,
          ),
        ),
        child: Text(
          '${widget.content} [${widget.index + 1}]',
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
          style: AppStyles.bold20primary.copyWith(
            color: isSelected ? AppColors.blackColor : AppColors.primaryColor,
          ),

        ),
      ),
    );
  }
}
