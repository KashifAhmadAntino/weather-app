import 'package:auto_route/auto_route.dart';
import 'route_helper.gr.dart';

@AutoRouterConfig()
class RouteHelper extends $RouteHelper {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: WeatherRoute.page,
        ),
        AutoRoute(
          page: LoginRoute.page,
        ),
        AutoRoute(
          page: SplashRoute.page,
          path: '/',
        )
      ];
}
