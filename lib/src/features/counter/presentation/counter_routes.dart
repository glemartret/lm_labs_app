import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:lm_labs_app/src/features/counter/presentation/counter_view.dart';

part 'counter_routes.g.dart';

@TypedGoRoute<CounterRoute>(path: '/counter')
class CounterRoute extends GoRouteData {
  const CounterRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const CounterView();
}
