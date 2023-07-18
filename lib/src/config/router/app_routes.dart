import 'package:chuck_interceptor/chuck.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_bloc_mobile/src/data/source/local_source.dart';
import 'package:sample_bloc_mobile/src/injector_container.dart';
import 'package:sample_bloc_mobile/src/presentation/bloc/auth/auth_bloc.dart';
import 'package:sample_bloc_mobile/src/presentation/bloc/auth/confirm/confirm_code_bloc.dart';
import 'package:sample_bloc_mobile/src/presentation/bloc/auth/register/register_bloc.dart';
import 'package:sample_bloc_mobile/src/presentation/bloc/main/home/home_bloc.dart';
import 'package:sample_bloc_mobile/src/presentation/bloc/splash/splash_bloc.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/auth/auth_page.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/auth/confirm/confirm_code_page.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/auth/register/register_page.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/error/error_page.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/internet_connection/internet_connection_page.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/main/main_page.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/main/profile/settings/settings_page.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/splash/splash_page.dart';

part 'name_routes.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

final localSource = sl<LocalSource>();

final Chuck chuck = Chuck(navigatorKey: rootNavigatorKey);

sealed class AppRoutes {
  AppRoutes._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    if (kDebugMode) {
      print('route : ${settings.name}');
    }
    switch (settings.name) {
      case Routes.initial:
        return CupertinoPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => sl<SplashBloc>(),
            child: const SplashPage(),
          ),
        );
      case Routes.main:
        return FadePageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => sl<HomeBloc>()),
            ],
            child: const MainPage(),
          ),
        );
      case Routes.settings:
        return MaterialPageRoute(builder: (_) => const SettingsPage());
      case Routes.internetConnection:
        return MaterialPageRoute(
          builder: (_) => const InternetConnectionPage(),
        );
      case Routes.auth:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => sl<AuthBloc>(),
            child: const AuthPage(),
          ),
        );
      case Routes.confirmCode:
        final AuthSuccessState state = settings.arguments! as AuthSuccessState;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => sl<ConfirmCodeBloc>(),
            child: ConfirmCodePage(
              state: state,
            ),
          ),
        );
      case Routes.register:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => sl<RegisterBloc>(),
            child: const RegisterPage(),
          ),
        );

      default:
        return MaterialPageRoute(builder: (_) => ErrorPage(settings: settings));
    }
  }

  static Route<dynamic>? onUnknownRoute(RouteSettings settings) {
    if (kDebugMode) {
      print('Navigate to: $settings');
    }
    return MaterialPageRoute(
      builder: (_) => ErrorPage(
        settings: settings,
      ),
    );
  }
}

class FadePageRoute<T> extends PageRouteBuilder<T> {
  FadePageRoute({required this.builder})
      : super(
          pageBuilder: (
            context,
            animation,
            secondaryAnimation,
          ) =>
              builder(context),
          transitionsBuilder: (
            context,
            animation,
            secondaryAnimation,
            child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
  final WidgetBuilder builder;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 1000);
}
