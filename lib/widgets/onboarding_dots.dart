import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../app_theme.dart';

class DotIndicator extends StatelessWidget {
  final bool isActive;
  const DotIndicator({ required this.isActive});
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 4),
      height: 10,
      width: isActive ? 20 : 10,
      decoration: BoxDecoration(
        color: isActive ? AppTheme.primaryColor : Colors.grey.withValues(alpha: 0.6) ,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}

