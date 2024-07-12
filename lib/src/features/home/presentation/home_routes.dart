import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:lm_labs_app/src/features/home/presentation/home_view.dart';

part 'home_routes.g.dart';

@TypedGoRoute<HomeRoute>(path: '/')
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomeView();
}
