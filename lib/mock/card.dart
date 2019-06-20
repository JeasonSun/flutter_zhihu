class ArticleCard{
  final String articleTitle;
  final String articleContent;
  final String articleUrl;
  final String articleImage;

  final String cardType;

  final String sourceAvatar;
  final String sourceName;
  final String sourceIcon;
  final String sourceTitle;

  final String footline;

  ArticleCard({this.articleImage, this.articleTitle, this.articleContent,  this.cardType, this.sourceAvatar, this.sourceName, this.sourceIcon, this.sourceTitle, this.footline, this.articleUrl});

}

List<ArticleCard> cardList = [
  new ArticleCard(
    articleTitle: "Windows下有哪些给你带来「快感」的软件？",
    articleContent: "一个好的软件可以大幅提高生产力，答主是个狂热的软件控。喜欢搜集各种冷门软件。 动态壁纸-Wallpaper Engine PC 端最好用的动态壁纸软件，可选择软件中推荐的壁纸，也可以手动导入本地视频，可玩性非常高 Steam 购买 Wallpaper Engine，支持中文Wallpaper Eng…",
    cardType: 'BIG_IMAGE',
    sourceAvatar: "https://pic2.zhimg.com/50/v2-ed43a1bc80f6fcf7d309fdd3e4e5686b_m.jpg",
    sourceName: "非凡公社 ",
    sourceIcon: "https://pic3.zhimg.com/v2-2c843a86beb4850880870db5dbcdd8ac.png",
    sourceTitle: "便利蜂商贸有限公司 Java工程师",
    footline: "903 赞同 · 129 评论",
    articleUrl: "https://zhihu.com/question/276995691/answer/688260855",
    articleImage: "https://pic2.zhimg.com/v2-33d2b1532c42c42a13b170207f8181f9.jpg",
    ),
    new ArticleCard(
      articleTitle: "大疆为什么要追求「技术超饱和」？",
      articleContent: "大疆具体某一个产品的诞生，看起来有一定的偶然性，但其实这些产品并不是一蹴而就的，而是因为在一个足够长的周期内，大疆追求技术研发和人才布局的「超饱和」状态，才让他们有机会把偶然变成必然。\n我不知道现在算不算是「不确定」的时代，但科技行业有许多人正在经历挑战。有的人说，这是周期，是回归理性；也有的人说这是风口结束了。大疆对此感受并不真切，其实从大疆 T 字型的模型里，可以看出大疆对市场的认知很简单朴素",
      articleUrl: "https://www.zhihu.com/market/albums/1016355540762509312/manuscript/1077257712596729856",
      cardType: 'SMALL_IMAGE',
      sourceAvatar: "https://pic4.zhimg.com/v2-6927210a3a4ba49438c2bff81397a6bb_64x64.jpg",
      sourceName: "张鹏",
      footline:  "私家课 · 立即阅读",
    ),
    new ArticleCard(
      articleTitle: "2018 年的中国你为什么还选择 Angular?",
      articleContent: "匿了，微信前端工程师。 目前网页端就是angular，除此之外厂里angular的项目真的很少很少，react和vue越来越多，jquery还是厂里的标杆。 如果只是中小项目的话，真心不建议用angular，太重，如你所见，微信网页版用angular真的是很般配，本来微信就是一个重应用…",
      cardType: 'SMALL_IMAGE',
      articleUrl: "https://zhihu.com/question/276179716/answer/719393461",
      sourceAvatar: "https://pic4.zhimg.com/aadd7b895_m.jpg",
      sourceName: "匿名用户",
      footline: "1,194 浏览",
    ),
    new ArticleCard(
      articleTitle: "一看就很贵气的女孩子是什么样子的？",
      articleContent: "先上图感受一下。 听到张梓琳这个名字，大多数人的第一反应是，哦，世界小姐！ 她是迄今为止，第一个在世界级选美舞台上夺冠的人。看到她，我觉得就是看到贵气本气了。 那什么样的女孩子看起来更贵气呢？ 贵气是比有气质更难达到的一种层次。因为贵气在某种程度…",
      articleUrl:  "https://zhihu.com/question/322175199/answer/685022718",
      articleImage: "https://pic1.zhimg.com/50/v2-ddd5836bc154e1563e344327d71eb3a3_bh.jpg",
      cardType: 'SMALL_IMAGE',
      sourceAvatar: "https://pic1.zhimg.com/50/v2-afb5e881b844f53226b647defda493bc_m.jpg",
      sourceName: 'nono',
      footline: "7,758 赞同 · 313 评论"
    ),
];