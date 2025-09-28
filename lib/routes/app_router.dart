import 'package:auto_route/auto_route.dart';
import 'package:flutter_ims/routes/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashSetupRoute.page, initial: true),
    AutoRoute(page: LoginSetupRoute.page),
    AutoRoute(page: RegisterSetupRoute.page),
    AutoRoute(page: HomeSetupRoute.page),
    AutoRoute(page: OrganizationSetupRoute.page),
    AutoRoute(page: PasswordSetupRoute.page),
    AutoRoute(
      page: RootSetupRoute.page,
      children: [
        AutoRoute(page: HomeSetupRoute.page, initial: true),
        AutoRoute(page: ProfileSetupRoute.page),
      ],
    ),
    AutoRoute(page: CategoryListSetupRoute.page),
    AutoRoute(page: CreateCategorySetupRoute.page),
    AutoRoute(page: SettingsSetupRoute.page),
  ];
}
