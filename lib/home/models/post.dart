import 'package:stonks_app/home/models/reaction.dart';

class Post {
  int idUser;
  String postTime;
  List<Reaction> reactions;
  List<Post> replies;
  bool unread;
}