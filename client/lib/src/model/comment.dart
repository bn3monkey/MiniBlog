import 'user.dart';
import 'reply.dart';

class Comment {
  Comment(
      {required this.id,
      required this.user,
      required this.content,
      required this.replies});
  final int id;
  final User user;
  final String content;
  final List<Reply> replies;
}
