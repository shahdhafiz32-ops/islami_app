import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InactiveNavbarIcon extends StatelessWidget {

  String iconName;
  InactiveNavbarIcon({required this.iconName});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset("assets/icons/$iconName.svg", height: 28,width: 28,fit: BoxFit.scaleDown,);
  }
}
