class Section {
  Section({required this.items}) {
    print("Section initilziation is called");
  }

  int selected = -1;
  final List<String> items;

  int get length => items.length;

  String selectedItem() {
    if (selected == -1) return "";
    return items[selected];
  }

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
