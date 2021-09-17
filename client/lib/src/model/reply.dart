import 'user.dart';

class Reply {
  Reply({required this.id, required this.user, required this.content});
  final int id;
  final User user;
  final String content;
}
