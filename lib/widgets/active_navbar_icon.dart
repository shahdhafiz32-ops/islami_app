import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_application/app_theme.dart';

class ActiveNavbarIcon extends StatelessWidget {
  String iconName;
  ActiveNavbarIcon({required this.iconName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: AppTheme.black.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(66)
      ),
      child:
      SvgPicture.asset(
        "assets/icons/$iconName.svg", height: 22,width: 22,fit: BoxFit.scaleDown, colorFilter: ColorFilter.mode(AppTheme.white, BlendMode.srcIn),
      )
      ,
    );
      }
}
