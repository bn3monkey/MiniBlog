enum WindowName {
  MAIN,
  USER,
}

typedef ChangeWindowCallback = Function(WindowName windowName);
