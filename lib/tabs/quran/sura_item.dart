import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_application/app_theme.dart';
import 'package:islami_application/tabs/quran/quran_service.dart';
import 'package:islami_application/tabs/quran/sura.dart';
import 'package:islami_application/tabs/quran/sura_details_screen.dart';

class SuraItem extends StatelessWidget {
Sura sura;
SuraItem(this.sura);
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset("assets/icons/sura_number_frame.svg", height: 52,width: 52,fit: BoxFit.scaleDown,),
            Text("${sura.num}", style: textTheme.titleLarge?.copyWith(color: AppTheme.white),),
          ],
        ),
        SizedBox(width: 24,),
        Column(
          crossAxisAlignment: .start,
          children: [
            Text("${sura.nameEN}", style: textTheme.titleLarge?.copyWith(color: AppTheme.white)),
            Text("${sura.ayatCount} Verses", style: textTheme.titleSmall),
          ],
        ),
        Spacer(),
        Text("${sura.nameAR}", style: textTheme.titleLarge?.copyWith(color: AppTheme.white))
      ],
    );
  }
}
