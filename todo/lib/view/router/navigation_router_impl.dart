import 'package:flutter/material.dart';

import 'navigation_router.dart';

class NavigationRouterImpl implements NavigationRouter {
  const NavigationRouterImpl(this._navigatorKey);
  
  final GlobalKey<NavigatorState> _navigatorKey;

  @override
  void pop() => _navigatorKey.currentState?.pop();

  @override
  void push(
    String routeName, {
    bool save = true,
    Object? arguments,
  }) {
    _navigatorKey.currentState?.pushNamed(routeName, arguments: arguments);
  }

  @override
  void pushReplace(
    String routeName, {
    bool save = true,
    Object? arguments,
  }) {
    _navigatorKey.currentState
        ?.pushReplacementNamed(routeName, arguments: arguments);
  }
}
