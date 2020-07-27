import 'package:flutter/material.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/topic_model.dart';
import 'package:news_app/views/article_view.dart';
import 'package:news_app/views/topic_news.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<TopicModel> topics=new List<TopicModel>();
  List<ArticleModel> articles=new List<ArticleModel>();
  bool _loading=true;
  @override
  void initState(){
    super.initState();
    topics=getTopics();
    getNews();
  }
  getNews() async {
    News newsClass=News();
    await newsClass.getNews();
    articles=newsClass.news;
    setState(() {
      _loading=false;
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('NEWS',style:TextStyle(color: Colors.blue[800] ,fontWeight: FontWeight.bold),),
            Text('TODAY',style:TextStyle(color: Colors.red,fontWeight: FontWeight.bold),)
          ],
        ),
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

              //TOPICS
              Container(
                height: 70,
                child: ListView.builder(
                    itemCount: topics.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index){
                      return TopicTile(
                        imageAdd: topics[index].imageAdd,
                        topicName: topics[index].topicName,
                      );
                    }),
              ),

              //BLOGS
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
class TopicTile extends StatelessWidget {
  final String imageAdd,topicName;
  TopicTile({this.imageAdd,this.topicName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(
          builder: (context)=>TopicNews(
            topic: topicName.toString().toLowerCase(),
          )
        ));
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child:Stack(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image.asset(imageAdd,width: 120,height: 60,fit: BoxFit.cover,)),
            Container(
              alignment: Alignment.center,
              width: 120,height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.0),
                color: Colors.black26,
              ),
              child: Text(topicName,style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w500),),
            ),
          ],
        ),
      ),
    );
  }
}
 class BlogTile extends StatelessWidget {
  final String imageUrl,title,desc,url;
  BlogTile({@required this.imageUrl,@required this.title,@required this.desc,@required this.url});
   @override
   Widget build(BuildContext context) {
     return GestureDetector(
       onTap: (){
         Navigator.push(context, MaterialPageRoute(
           builder: (context)=>ArticleView(
            blogUrl: url,
           )
         ));
       },
       child: Container(
         margin: EdgeInsets.only(bottom: 16),
         child: Column(
           children: <Widget>[
             ClipRRect(
                 borderRadius: BorderRadius.circular(6),
                 child: Image.network(imageUrl)),
             Text(title,style: TextStyle(
               fontSize: 20,
               color: Colors.black87,
               fontWeight: FontWeight.w500
             ),),
             SizedBox(height:8),
             Text(desc,style:TextStyle(color: Colors.black54))
           ],

         ),
       ),
     );
   }
 }
