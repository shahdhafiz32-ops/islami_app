import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_application/tabs/quran/most_recently_item.dart';
import 'package:islami_application/tabs/quran/quran_service.dart';

class MostRecentlySection extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: QuranService.mostRecentlySuras.isNotEmpty,
      child: Padding(
        padding: EdgeInsets.only(left: 16,bottom: 16),
        child: Column(
          crossAxisAlignment: .start,
          children: [
          Text("Most Recently",
            style: Theme.of(context).textTheme.titleMedium,),
          SizedBox(height: 8,),
          SizedBox
            ( height: MediaQuery.sizeOf(context).height *0.16,
              child: ListView.separated(
            itemBuilder: (_,index) => MostRecentlyItem(QuranService.mostRecentlySuras.reversed.toList()[index]),
            itemCount: QuranService.mostRecentlySuras.length ,
            scrollDirection: .horizontal,
                separatorBuilder: (_, _) => SizedBox(width: 8)
                ,)
          )
        ],),
      ),
    );
  }
}
