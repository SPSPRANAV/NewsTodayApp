import 'package:flutter/material.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/views/home.dart';

class TopicNews extends StatefulWidget {

  final String topic;
  TopicNews({this.topic});
  @override
  _TopicNewsState createState() => _TopicNewsState();
}

class _TopicNewsState extends State<TopicNews> {

  List<ArticleModel> articles=new List<ArticleModel>();
  bool _loading=true;
  @override
  void initState(){
    super.initState();
    getTopicNews();
  }
  getTopicNews() async {
    TopicNewsClass newsClass = TopicNewsClass();
    await newsClass.getNews(widget.topic);
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('NEWS',style:TextStyle(color: Colors.blue[800],fontWeight: FontWeight.bold),),
            Text('TODAY',style:TextStyle(color: Colors.red,fontWeight: FontWeight.bold),)
          ],
        ),
        actions: <Widget>[
          Opacity(
            opacity: 0,
            child: Container(
                padding:EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.score)),
          ),
        ],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: _loading? Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      ):SingleChildScrollView(
        child: Container(
          padding:EdgeInsets.symmetric(horizontal: 16) ,
          child: Column(
            children: <Widget>[
            Container(
              padding:EdgeInsets.only(top: 16) ,
              child: ListView.builder(
                  itemCount:articles.length ,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder:(context,index){
                    return BlogTile(
                      imageUrl: articles[index].urlToImage,
                      title: articles[index].title,
                      desc: articles[index].description,
                      url: articles[index].url,
                    );
                  }),
            ),
          ],
        ),
      ),
      ),
    );
  }
}
