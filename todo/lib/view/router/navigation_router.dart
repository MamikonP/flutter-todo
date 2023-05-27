abstract class NavigationRouter {
  void pop();

  void push(
    String routeName, {
    bool save = true,
    Object arguments,
  });

  void pushReplace(
    String routeName, {
    bool save = true,
    Object arguments,
  });
}
