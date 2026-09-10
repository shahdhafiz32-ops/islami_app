import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../app_theme.dart';

class OnboardingContent extends StatelessWidget {
   String image;
   String title;
   String desc;

   OnboardingContent({required this.image, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Image.asset(
            'assets/images/islami_header.png',
            height: MediaQuery.sizeOf(context).height * 0.15,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: .start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Image.asset(image, fit: .contain,),
                ),
                SizedBox(height: 60),
                Text(title,style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: AppTheme.primaryColor),),
                SizedBox(height: 12),
                Text(desc,style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppTheme.primaryColor, fontSize: 20),textAlign: .center,),
              ],
            ),
          ),
        ],
      )
    );
  }
}