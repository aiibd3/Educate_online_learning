// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:educate/core/services/api/api_service.dart' as _i3;
import 'package:educate/features/home_instructor/presentation/manager/create/home_instructor_cubit.dart'
    as _i7;
import 'package:educate/features/login/presentation/manager/login_cubit.dart'
    as _i4;
import 'package:educate/features/signup_instructor/signup_instructor/presentation/manager/signup_instructor_cubit.dart'
    as _i5;
import 'package:educate/features/signup_student/presentation/manager/signup_student_cubit.dart'
    as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiService>(() => _i3.ApiService());
    gh.factory<_i4.LoginCubit>(() => _i4.LoginCubit(gh<_i3.ApiService>()));
    gh.factory<_i5.SignupInstructorCubit>(
        () => _i5.SignupInstructorCubit(gh<_i3.ApiService>()));
    gh.factory<_i6.SignupStudentCubit>(
        () => _i6.SignupStudentCubit(gh<_i3.ApiService>()));
    gh.factory<_i7.HomeInstructorCubit>(
        () => _i7.HomeInstructorCubit(gh<_i3.ApiService>()));
    return this;
  }
}
