import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lm_labs_app/src/features/sample_feature/presentation/sample_item_details_view.dart';
import 'package:lm_labs_app/src/features/sample_feature/presentation/sample_item_list_view.dart';
import 'package:lm_labs_app/src/features/settings/presentation/settings_view.dart';

part 'routes.g.dart';

@TypedGoRoute<SampleItemDetailsRoute>(path: '/sample_item')
class SampleItemDetailsRoute extends GoRouteData {
  const SampleItemDetailsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SampleItemDetailsView();
}

@TypedGoRoute<SampleItemListRoute>(path: '/')
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
