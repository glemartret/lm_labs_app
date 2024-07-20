// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $counterRoute,
    ];

RouteBase get $counterRoute => GoRouteData.$route(
      path: '/counter',
      factory: $CounterRouteExtension._fromState,
    );

extension $CounterRouteExtension on CounterRoute {
  static CounterRoute _fromState(GoRouterState state) => const CounterRoute();

  String get location => GoRouteData.$location(
        '/counter',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

// **************************************************************************
// RoutesGenerator
// **************************************************************************

List<RouteBase> get $counterRoutes => $appRoutes;
