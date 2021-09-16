import 'comment.dart';
import 'post_head.dart';

class Post {
  Post({required this.head, required this.content, required this.comments});

  final PostHead head;
  final String content;
  final List<Comment> comments;
}
