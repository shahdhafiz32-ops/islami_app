import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../app_theme.dart';
import 'hadeeth.dart';

class HadeethDetails extends StatelessWidget {

  static const routeName = "/hadeeth-details";
  @override
  Widget build(BuildContext context) {
    Hadeeth hadeeth = ModalRoute.of(context)!.settings.arguments as Hadeeth;
    double screenHeight = MediaQuery.sizeOf(context).height;
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text("Hadeeth ${hadeeth.num}"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Image.asset("assets/images/sura_left_corner.png",
                  height: screenHeight*0.1,
                  fit: .fill
                  ,),
                Text(hadeeth.title,
                  style: textTheme.headlineSmall?.copyWith(color: AppTheme.primaryColor),),
                Image.asset("assets/images/sura_right_corner.png",
                  height: screenHeight*0.1,
                  fit: .fill
                  ,)
              ],
            ),
            Expanded(
                child:
                ListView.separated(
                  itemBuilder: (_,index) => Text(hadeeth.content[index],
                    style: textTheme.titleLarge?.copyWith(color: AppTheme.primaryColor),
                    textAlign: .center,
                  ),
                  itemCount: hadeeth.content.length,
                  separatorBuilder: (_, _) => SizedBox(height: 8,),
                )
            ),
            Image.asset("assets/images/details_footer.png",
              height: screenHeight*0.11,
              width:double.infinity,
              fit: .fill,)
          ],
        ),
      ),
    );
  }
}
