class User {
  User({required this.id, required this.name, required this.profile});
  // IMAGE URL
  final int id;
  final String profile;
  final String name;

  bool isSuperUser() {
    //Network 요청을 통해 받아오는 게 좋을듯
    return false;
  }
}
