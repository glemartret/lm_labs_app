import 'package:go_router/go_router.dart';
import 'package:lm_labs_app/src/features/counter/presentation/counter_routes.dart'
    as counter show $appRoutes;
import 'package:lm_labs_app/src/features/home/presentation/home_routes.dart'
    as home show $appRoutes;
import 'package:lm_labs_app/src/features/jokes/presentation/jokes_routes.dart'
    as jokes show $appRoutes;
import 'package:lm_labs_app/src/features/sample_feature/presentation/sample_feature_routes.dart'
    as sample_feature show $appRoutes;
import 'package:lm_labs_app/src/features/settings/presentation/settings_routes.dart'
    as settings show $appRoutes;

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
      ...home.$appRoutes,
      ...counter.$appRoutes,
      ...jokes.$appRoutes,
      ...sample_feature.$appRoutes,
      ...settings.$appRoutes,
    ];
