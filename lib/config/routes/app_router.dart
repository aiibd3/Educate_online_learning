import 'package:educate/features/home_instructor/presentation/manager/create/home_instructor_cubit.dart';
import 'package:educate/features/role/choose_role.dart';
import 'package:educate/features/signup_instructor/signup_instructor/presentation/pages/signup_instructor.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import '../../features/home_instructor/presentation/pages/Home_instructor.dart';
import '../../features/home_student/presentation/manager/home_student_cubit.dart';
import '../../features/home_student/presentation/pages/home_student.dart';
import '../../features/login/presentation/manager/login_cubit.dart';
import '../../features/login/presentation/pages/login.dart';
import '../../features/signup_instructor/signup_instructor/presentation/manager/signup_instructor_cubit.dart';
import '../../features/signup_student/presentation/manager/signup_student_cubit.dart';
import '../../features/signup_student/presentation/pages/signup_student.dart';
import '../../features/splash/ui/splash_page.dart';
import '../di/di.dart';
import 'app_routes.dart';

class AppRouter {
  static Route? onGenerate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) => const SplashPage(),
        );

      case AppRoutes.login:
        return PageTransition(
          settings: routeSettings,
          child: BlocProvider(
            create: (BuildContext context) => getIt<LoginCubit>(),
            child: const LoginPage(),
          ),
          type: PageTransitionType.fade,
        );

      case AppRoutes.chooseRole:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) => const ChooseRole(),
        );

      case AppRoutes.signupStudent:
        return PageTransition(
          settings: routeSettings,
          child: BlocProvider(
            create: (BuildContext context) => getIt<SignupStudentCubit>(),
            child: SignUpStudent(),
          ),
          type: PageTransitionType.fade,
        );

      case AppRoutes.signupInstructor:
        return PageTransition(
          settings: routeSettings,
          child: BlocProvider(
            create: (BuildContext context) => getIt<SignupInstructorCubit>(),
            child: SignUpInstructor(),
          ),
          type: PageTransitionType.fade,
        );

      case AppRoutes.homeInstructor:
        return PageTransition(
          settings: routeSettings,
          child: BlocProvider(
            create: (BuildContext context) => getIt<HomeInstructorCubit>(),
            child: const HomeInstructor(),
          ),
          type: PageTransitionType.fade,
        );

      case AppRoutes.homeStudent:
        return PageTransition(
          settings: routeSettings,
          child: BlocProvider(
            create: (BuildContext context) => getIt<HomeStudentCubit>(),
            child: const HomeStudent(),
          ),
          type: PageTransitionType.fade,
        );
    }
    return null;
  }
}
