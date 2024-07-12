import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:lm_labs_app/src/features/sample_feature/presentation/sample_item_details_view.dart';
import 'package:lm_labs_app/src/features/sample_feature/presentation/sample_item_list_view.dart';

part 'sample_feature_routes.g.dart';

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
