import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:lm_labs_app/src/features/jokes/presentation/jokes_view.dart';

part 'jokes_routes.g.dart';

@TypedGoRoute<JokesRoute>(path: '/jokes')
class JokesRoute extends GoRouteData {
  const JokesRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const JokesView();
}
