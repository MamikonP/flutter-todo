import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app.dart';
import 'di/main_repository_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(MainRepositoryProvider(
      builder: (BuildContext context, GlobalKey<NavigatorState> navigatorKey) =>
          App(navigatorKey)));
}
