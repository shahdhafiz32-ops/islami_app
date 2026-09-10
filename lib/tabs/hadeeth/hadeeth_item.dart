import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_application/app_theme.dart';
import 'package:islami_application/tabs/hadeeth/hadeeth.dart';
import 'package:islami_application/tabs/hadeeth/hadeeth_details.dart';
import 'package:islami_application/widgets/loading_indicator.dart';

class HadeethItem extends StatefulWidget {
  int index;
  HadeethItem({required this.index});

  @override
  State<HadeethItem> createState() => _HadeethItemState();
}

class _HadeethItemState extends State<HadeethItem> {
  Hadeeth? hadeeth;

  @override
  Widget build(BuildContext context) {
    if(hadeeth == null){
      loadHadeeth();
    }
    double screenHeight = MediaQuery.sizeOf(context).height;
    TextTheme textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(HadeethDetails.routeName, arguments:  hadeeth);
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 16,left: 16,right: 16),
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Image.asset("assets/images/hadeeth_left_corner.png",height: screenHeight*0.1,fit: .fill,width: MediaQuery.sizeOf(context).width * 0.18),
                  Expanded(child: Text(hadeeth?.title ?? " ", style: textTheme.headlineSmall,textAlign: .center,))
                  ,
                  Image.asset("assets/images/hadeeth_right_corner.png", height: screenHeight*0.1,fit: .fill,width: MediaQuery.sizeOf(context).width * 0.18),
                ],
              ),
            ),
            Expanded(
                child:
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("assets/images/hadeeth_icon_background.png"))
                      ),
                      child:
                        hadeeth == null? LoadingIndicator():
                      ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        itemBuilder: (_,index) => Text(hadeeth!.content[index],style: textTheme.titleMedium?.copyWith(color: AppTheme.black),textAlign: .center,),
                        itemCount: hadeeth!.content.length,
                        separatorBuilder: (_, _) => SizedBox(height: 8,),),
                    ),
            ),
            Image.asset("assets/images/hadeeth_footer.png",width: double.infinity,fit: .fill,),
          ],
      ),
      ),
    );
  }

  Future<void> loadHadeeth() async{
    String hadeethContent = await rootBundle.loadString("assets/text/h${widget.index+1}.txt");
    List<String> hadeethLines = hadeethContent.split("\n");
    String title = hadeethLines[0];
    hadeethLines.removeAt(0);
    List<String> content = hadeethLines;
    hadeeth  = Hadeeth(title: title, content: content, num: widget.index+1);
    setState(() {});
  }
}
