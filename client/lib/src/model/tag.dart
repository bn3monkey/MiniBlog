class Tag {
  Tag({required this.items}) {
    is_selected = List<bool>.generate(items.length, (idx) {
      return true;
    });
  }

  List<String> items;
  late List<bool> is_selected;

  int get length => items.length;

  String operator [](int idx) {
    return items[idx];
  }

  operator []=(int idx, String value) {
    if (0 <= idx && idx < items.length) items[idx] = value;
  }

  void select(int idx) {
    is_selected[idx] = !is_selected[idx];
  }

  bool isSelected(int idx) {
    return is_selected[idx];
  }
}
