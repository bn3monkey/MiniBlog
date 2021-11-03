class PostHead {
  PostHead(
      {required this.id,
      required this.title,
      required this.section,
      required this.tags,
      required this.views,
      required this.creation_date,
      required this.thumbnail});

  final int id;
  final String title;
  final String section;
  final List<String> tags;
  final int views;
  final DateTime creation_date;
  // ThumbNail URL
  final String thumbnail;
}
