import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  _bottomItem(IconData icon, String title, int index) {
    return BottomNavigationBarItem(
        icon: Icon(icon, color: _defaultColor, size: 25.0,),
        activeIcon: Icon(
          icon,
          color: _activeColor,
          size: 25.0,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: _currentIndex != index ? _defaultColor: _activeColor
          )
        )
        );
  }
}
