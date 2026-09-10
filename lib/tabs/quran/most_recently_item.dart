import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_application/app_theme.dart';
import 'package:islami_application/tabs/quran/sura.dart';

class MostRecentlyItem extends StatelessWidget {
  Sura sura;
  MostRecentlyItem(this.sura);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Size screenSize = MediaQuery.sizeOf(context);
    return Container(
      padding: EdgeInsets.only(left: 16,right: 8),
      decoration: BoxDecoration(color: AppTheme.primaryColor,
      borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: .center,
            children: [
              Text(sura.nameEN,
                style: textTheme.headlineSmall,),
              Text(sura.nameAR,
                style: textTheme.headlineSmall,),
              SizedBox(height: 8,),
              Text("${sura.ayatCount} Verses",
                style: textTheme.titleSmall?.copyWith(color: AppTheme.black),),
          ]
          ),
          Image.asset("assets/images/most_recently.png",
          height:screenSize.height *0.14,
          width: screenSize.width *0.3 ,
          fit: .fill,)
        ],
      ),
    );
  }
}
