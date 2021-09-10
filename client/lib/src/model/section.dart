class Section {
  Section({required this.datas});

  int selected = -1;
  final List<String> datas;

  String get(int idx) {
    return datas[idx];
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
