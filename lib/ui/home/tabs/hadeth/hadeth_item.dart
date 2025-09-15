import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_project/model/hadeth.dart';
import 'package:islami_project/utils/app_assets.dart';
import 'package:islami_project/utils/app_colors.dart';
import 'package:islami_project/utils/app_styles.dart';

class HadethItem extends StatefulWidget {
  final int index;
   HadethItem({super.key,required this.index});

  @override
  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {
  Hadeth? hadeth;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadHadethFile();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(
        left: width * 0.02,
        right: width * 0.02,
        top: height * 0.01
      ),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(AppAssets.hadethDetailsBg)),
        borderRadius: BorderRadius.circular(20),
        color: AppColors.primaryColor
      ),
      child: hadeth == null?
          Center(
            child: CircularProgressIndicator(
              color: AppColors.lightBlackColor,
            ),
          )
          :
      Column(
        children: [
          Row(
            children: [
              Image.asset(AppAssets.hadethLeftCorner,width: width * 0.16,),
              Expanded(
                child: Text(hadeth?.title?? '',
                  textAlign: TextAlign.center,
                  style: AppStyles.bold24black,),
              ),
              Image.asset(AppAssets.hadethRightCorner,width: width * 0.16,),
            ],
          ),
          SizedBox(height: height * 0.02,),
          Expanded(
            child: SingleChildScrollView(
              child: Text(hadeth?.content?? '',
              textAlign: TextAlign.center,
              style: AppStyles.bold16black,),
            ),
          ),
          Image.asset(AppAssets.hadethMosque),

        ],
      ),
    );
  }
  void loadHadethFile()async{
    String fileContent = await rootBundle.loadString('assets/files/hadeeth/h${widget.index}.txt');
    int fileLineIndex = fileContent.indexOf('\n');
    String title = fileContent.substring(0,fileLineIndex);
    String content = fileContent.substring(fileLineIndex+1);
    hadeth = Hadeth(title: title, content: content);
    await Future.delayed(Duration(seconds: 1));
    setState(() {

    });
  }
}
