import 'package:flutter/material.dart';
import 'package:flutter_zhihu/pages/home/home_follow_listview.dart';
import 'package:flutter_zhihu/pages/home/home_hotrank_listview.dart';
import 'package:flutter_zhihu/pages/home/home_recement_listview.dart';
import 'package:flutter_zhihu/pages/home/home_video_listview.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, initialIndex: 1, length: 4);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: barSearch(),
        elevation: 0,
        bottom: new TabBar(
          controller: _tabController,
          indicatorColor: Colors.black,
          tabs: <Widget>[
            new Tab(
              text: '关注',
            ),
            new Tab(
              text: '推荐',
            ),
            new Tab(
              text: '热榜',
            ),
            new Tab(
              text: '视频',
            ),
          ],
        ),
      ),
      body: new TabBarView(
        controller: _tabController,
        children: <Widget>[
          HomeFollowListView(),
          HomeRecementListView(),
          HomeHotRankListView(),
          HomeVideoListView()
        ],
      ),
    );
  }

  final askButton = FlatButton.icon(
    onPressed: () {},
    icon: Icon(
      Icons.mode_edit,
      size: 16.0,
      color: Colors.blue,
    ),
    label: Text(
      '提问',
      style: TextStyle(color: Colors.blue),
    ),
  );

  Widget barSearch() {
    return new Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: FlatButton.icon(
              color: Colors.black12,
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: 16.0,
                color: Colors.grey,
              ),
              label: Text(
                '搜索',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ),
        askButton
      ],
    );
  }
}
