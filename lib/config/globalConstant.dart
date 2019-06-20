
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zhihu/util/util.dart';

class GlobalConstant {
  static Color fontContentColor = hexToColor('#3b3b3b');
  static Color fontTitleColor = hexToColor('#151515');
  static Color fontLightColor = hexToColor('#a9a9a9');
  static Color fontDarkColor = hexToColor('#666666');
  static Color cardBackgroundColor = Colors.white;

  static double fontSize32 = ScreenUtil().setSp(32);
  static double fontSize30 = ScreenUtil().setSp(30);
  static double fontSize26 = ScreenUtil().setSp(26);
  static double fontSize24 = ScreenUtil().setSp(24);
}