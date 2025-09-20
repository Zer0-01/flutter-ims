// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter_ims/presentation/screen/home/home_setup_screen.dart'
    as _i1;
import 'package:flutter_ims/presentation/screen/login/login_setup_screen.dart'
    as _i2;
import 'package:flutter_ims/presentation/screen/register/organization/organization_setup_screen.dart'
    as _i3;
import 'package:flutter_ims/presentation/screen/register/register_setup_screen.dart'
    as _i4;

/// generated route for
/// [_i1.HomeSetupScreen]
class HomeSetupRoute extends _i5.PageRouteInfo<void> {
  const HomeSetupRoute({List<_i5.PageRouteInfo>? children})
    : super(HomeSetupRoute.name, initialChildren: children);

  static const String name = 'HomeSetupRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomeSetupScreen();
    },
  );
}

/// generated route for
/// [_i2.LoginSetupScreen]
class LoginSetupRoute extends _i5.PageRouteInfo<void> {
  const LoginSetupRoute({List<_i5.PageRouteInfo>? children})
    : super(LoginSetupRoute.name, initialChildren: children);

  static const String name = 'LoginSetupRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.LoginSetupScreen();
    },
  );
}

/// generated route for
/// [_i3.OrganizationSetupScreen]
class OrganizationSetupRoute extends _i5.PageRouteInfo<void> {
  const OrganizationSetupRoute({List<_i5.PageRouteInfo>? children})
    : super(OrganizationSetupRoute.name, initialChildren: children);

  static const String name = 'OrganizationSetupRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.OrganizationSetupScreen();
    },
  );
}

/// generated route for
/// [_i4.RegisterSetupScreen]
class RegisterSetupRoute extends _i5.PageRouteInfo<void> {
  const RegisterSetupRoute({List<_i5.PageRouteInfo>? children})
    : super(RegisterSetupRoute.name, initialChildren: children);

  static const String name = 'RegisterSetupRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.RegisterSetupScreen();
    },
  );
}
