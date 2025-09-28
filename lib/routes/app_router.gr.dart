// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i14;
import 'package:flutter/material.dart' as _i15;
import 'package:flutter_ims/presentation/screen/category/category_list/category_list_setup_screen.dart'
    as _i1;
import 'package:flutter_ims/presentation/screen/category/create_category/create_category_setup_screen.dart'
    as _i2;
import 'package:flutter_ims/presentation/screen/home/home_setup_screen.dart'
    as _i4;
import 'package:flutter_ims/presentation/screen/login/login_setup_screen.dart'
    as _i5;
import 'package:flutter_ims/presentation/screen/product/create_product/create_product_setup_screen.dart'
    as _i3;
import 'package:flutter_ims/presentation/screen/product/product_list/product_list_setup_screen.dart'
    as _i8;
import 'package:flutter_ims/presentation/screen/profile/profile_setup_screen.dart'
    as _i9;
import 'package:flutter_ims/presentation/screen/register/organization/organization_setup_screen.dart'
    as _i6;
import 'package:flutter_ims/presentation/screen/register/password/password_setup_screen.dart'
    as _i7;
import 'package:flutter_ims/presentation/screen/register/register_setup_screen.dart'
    as _i10;
import 'package:flutter_ims/presentation/screen/root/root_setup_screen.dart'
    as _i11;
import 'package:flutter_ims/presentation/screen/settings/settings_setup_screen.dart'
    as _i12;
import 'package:flutter_ims/presentation/screen/splash/splash_setup_screen.dart'
    as _i13;

/// generated route for
/// [_i1.CategoryListSetupScreen]
class CategoryListSetupRoute extends _i14.PageRouteInfo<void> {
  const CategoryListSetupRoute({List<_i14.PageRouteInfo>? children})
    : super(CategoryListSetupRoute.name, initialChildren: children);

  static const String name = 'CategoryListSetupRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i1.CategoryListSetupScreen();
    },
  );
}

/// generated route for
/// [_i2.CreateCategorySetupScreen]
class CreateCategorySetupRoute extends _i14.PageRouteInfo<void> {
  const CreateCategorySetupRoute({List<_i14.PageRouteInfo>? children})
    : super(CreateCategorySetupRoute.name, initialChildren: children);

  static const String name = 'CreateCategorySetupRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i2.CreateCategorySetupScreen();
    },
  );
}

/// generated route for
/// [_i3.CreateProductSetupScreen]
class CreateProductSetupRoute extends _i14.PageRouteInfo<void> {
  const CreateProductSetupRoute({List<_i14.PageRouteInfo>? children})
    : super(CreateProductSetupRoute.name, initialChildren: children);

  static const String name = 'CreateProductSetupRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i3.CreateProductSetupScreen();
    },
  );
}

/// generated route for
/// [_i4.HomeSetupScreen]
class HomeSetupRoute extends _i14.PageRouteInfo<void> {
  const HomeSetupRoute({List<_i14.PageRouteInfo>? children})
    : super(HomeSetupRoute.name, initialChildren: children);

  static const String name = 'HomeSetupRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i4.HomeSetupScreen();
    },
  );
}

/// generated route for
/// [_i5.LoginSetupScreen]
class LoginSetupRoute extends _i14.PageRouteInfo<void> {
  const LoginSetupRoute({List<_i14.PageRouteInfo>? children})
    : super(LoginSetupRoute.name, initialChildren: children);

  static const String name = 'LoginSetupRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i5.LoginSetupScreen();
    },
  );
}

/// generated route for
/// [_i6.OrganizationSetupScreen]
class OrganizationSetupRoute
    extends _i14.PageRouteInfo<OrganizationSetupRouteArgs> {
  OrganizationSetupRoute({
    _i15.Key? key,
    required String userName,
    required String userEmail,
    required String userPhone,
    required String userDepartment,
    required String userPosition,
    List<_i14.PageRouteInfo>? children,
  }) : super(
         OrganizationSetupRoute.name,
         args: OrganizationSetupRouteArgs(
           key: key,
           userName: userName,
           userEmail: userEmail,
           userPhone: userPhone,
           userDepartment: userDepartment,
           userPosition: userPosition,
         ),
         initialChildren: children,
       );

  static const String name = 'OrganizationSetupRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OrganizationSetupRouteArgs>();
      return _i6.OrganizationSetupScreen(
        key: args.key,
        userName: args.userName,
        userEmail: args.userEmail,
        userPhone: args.userPhone,
        userDepartment: args.userDepartment,
        userPosition: args.userPosition,
      );
    },
  );
}

class OrganizationSetupRouteArgs {
  const OrganizationSetupRouteArgs({
    this.key,
    required this.userName,
    required this.userEmail,
    required this.userPhone,
    required this.userDepartment,
    required this.userPosition,
  });

  final _i15.Key? key;

  final String userName;

  final String userEmail;

  final String userPhone;

  final String userDepartment;

  final String userPosition;

