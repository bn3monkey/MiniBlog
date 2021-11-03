import 'user.dart';
import 'reply.dart';

class Comment {
  Comment(
      {required this.id,
      required this.user,
      required this.content,
      required this.creation_date,
      required this.replies});
  final int id;
  final User user;
  final String content;
  final DateTime creation_date;
  final List<Reply> replies;
}
