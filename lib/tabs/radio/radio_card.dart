import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../app_theme.dart';

class RadioCard extends StatelessWidget {
   bool isActive;
   String text;

   RadioCard({
    required this.isActive,required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 133,
      decoration: BoxDecoration(
        color: AppTheme.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(text,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Expanded(
            child: Stack(
              alignment: .center,
              children: [
                Image.asset(
                  isActive? "assets/images/card_playing_background.png"
                      : "assets/images/hadeeth_footer.png",
                  width: double.infinity,
                  fit: .cover,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      isActive? "assets/icons/Pause.svg"
                          : "assets/icons/play.svg",
                      width: 24,
                      height: 32,
                    ),
                    SizedBox(width: 16),
                    SvgPicture.asset(
                      isActive
                          ? "assets/icons/mute.svg"
                          : "assets/icons/sound_on.svg",
                      width: 30,
                      height: 30,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}