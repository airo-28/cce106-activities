import 'usercomment.dart';

class Userpost {
  final String userimg;
  final String username;
  final String time;
  final String postcontent;
  final String postimg;
  final String numshare;
  bool isliked;
  final List<Usercomment> comments;

  // The comment count always comes from the list, so it can't be out of sync.
  int get numcomments => comments.length;

  Userpost({
    required this.userimg,
    required this.username,
    required this.time,
    required this.postcontent,
    required this.postimg,
    required this.numshare,
    required this.isliked,
    required this.comments,
  });
}
