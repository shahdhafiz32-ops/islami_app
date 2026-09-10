import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:islami_application/tabs/hadeeth/hadeeth_item.dart';

class HadeethTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24),
      child: CarouselSlider.builder(
          itemCount: 50,
          itemBuilder: (_, index,_) =>
              HadeethItem(index: index,),
        options: CarouselOptions(
                height: double.infinity,
                enlargeCenterPage: true,
                enlargeFactor: 0.2,
      ),),
    );
  }
}
