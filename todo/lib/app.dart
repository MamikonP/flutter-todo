import 'package:flutter/material.dart';

import 'view/router/app_router.dart';
import 'view/router/navigation_routes.dart';

class App extends StatefulWidget {
  const App(this.navigatorKey, {super.key});

  final GlobalKey<NavigatorState> navigatorKey;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: widget.navigatorKey,
      title: 'Todo',
      theme: ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: Colors.deepPurple,
              secondary: Colors.purple,
            ),
      ),
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: NavigationRoutes.root,
    );
  }
}
