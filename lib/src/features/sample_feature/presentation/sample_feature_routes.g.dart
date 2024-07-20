// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sample_feature_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $sampleItemListRoute,
    ];

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

// **************************************************************************
// RoutesGenerator
// **************************************************************************

List<RouteBase> get $sampleFeatureRoutes => $appRoutes;
