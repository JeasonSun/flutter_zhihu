import 'package:flutter/material.dart';

class HomeHotRankListModel {
  final List<HomeHotRankModel> data;

  HomeHotRankListModel({this.data});

  factory HomeHotRankListModel.fromJson(Map<String, dynamic> json) {
    var dataJson = json['data'] as List;
    List<HomeHotRankModel> data =
        dataJson.map((item) => HomeHotRankModel.fromJson(item)).toList();

    return HomeHotRankListModel(data: data);
  }
}

class HomeHotRankModel {
  final TargetModel target;

  HomeHotRankModel({this.target});

  factory HomeHotRankModel.fromJson(Map<String, dynamic> json) {
    TargetModel target = TargetModel.fromJson(json['target']);
    return HomeHotRankModel(target: target);
  }
}

class TargetModel {
  final LabelModel label;
  final CommonModel metrics;
  final CommonModel title;
  final CommonModel excerpt;
  final CommonModel image;
  final CommonModel link;

  TargetModel({this.label, this.metrics, this.title, this.excerpt, this.image, this.link});

  factory TargetModel.fromJson(Map<String, dynamic> json){
    return TargetModel(
      label: LabelModel.fromJson(json['label_area']),
      metrics: CommonModel.fromJson(json['metrics_area']),
      excerpt: CommonModel.fromJson(json['excerpt_area']),
      title: CommonModel.fromJson(json['title_area']),
      image: CommonModel.fromJson(json['image_area']),
      link: CommonModel.fromJson(json['link']),
    );
  }
}

class LabelModel {
  final int trend;
  final String type;
  final String nightColor;
  final String normalColor;

  LabelModel({this.trend, this.type, this.nightColor, this.normalColor});

  factory LabelModel.fromJson(Map<String, dynamic> json){
    return LabelModel(
      trend: json['trend'],
      type: json['type'],
      nightColor: json['night_color'],
      normalColor: json['normal_color']
    );
  }
}

class CommonModel {
  final String text;
  final String url;

  CommonModel({this.text, this.url});

  factory CommonModel.fromJson(Map<String, dynamic> json){
    return CommonModel(
      text: json['text'],
      url: json['url']
    );
  }
}


