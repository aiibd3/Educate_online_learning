import 'package:educate/features/home_instructor/presentation/manager/create/home_instructor_cubit.dart';
import 'package:educate/features/role/choose_role.dart';
import 'package:educate/features/signup_instructor/signup_instructor/presentation/pages/signup_instructor.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import '../../features/home_admin/presentation/manager/home_admin_cubit.dart';
import '../../features/home_admin/presentation/pages/home_admin.dart';
import '../../features/home_admin/presentation/widgets/published_screen_admin.dart';
import '../../features/home_admin/presentation/widgets/unpublished_courses_admin.dart';
import '../../features/home_instructor/presentation/pages/Home_instructor.dart';
import '../../features/home_instructor/presentation/widgets/get_myCourses.dart';
import '../../features/home_instructor/presentation/widgets/published_screen_i.dart';
import '../../features/home_instructor/presentation/widgets/search_screen_i.dart';
import '../../features/home_student/presentation/manager/home_student_cubit.dart';
import '../../features/home_student/presentation/pages/home_student.dart';
import '../../features/home_student/presentation/widgets/published_screen.dart';
import '../../features/home_student/presentation/widgets/search_screen.dart';
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

      case AppRoutes.chooseRole:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) => const ChooseRole(),
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

      case AppRoutes.signupStudent:
        return PageTransition(
          settings: routeSettings,
          child: BlocProvider(
            create: (BuildContext context) => getIt<SignupStudentCubit>(),
            child: SignUpStudent(),
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

      case AppRoutes.searchCoursesStudent:
        return PageTransition(
          settings: routeSettings,
          child: BlocProvider(
            create: (BuildContext context) => getIt<HomeStudentCubit>(),
            child: SearchScreen(),
          ),
          type: PageTransitionType.fade,
        );

      case AppRoutes.publishedCoursesStudent:
        return PageTransition(
          settings: routeSettings,
          child: BlocProvider(
            create: (BuildContext context) =>
                getIt<HomeStudentCubit>()..publishedCourses(),
            child: const PublishedScreen(),
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
            create: (BuildContext context) {
              final homeInstructorCubit = getIt<HomeInstructorCubit>();
              homeInstructorCubit.loadAllCourses();
              return homeInstructorCubit;
            },
            child: const HomeInstructor(),
          ),
          type: PageTransitionType.fade,
        );

      case AppRoutes.publishedCoursesInstructor:
        return PageTransition(
          settings: routeSettings,
          child: BlocProvider(
            create: (BuildContext context) =>
                getIt<HomeInstructorCubit>()..publishedCourses(),
            child: const PublishedScreenI(),
          ),
          type: PageTransitionType.fade,
        );

      case AppRoutes.myCoursesInstructor:
        return PageTransition(
          settings: routeSettings,
          child: BlocProvider(
            create: (BuildContext context) =>
                getIt<HomeInstructorCubit>()..getMyCourses(),
            child: const GetMyCourses(),
          ),
          type: PageTransitionType.fade,
        );

      case AppRoutes.searchCoursesInstructor:
        return PageTransition(
          settings: routeSettings,
          child: BlocProvider(
            create: (BuildContext context) => getIt<HomeInstructorCubit>(),
            child: SearchScreeI(),
          ),
          type: PageTransitionType.fade,
        );

      /// admin routes
      case AppRoutes.adminHome:
        return PageTransition(
          settings: routeSettings,
          child: const HomeAdmin(),
          type: PageTransitionType.fade,
        );

      case AppRoutes.publishedCoursesAdmin:
        return PageTransition(
          settings: routeSettings,
          child: BlocProvider(
            create: (BuildContext context) =>
                getIt<HomeAdminCubit>()..publishedCourses(),
            child: const PublishedScreenAdmin(),
          ),
          type: PageTransitionType.fade,
        );

      case AppRoutes.unpublishedCoursesAdmin:
        return PageTransition(
          settings: routeSettings,
          child: BlocProvider(
            create: (BuildContext context) =>
                getIt<HomeAdminCubit>()..unPublishedCourses(),
            child: const UnPublishedScreenAdmin(),
          ),
          type: PageTransitionType.fade,
        );
    }

    return null;
  }
}
