import 'package:flutter/material.dart';
import 'package:flutter_zhihu/dao/home_dao.dart';
import 'package:flutter_zhihu/model/home_hotrank_model.dart';
import 'package:flutter_zhihu/util/util.dart';

class HomeHotRankListView extends StatefulWidget {
  @override
  _HomeHotRankListViewState createState() => _HomeHotRankListViewState();
}

class _HomeHotRankListViewState extends State<HomeHotRankListView> {
  HomeHotRankListModel ranklist;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ranklist?.data?.length ?? 0,
      itemBuilder: (BuildContext context, int position) {
        return _item(position);
      },
    );
  }

  void _getData() async {
    try {
      HomeHotRankListModel ranklistmodel = await HomeHotrankDao.fetch();
      setState(() {
        ranklist = ranklistmodel;
      });
    } catch (e) {
      print(e);
    }
  }

  Widget _item(int position) {
    if (ranklist == null || ranklist.data == null) return null;
    HomeHotRankModel item = ranklist.data[position];
    // print(item.target.image.url);
    int order = position + 1;
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: BorderDirectional(
                bottom: BorderSide(color: Colors.black12, width: 1.0))),
        child: FlatButton(
          onPressed: () {},
          child: Container(
            padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 30.0,
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Text(
                          order.toString(),
                          style: TextStyle(
                              color: order <= 3
                                  ? hexToColor("#de4f45")
                                  : hexToColor("#c1ab7a"),
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        ),
                        alignment: Alignment.topLeft,
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: EdgeInsets.only(right: 6.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Text(
                            item?.target?.title?.text ?? '',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                                color: Colors.black),
                          ),
                          padding: EdgeInsets.only(
                            bottom: 10.0,
                            right: 4.0,
                          ),
                          alignment: Alignment.topLeft,
                        ),
                        (item?.target?.excerpt?.text ?? '').isNotEmpty
                            ? Container(
                                child: Text(
                                  item?.target?.excerpt?.text,
                                  style: TextStyle(fontSize: 14.0),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                alignment: Alignment.topLeft,
                              )
                            : Container(),
                        Container(
                          child: Text(
                            item?.target?.metrics?.text ?? '',
                            style: TextStyle(color: Colors.grey),
                          ),
                          alignment: Alignment.topLeft,
                        )
                      ],
                    ),
                  ),
                ),
                (item?.target?.image?.url ?? '').isNotEmpty
                    ? Expanded(
                        flex: 3,
                        child: Center(
                          child: AspectRatio(
                            aspectRatio: 3.0 / 2.0,
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          item?.target?.image?.url),
                                      fit: BoxFit.cover
                                      // centerSlice: Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                                      ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6.0))),
                            ),
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
