import 'user.dart';

class Reply {
  Reply(
      {required this.id,
      required this.user,
      required this.creation_date,
      required this.content});
  final int id;
  final User user;
  final DateTime creation_date;
  final String content;
}
