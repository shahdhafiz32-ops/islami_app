import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_application/tabs/quran/most_recently_section.dart';
import 'package:islami_application/tabs/quran/quran_service.dart';
import 'package:islami_application/tabs/quran/sura.dart';
import 'package:islami_application/tabs/quran/sura_details_screen.dart';
import 'package:islami_application/tabs/quran/sura_item.dart';

import '../../../app_theme.dart';

class QuranTab extends StatefulWidget {
  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: .start,
      children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: TextField(
            style: textTheme.titleMedium,
            decoration: InputDecoration(prefixIcon: SvgPicture.asset('assets/icons/quran.svg',
              colorFilter: ColorFilter.mode(AppTheme.primaryColor, BlendMode.srcIn),
              height: 24,
              width: 24,
              fit: .scaleDown,
            ),
              hintText: "Sura Name",
            ),
            onChanged: (query){
              QuranService.searchSura(query);
              setState(() {});
            },
          ),
        ),
        MostRecentlySection(),
        SizedBox(height: 16,)
        ,
        Padding(
          padding: EdgeInsets.only(left: 20,bottom: 10),
        child:
        Text("Suras List", style: textTheme.titleMedium
        ),
        ),
        Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 20),
              itemBuilder: (_,index) {
                Sura sura = QuranService.suraSearchResults[index];
               return GestureDetector(
                  onTap: () async {
                    QuranService.addSuraToMostRecently(sura);
                    await Navigator.of(context).pushNamed(
                        SuraDetailsScreen.routeName, arguments: sura);
                    setState(() {});
                  },
                  child: SuraItem(sura),
                );
              },
              itemCount: QuranService.suraSearchResults.length,
              separatorBuilder: ( (_, _) => Divider(thickness: 1,height: 20,indent: 32,endIndent: 32,)),
            )
        )
      ],
    );
  }
}
