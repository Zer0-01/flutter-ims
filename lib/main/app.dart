import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ims/l10n/app_localizations.dart';
import 'package:flutter_ims/presentation/common_blocs/language_bloc/language_bloc.dart';
import 'package:flutter_ims/routes/app_router.dart';
import 'package:flutter_ims/routes/app_router_observer.dart';

class App extends StatelessWidget {
  final String language;
  final AdaptiveThemeMode initialTheme;
  final _appRouter = AppRouter();

  App({super.key, required this.language, required this.initialTheme});

  @override
  Widget build(BuildContext context) {
    return buildHomeApp(language: language);
  }

  AdaptiveTheme buildHomeApp({required String language}) {
    return AdaptiveTheme(
      light: _buildLightTheme(),
      dark: _buildDarkTheme(),
      debugShowFloatingThemeButton: true,
      initial: initialTheme,
      builder:
          (light, dark) =>
              _buildMultiBlocProvider(light, dark, language: language),
    );
  }

  ThemeData _buildDarkTheme() {
    const darkColorScheme = ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFF7986CB), // Lighter Indigo
      onPrimary: Colors.black,
      secondary: Color(0xFF4DB6AC), // Soft Teal
      onSecondary: Colors.black,
      error: Color(0xFFEF5350),
      onError: Colors.black,
      surface: Color(0xFF1E1E1E),
      onSurface: Colors.white,
      outline: Color(0xFF616161),
    );
    return ThemeData(
      useMaterial3: false,
      brightness: Brightness.dark,
      colorScheme: darkColorScheme,
    );
  }

  ThemeData _buildLightTheme() {
    const lightColorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF3F51B5), // Indigo
      onPrimary: Colors.white,
      secondary: Color(0xFF26A69A), // Teal
      onSecondary: Colors.white,
      error: Color(0xFFD32F2F), // Red
      onError: Colors.white,
      surface: Colors.white,
      onSurface: Color(0xFF1A1A1A),
      outline: Color(0xFF9E9E9E),
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: lightColorScheme,
    );
  }

  MultiBlocProvider _buildMultiBlocProvider(
    ThemeData light,
    ThemeData dark, {
    required String language,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LanguageBloc(language: language)),
      ],
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          return MaterialApp.router(
            routerConfig: _appRouter.config(
              navigatorObservers: () => [AppRouterObserver()],
            ),
            theme: light,
            darkTheme: dark,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: Locale(state.language),
          );
        },
      ),
    );
  }
}
