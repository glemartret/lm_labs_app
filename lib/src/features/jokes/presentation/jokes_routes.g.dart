// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jokes_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $jokesRoute,
    ];

RouteBase get $jokesRoute => GoRouteData.$route(
      path: '/jokes',
      factory: $JokesRouteExtension._fromState,
    );

extension $JokesRouteExtension on JokesRoute {
  static JokesRoute _fromState(GoRouterState state) => const JokesRoute();

  String get location => GoRouteData.$location(
        '/jokes',
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

List<RouteBase> get $jokesRoutes => $appRoutes;
