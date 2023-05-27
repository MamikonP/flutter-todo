import 'package:flutter/material.dart';

import 'app.dart';
import 'di/main_repository_provider.dart';

void main() {
  runApp(MainRepositoryProvider(
      builder: (BuildContext context, GlobalKey<NavigatorState> navigatorKey) =>
          App(navigatorKey)));
}
