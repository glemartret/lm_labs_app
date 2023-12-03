// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $counterRoute,
      $homeRoute,
      $sampleItemListRoute,
      $settingsRoute,
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

RouteBase get $homeRoute => GoRouteData.$route(
      path: '/',
      factory: $HomeRouteExtension._fromState,
    );

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $sampleItemListRoute => GoRouteData.$route(
      path: '/sample_items',
      factory: $SampleItemListRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: ':id',
          factory: $SampleItemDetailsRouteExtension._fromState,
        ),
      ],
    );

extension $SampleItemListRouteExtension on SampleItemListRoute {
  static SampleItemListRoute _fromState(GoRouterState state) =>
      const SampleItemListRoute();

  String get location => GoRouteData.$location(
        '/sample_items',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SampleItemDetailsRouteExtension on SampleItemDetailsRoute {
  static SampleItemDetailsRoute _fromState(GoRouterState state) =>
      SampleItemDetailsRoute(
        int.parse(state.pathParameters['id']!),
      );

  String get location => GoRouteData.$location(
        '/sample_items/${Uri.encodeComponent(id.toString())}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $settingsRoute => GoRouteData.$route(
      path: '/settings',
      factory: $SettingsRouteExtension._fromState,
    );

extension $SettingsRouteExtension on SettingsRoute {
  static SettingsRoute _fromState(GoRouterState state) => const SettingsRoute();

  String get location => GoRouteData.$location(
        '/settings',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
