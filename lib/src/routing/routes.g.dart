// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $sampleItemDetailsRoute,
      $sampleItemListRoute,
      $settingsRoute,
    ];

RouteBase get $sampleItemDetailsRoute => GoRouteData.$route(
      path: '/sample_item',
      factory: $SampleItemDetailsRouteExtension._fromState,
    );

extension $SampleItemDetailsRouteExtension on SampleItemDetailsRoute {
  static SampleItemDetailsRoute _fromState(GoRouterState state) =>
      const SampleItemDetailsRoute();

  String get location => GoRouteData.$location(
        '/sample_item',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $sampleItemListRoute => GoRouteData.$route(
      path: '/',
      factory: $SampleItemListRouteExtension._fromState,
    );

extension $SampleItemListRouteExtension on SampleItemListRoute {
  static SampleItemListRoute _fromState(GoRouterState state) =>
      const SampleItemListRoute();

  String get location => GoRouteData.$location(
        '/',
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
