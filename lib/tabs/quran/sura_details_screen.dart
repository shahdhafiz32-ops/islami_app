import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_application/app_theme.dart';
import 'package:islami_application/tabs/quran/quran_service.dart';
import 'package:islami_application/tabs/quran/sura.dart';
import 'package:islami_application/widgets/loading_indicator.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const routeName = '/sura-details';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  late Sura sura;
  List<String> ayat = [];

  @override
  Widget build(BuildContext context) {
    sura = ModalRoute.of(context)!.settings.arguments as Sura;
    if(ayat.isEmpty) {
      readSura();
    }
    double screenHeight = MediaQuery.sizeOf(context).height;
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(sura.nameEN),
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
                Text(sura.nameAR,
                  style: textTheme.headlineSmall?.copyWith(color: AppTheme.primaryColor),),
                Image.asset("assets/images/sura_right_corner.png",
                  height: screenHeight*0.1,
                  fit: .fill
                  ,)
              ],
            ),
            Expanded(
                child:
                    ayat.isEmpty? LoadingIndicator():
                  ListView.separated(
                    itemBuilder: (_,index) => Text(ayat[index],
                      style: textTheme.titleLarge?.copyWith(color: AppTheme.primaryColor),
                      textAlign: .center,
                    ),
                    itemCount: ayat.length,
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

  Future<void> readSura() async{
    String suraContent = await QuranService.readSuraFileContent(sura.num);
    ayat= suraContent.split('\r\n');
    setState(() {});
  }
}
