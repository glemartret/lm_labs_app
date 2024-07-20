import 'package:go_router/go_router.dart';
import 'package:lm_labs_app/src/features/counter/presentation/counter_routes.dart';
import 'package:lm_labs_app/src/features/home/presentation/home_routes.dart';
import 'package:lm_labs_app/src/features/jokes/presentation/jokes_routes.dart';
import 'package:lm_labs_app/src/features/sample_feature/presentation/sample_feature_routes.dart';
import 'package:lm_labs_app/src/features/settings/presentation/settings_routes.dart';

export 'package:lm_labs_app/src/features/counter/presentation/counter_routes.dart'
    hide $appRoutes;
export 'package:lm_labs_app/src/features/home/presentation/home_routes.dart'
    hide $appRoutes;
export 'package:lm_labs_app/src/features/jokes/presentation/jokes_routes.dart'
    hide $appRoutes;
export 'package:lm_labs_app/src/features/sample_feature/presentation/sample_feature_routes.dart'
    hide $appRoutes;
export 'package:lm_labs_app/src/features/settings/presentation/settings_routes.dart'
    hide $appRoutes;

export 'router.dart' show RefRouterExt, WidgetRefRouterExt;

List<RouteBase> get $appRoutes => [
      ...$homeRoutes,
      ...$counterRoutes,
      ...$jokesRoutes,
      ...$sampleFeatureRoutes,
      ...$settingsRoutes,
    ];
