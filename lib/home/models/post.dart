import 'package:stonks_app/home/models/reaction.dart';

class Post {
  String userName;
  String postTime;
  String postText;
  List<Reaction> reactions;
  List<Post> replies;
  bool unread;

  Post(this.userName, this.postTime, this.postText, this.reactions, this.replies, this.unread);
}