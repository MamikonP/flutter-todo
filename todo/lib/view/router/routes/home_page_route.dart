import 'package:flutter/material.dart';

import '../../screens/app_screen.dart';
import '../../screens/home/home_page_screen.dart';

class HomePageRoute<T> extends PageRoute<T>
    with MaterialRouteTransitionMixin<T> {
  HomePageRoute({RouteSettings? routeSettings, this.maintainState = true})
      : super(
          settings: routeSettings,
          fullscreenDialog: false,
        );

  @override
  Widget buildContent(BuildContext context) {
    return AppScreen(
      appBar: AppBar(title: const Text('ToDo List')),
      content: const HomePageScreen());
  }

  @override
  final bool maintainState;
}
