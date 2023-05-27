import 'package:flutter/material.dart';

import '../screens/home/helper/home_page_helper.dart';
import 'navigation_routes.dart';
import 'routes/home_page_route.dart';

// ignore: avoid_classes_with_only_static_members
abstract class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NavigationRoutes.root:
        return HomePageRoute<dynamic>(HomePageHelperImpl());
    }
    throw Exception('UNDEFINED ROUTE');
  }
}
