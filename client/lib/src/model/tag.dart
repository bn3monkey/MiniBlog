class Tag {
  Tag({required this.items}) {
    print("Tag initilziation is called");
    is_selected = List<bool>.generate(items.length, (idx) {
      return true;
    });
  }

  List<String> items;
  late List<bool> is_selected;

  int get length => items.length;

  bool findAndRemove(String item) {
    int index = items.indexOf(item);
    if (index < 0) return false;
    items.removeAt(index);
    is_selected.removeAt(index);
    return true;
  }

  void add(String item) {
    items.add(item);
    is_selected.add(true);
  }

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

  void selectAll() {
    for (int i = 0; i < is_selected.length; i++) {
      is_selected[i] = true;
    }
  }

  void unselectAll() {
    for (int i = 0; i < is_selected.length; i++) {
      is_selected[i] = false;
    }
  }
}
