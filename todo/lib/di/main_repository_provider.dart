// ignore_for_file: always_specify_types

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'providers/navigation_router_provider.dart';

typedef MainRepositoryBuilderCallback = Widget Function(
    BuildContext context, GlobalKey<NavigatorState> navigatorKey);

class MainRepositoryProvider extends StatelessWidget {
  MainRepositoryProvider({required this.builder, super.key});

  final MainRepositoryBuilderCallback builder;
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        navigationRouterProvider(_navigatorKey),
      ],
      child: builder(context, _navigatorKey),
    );
  }
}
