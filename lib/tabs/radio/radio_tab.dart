import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_application/app_theme.dart';
import 'package:islami_application/tabs/radio/radio_card.dart';

class RadioTab extends StatelessWidget {
  List<String> radioNames = [
    "Radio Ibrahim Al-Akdar",
    "Radio Al-Qaria Yassen",
    "Radio Ahmed Al-trabulsi",
    "Radio Addokali Mohammad Alalim",
    "Radio Al-Hussary",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: AppTheme.black.withValues(alpha: 0.6),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: .center,
                    decoration: BoxDecoration(
                      color: AppTheme.primaryColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text("Radio",style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppTheme.white),),
                  ),
                ),
                 Expanded(
                  child: Center(
                    child: Text("Reciters",style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppTheme.white),),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 16),
            itemCount: radioNames.length,
            separatorBuilder: (_, _) => SizedBox(height: 16),
            itemBuilder: (_, index) => RadioCard(isActive: index == 1, text: radioNames[index],),
          ),
        ),
      ],
    );
  }
}