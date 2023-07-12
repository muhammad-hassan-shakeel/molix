import 'package:auto_route/auto_route.dart';
import 'package:molix/features/home/views/home_screen.dart';
import 'package:molix/features/login/views/login_screen.dart';

part 'routes.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: LoginRoute.page),
      ];
}
