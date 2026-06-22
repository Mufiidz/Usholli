import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'home/home_screen.dart';

part 'feature_router.g.dart';

@TypedGoRoute<HomeRoute>(path: '/home')
class HomeRoute extends GoRouteData with $HomeRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return HomeScreen();
  }
}

List<RouteBase> get featureRoutes => $appRoutes;
