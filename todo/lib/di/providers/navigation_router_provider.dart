import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view/router/navigation_router.dart';
import '../../view/router/navigation_router_impl.dart';

RepositoryProvider<NavigationRouter> navigationRouterProvider(
        GlobalKey<NavigatorState> navigatorKey) =>
    RepositoryProvider<NavigationRouter>(
        create: (_) => NavigationRouterImpl(navigatorKey));
