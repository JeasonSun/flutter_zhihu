import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zhihu/config/globalConstant.dart';
import 'package:flutter_zhihu/mock/card.dart';

class HomeRecommendListView extends StatefulWidget {
  @override
  _HomeRecommendListViewState createState() => _HomeRecommendListViewState();
}

class _HomeRecommendListViewState extends State<HomeRecommendListView> {
  List<Widget> get _getCardList {
    return cardList.map((card) => commonCardView(card)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 5.0),
        child: Column(
          children: _getCardList,
        ),
      ),
    );
  }

  Widget commonCardView(ArticleCard card) {
    List<Widget> cardBodyChildren = [];

    if (card.cardType == 'BIG_IMAGE') {
      cardBodyChildren.add(_sourceItem(card));
      cardBodyChildren.add(_postImage(card));
      cardBodyChildren.add(_articleContent(card));
    } else {
      if (card.articleImage != null) {
        cardBodyChildren.add(Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: _articleContent(card),
            ),
            Expanded(
              flex: 1,
              child: _smallImage(card),
            )
          ],
        ));
      } else {
        cardBodyChildren.add(_sourceItem(card));
        cardBodyChildren.add(_articleContent(card));
      }
    }

    Widget cardBody = Column(
      children: cardBodyChildren,
    );

    return Container(
      color: GlobalConstant.cardBackgroundColor,
      margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: FlatButton(
        onPressed: () {},
        child: Column(
          children: <Widget>[
            Container(
              child: Text(
                card.articleTitle,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: GlobalConstant.fontSize32,
                    height: 1.3,
                    color: GlobalConstant.fontTitleColor),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 6.0, bottom: 2.0),
            ),
            Container(
              child: cardBody,
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 6.0),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      card.footline,
                      style: TextStyle(
                          color: GlobalConstant.fontLightColor,
                          fontSize: GlobalConstant.fontSize24),
                    ),
                  ),
                  PopupMenuButton(
                    icon: Icon(
                      Icons.linear_scale,
                      color: GlobalConstant.fontLightColor,
                    ),
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuItem<String>>[
                          PopupMenuItem<String>(
                            value: '选项一',
                            child: Text('屏蔽这个问题'),
                          ),
                          PopupMenuItem<String>(
                            value: '选项二',
                            child: Text('不感兴趣'),
                          ),
                          PopupMenuItem<String>(
                            value: '选项三',
                            child: Text('分享'),
                          )
                        ],
                  )
                ],
              ),
              // padding: EdgeInsets.only(bottom: 10.0),
            )
          ],
        ),
      ),
    );
  }

  Widget _sourceItem(ArticleCard card) {
    return Container(
      padding: EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage(card.sourceAvatar),
            radius: 12.0,
          ),
          Container(
            margin: EdgeInsets.only(left: 10.0, right: 10.0),
            child: Text(
              card.sourceName,
              style: TextStyle(
                fontSize: GlobalConstant.fontSize24,
                color: GlobalConstant.fontDarkColor,
              ),
            ),
          ),
          card.sourceIcon != null
              ? CircleAvatar(
                  backgroundImage: NetworkImage(card.sourceIcon),
                  radius: 8.0,
                )
              : SizedBox(),
          Container(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                card.sourceTitle ?? '',
                style: TextStyle(
                  color: GlobalConstant.fontLightColor,
                  fontSize: GlobalConstant.fontSize24,
                ),
              )),
        ],
      ),
    );
  }

  Widget _articleContent(ArticleCard card) {
    return Container(
        child: Text(
          card.articleContent,
          style: TextStyle(
              color: GlobalConstant.fontContentColor,
              fontSize: GlobalConstant.fontSize26,
              height: 1.2),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        padding: EdgeInsets.only(bottom: 2.0));
  }

  Widget _postImage(ArticleCard card) {
    return LimitedBox(
      maxHeight: ScreenUtil().setSp(394),
      child: Container(
        width: double.infinity,
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.all(Radius.circular(10.0)),
          image: new DecorationImage(
              image: new NetworkImage(card.articleImage), fit: BoxFit.cover),
        ),
        alignment: Alignment.center,
        margin: EdgeInsets.only(bottom: 10.0),
      ),
    );
  }

  Widget _smallImage(ArticleCard card) {
    return AspectRatio(
      aspectRatio: 3.0 / 2.0,
      child: Container(
        margin: EdgeInsets.only(left: 10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
            image: DecorationImage(
                image: NetworkImage(card.articleImage), fit: BoxFit.cover)),
      ),
    );
  }
}
