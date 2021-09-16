import 'Commenter.dart';

class Comment {
  Comment({required this.id, required this.commenter, required this.content});
  final int id;
  final Commenter commenter;
  final String content;
}
