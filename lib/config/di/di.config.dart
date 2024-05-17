// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:educate/core/services/api/api_service.dart' as _i5;
import 'package:educate/features/home_admin/presentation/manager/home_admin_cubit.dart'
    as _i4;
import 'package:educate/features/home_instructor/presentation/manager/create/home_instructor_cubit.dart'
    as _i9;
import 'package:educate/features/home_student/presentation/manager/home_student_cubit.dart'
    as _i3;
import 'package:educate/features/login/presentation/manager/login_cubit.dart'
    as _i6;
import 'package:educate/features/signup_instructor/signup_instructor/presentation/manager/signup_instructor_cubit.dart'
    as _i7;
import 'package:educate/features/signup_student/presentation/manager/signup_student_cubit.dart'
    as _i8;
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
    gh.factory<_i3.HomeStudentCubit>(() => _i3.HomeStudentCubit());
    gh.factory<_i4.HomeAdminCubit>(() => _i4.HomeAdminCubit());
    gh.singleton<_i5.ApiService>(() => _i5.ApiService());
    gh.factory<_i6.LoginCubit>(() => _i6.LoginCubit(gh<_i5.ApiService>()));
    gh.factory<_i7.SignupInstructorCubit>(
        () => _i7.SignupInstructorCubit(gh<_i5.ApiService>()));
    gh.factory<_i8.SignupStudentCubit>(
        () => _i8.SignupStudentCubit(gh<_i5.ApiService>()));
    gh.factory<_i9.HomeInstructorCubit>(
        () => _i9.HomeInstructorCubit(gh<_i5.ApiService>()));
    return this;
  }
}
