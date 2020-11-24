import 'package:stonks_app/home/models/post.dart';

class Stock {
  String name;
  String logo;
  String lastPost;
  double variation;
  int unreadPosts;
  double stockValue;
  int members;
  List<Post> posts;

  Stock(this.name, this.logo, this.lastPost, this.variation, this.unreadPosts,
      this.stockValue, this.members, this.posts);
}