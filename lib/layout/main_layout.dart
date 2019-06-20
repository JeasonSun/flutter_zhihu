import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zhihu/pages/compus/compus_page.dart';
import 'package:flutter_zhihu/pages/home/home_page.dart';
import 'package:flutter_zhihu/pages/idea/idea_page.dart';
import 'package:flutter_zhihu/pages/me/me_page.dart';
import 'package:flutter_zhihu/pages/message/message_page.dart';

class MainLayout extends StatefulWidget {
  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    print('设备宽度:${ScreenUtil.screenWidth}'); //Device width
    print('设备高度:${ScreenUtil.screenHeight}'); //Device height
    print('设备的像素密度:${ScreenUtil.pixelRatio}'); //Device pixel density
    print(
        '底部安全区距离:${ScreenUtil.bottomBarHeight}'); //Bottom safe zone distance，suitable for buttons with full screen
    print(
        '状态栏高度:${ScreenUtil.statusBarHeight}px'); //Status bar height , Notch will be higher Unit px

    print('实际宽度的dp与设计稿px的比例:${ScreenUtil.getInstance().scaleWidth}');
    print('实际高度的dp与设计稿px的比例:${ScreenUtil.getInstance().scaleHeight}');

    print(
        '宽度和字体相对于设计稿放大的比例:${ScreenUtil.getInstance().scaleWidth * ScreenUtil.pixelRatio}');
    print(
        '高度相对于设计稿放大的比例:${ScreenUtil.getInstance().scaleHeight * ScreenUtil.pixelRatio}');
    print('系统的字体缩放比例:${ScreenUtil.textScaleFactory}');

    return Scaffold(
      body: IndexedStack(
        children: <Widget>[
          HomePage(),
          IdeaPage(),
          CompusPage(),
          MessagePage(),
          MePage()
        ],
        index: _currentIndex,
      ),
      bottomNavigationBar: CupertinoTabBar(
        items: <BottomNavigationBarItem>[
          _bottomItem(Icons.view_list, '首页', 0),
          _bottomItem(Icons.touch_app, '想法', 1),
          _bottomItem(Icons.school, '大学', 2),
          _bottomItem(Icons.notifications, '消息', 3),
          _bottomItem(Icons.person, '我', 4),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  _bottomItem(IconData icon, String title, int index) {
    return BottomNavigationBarItem(
        icon: Icon(
          icon,
          color: _defaultColor,
          size: ScreenUtil().setSp(38),
        ),
        activeIcon: Icon(
          icon,
          color: _activeColor,
          size: ScreenUtil().setSp(38),
        ),
        title: Text(title,
            style: TextStyle(
                fontSize: ScreenUtil().setSp(20),
                color: _currentIndex != index ? _defaultColor : _activeColor)));
  }
}
