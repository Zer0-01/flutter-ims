import 'package:auto_route/auto_route.dart';
import 'package:flutter_ims/routes/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LoginSetupRoute.page, initial: true),
    AutoRoute(page: RegisterSetupRoute.page),
    AutoRoute(page: HomeSetupRoute.page),
    AutoRoute(page: OrganizationSetupRoute.page),
    AutoRoute(page: PasswordSetupRoute.page),
  ];
}
