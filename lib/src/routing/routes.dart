import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lm_labs_app/src/features/counter/presentation/counter_view.dart';
import 'package:lm_labs_app/src/features/home/presentation/home_view.dart';
import 'package:lm_labs_app/src/features/sample_feature/presentation/sample_item_details_view.dart';
import 'package:lm_labs_app/src/features/sample_feature/presentation/sample_item_list_view.dart';
import 'package:lm_labs_app/src/features/settings/presentation/settings_view.dart';

export 'router.dart' show RefRouterExt, WidgetRefRouterExt;

part 'routes.g.dart';

@TypedGoRoute<CounterRoute>(path: '/counter')
class CounterRoute extends GoRouteData {
  const CounterRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const CounterView();
}

@TypedGoRoute<HomeRoute>(path: '/')
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomeView();
}

class SampleItemDetailsRoute extends GoRouteData {
  final int id;

  const SampleItemDetailsRoute(this.id);

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      SampleItemDetailsView(id: id);
}

@TypedGoRoute<SampleItemListRoute>(
  path: '/sample_items',
  routes: <TypedGoRoute<GoRouteData>>[
    TypedGoRoute<SampleItemDetailsRoute>(
      path: ':id',
    ),
  ],
)
class SampleItemListRoute extends GoRouteData {
  const SampleItemListRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SampleItemListView();
}

@TypedGoRoute<SettingsRoute>(path: '/settings')
class SettingsRoute extends GoRouteData {
  const SettingsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SettingsView();
}