  @override
  String toString() {
    return 'OrganizationSetupRouteArgs{key: $key, userName: $userName, userEmail: $userEmail, userPhone: $userPhone, userDepartment: $userDepartment, userPosition: $userPosition}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! OrganizationSetupRouteArgs) return false;
    return key == other.key &&
        userName == other.userName &&
        userEmail == other.userEmail &&
        userPhone == other.userPhone &&
        userDepartment == other.userDepartment &&
        userPosition == other.userPosition;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      userName.hashCode ^
      userEmail.hashCode ^
      userPhone.hashCode ^
      userDepartment.hashCode ^
      userPosition.hashCode;
}

/// generated route for
/// [_i7.PasswordSetupScreen]
class PasswordSetupRoute extends _i14.PageRouteInfo<PasswordSetupRouteArgs> {
  PasswordSetupRoute({
    _i15.Key? key,
    required String userName,
    required String userEmail,
    required String userPhone,
    required String userDepartment,
    required String userPosition,
    required String organizationName,
    required String organizationEmail,
    List<_i14.PageRouteInfo>? children,
  }) : super(
         PasswordSetupRoute.name,
         args: PasswordSetupRouteArgs(
           key: key,
           userName: userName,
           userEmail: userEmail,
           userPhone: userPhone,
           userDepartment: userDepartment,
           userPosition: userPosition,
           organizationName: organizationName,
           organizationEmail: organizationEmail,
         ),
         initialChildren: children,
       );

  static const String name = 'PasswordSetupRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PasswordSetupRouteArgs>();
      return _i7.PasswordSetupScreen(
        key: args.key,
        userName: args.userName,
        userEmail: args.userEmail,
        userPhone: args.userPhone,
        userDepartment: args.userDepartment,
        userPosition: args.userPosition,
        organizationName: args.organizationName,
        organizationEmail: args.organizationEmail,
      );
    },
  );
}

class PasswordSetupRouteArgs {
  const PasswordSetupRouteArgs({
    this.key,
    required this.userName,
    required this.userEmail,
    required this.userPhone,
    required this.userDepartment,
    required this.userPosition,
    required this.organizationName,
    required this.organizationEmail,
  });

  final _i15.Key? key;

  final String userName;

  final String userEmail;

  final String userPhone;

  final String userDepartment;

  final String userPosition;

  final String organizationName;

  final String organizationEmail;

  @override
  String toString() {
    return 'PasswordSetupRouteArgs{key: $key, userName: $userName, userEmail: $userEmail, userPhone: $userPhone, userDepartment: $userDepartment, userPosition: $userPosition, organizationName: $organizationName, organizationEmail: $organizationEmail}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PasswordSetupRouteArgs) return false;
    return key == other.key &&
        userName == other.userName &&
        userEmail == other.userEmail &&
        userPhone == other.userPhone &&
        userDepartment == other.userDepartment &&
        userPosition == other.userPosition &&
        organizationName == other.organizationName &&
        organizationEmail == other.organizationEmail;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      userName.hashCode ^
      userEmail.hashCode ^
      userPhone.hashCode ^
      userDepartment.hashCode ^
      userPosition.hashCode ^
      organizationName.hashCode ^
      organizationEmail.hashCode;
}

/// generated route for
/// [_i8.ProductListSetupScreen]
class ProductListSetupRoute extends _i14.PageRouteInfo<void> {
  const ProductListSetupRoute({List<_i14.PageRouteInfo>? children})
    : super(ProductListSetupRoute.name, initialChildren: children);

  static const String name = 'ProductListSetupRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i8.ProductListSetupScreen();
    },
  );
}

/// generated route for
/// [_i9.ProfileSetupScreen]
class ProfileSetupRoute extends _i14.PageRouteInfo<void> {
  const ProfileSetupRoute({List<_i14.PageRouteInfo>? children})
    : super(ProfileSetupRoute.name, initialChildren: children);

  static const String name = 'ProfileSetupRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i9.ProfileSetupScreen();
    },
  );
}

/// generated route for
/// [_i10.RegisterSetupScreen]
class RegisterSetupRoute extends _i14.PageRouteInfo<void> {
  const RegisterSetupRoute({List<_i14.PageRouteInfo>? children})
    : super(RegisterSetupRoute.name, initialChildren: children);

  static const String name = 'RegisterSetupRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i10.RegisterSetupScreen();
    },
  );
}

/// generated route for
/// [_i11.RootSetupScreen]
class RootSetupRoute extends _i14.PageRouteInfo<void> {
  const RootSetupRoute({List<_i14.PageRouteInfo>? children})
    : super(RootSetupRoute.name, initialChildren: children);

  static const String name = 'RootSetupRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i11.RootSetupScreen();
    },
  );
}

/// generated route for
/// [_i12.SettingsSetupScreen]
class SettingsSetupRoute extends _i14.PageRouteInfo<void> {
  const SettingsSetupRoute({List<_i14.PageRouteInfo>? children})
    : super(SettingsSetupRoute.name, initialChildren: children);

  static const String name = 'SettingsSetupRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i12.SettingsSetupScreen();
    },
  );
}

/// generated route for
/// [_i13.SplashSetupScreen]
class SplashSetupRoute extends _i14.PageRouteInfo<void> {
  const SplashSetupRoute({List<_i14.PageRouteInfo>? children})
    : super(SplashSetupRoute.name, initialChildren: children);

  static const String name = 'SplashSetupRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i13.SplashSetupScreen();
    },
  );
}
