import 'package:news_app/models/topic_model.dart';

List<TopicModel> getTopics(){
  List<TopicModel> topic= new List<TopicModel>();
  TopicModel topicModel=new TopicModel();


  topicModel=new TopicModel();
  topicModel.topicName="General";
  topicModel.imageAdd="assets/general.jpg";
  topic.add(topicModel);

  topicModel=new TopicModel();
  topicModel.topicName="Business";
  topicModel.imageAdd="assets/business.jpg";
  topic.add(topicModel);

  topicModel=new TopicModel();
  topicModel.topicName="Health";
  topicModel.imageAdd="assets/health.jpg";
  topic.add(topicModel);

  topicModel=new TopicModel();
  topicModel.topicName="Sports";
  topicModel.imageAdd="assets/sports.jpg";
  topic.add(topicModel);


  topicModel=new TopicModel();
  topicModel.topicName="Science";
  topicModel.imageAdd="assets/science.jpg";
  topic.add(topicModel);

  topicModel=new TopicModel();
  topicModel.topicName="Technology";
  topicModel.imageAdd="assets/tech.jpg";
  topic.add(topicModel);

  topicModel=new TopicModel();
  topicModel.topicName="Entertainment";
  topicModel.imageAdd="assets/entertainment.jpg";
  topic.add(topicModel);



  return topic;

}