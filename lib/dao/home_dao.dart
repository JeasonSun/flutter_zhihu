import 'package:dio/dio.dart';
import 'package:flutter_zhihu/model/home_hotrank_model.dart';

const HOME_HOTRANK_URL = 'https://www.zhihu.com/api/v3/feed/topstory/hot-list-web?limit=50&desktop=true';

class HomeHotrankDao {
  static Future fetch() async {
    Response response = await Dio().get(HOME_HOTRANK_URL);
    if( response.statusCode == 200){
      return HomeHotRankListModel.fromJson(response.data);
    } else {
      throw Exception('Failed To load home_hotrank.json');
    }
  }
}