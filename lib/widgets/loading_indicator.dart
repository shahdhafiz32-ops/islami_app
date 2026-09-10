import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../app_theme.dart';

class LoadingIndicator extends StatelessWidget {
  Color color;
  LoadingIndicator([this.color = AppTheme.primaryColor]);

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(backgroundColor: AppTheme.black,color: color,),);
  }
}
