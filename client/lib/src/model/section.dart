class Section {
  Section({required this.items});

  int selected = -1;
  final List<String> items;

  int get length => items.length;

  String operator [](int idx) {
    return items[idx];
  }

  operator []=(int idx, String value) {
    if (0 <= idx && idx < items.length) items[idx] = value;
  }

  void select(int idx) {
    if (idx == selected)
      selected = -1;
    else
      selected = idx;
  }

  bool isSelected(int idx) {
    return selected == idx;
  }
}
