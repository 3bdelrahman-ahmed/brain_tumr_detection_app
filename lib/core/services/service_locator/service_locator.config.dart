// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../../features/appointments/presentation/viewmodel/appointment_cubit.dart'
    as _i656;
import '../../../features/feed/presentation/view_model/cubit/feed_cubit.dart'
    as _i1069;
import '../../../features/login/data/remote/login_remote_data_source.dart'
    as _i609;
import '../../../features/login/data/repository/login_repository.dart' as _i340;
import '../../../features/login/presentation/view_model/login_cubit.dart'
    as _i638;
import '../../../features/onboarding/presentation/view_model/onboarding_cubit.dart'
    as _i775;
import '../../../features/register/data/remote/register_remote_data_source.dart'
    as _i301;
import '../../../features/register/data/repository/register_repository.dart'
    as _i558;
import '../../../features/register/presentation/view_model/rigester_screen_cubit.dart'
    as _i5;
import '../../../features/scan/viewmodel/scan_cubit.dart' as _i109;
import '../../../features/verification_code/data/remote/verify_code_remote_data_source.dart'
    as _i790;
import '../../../features/verification_code/data/repository/verify_code_repository.dart'
    as _i487;
import '../../../features/verification_code/presentation/view_model/cubit/verification_code_cubit.dart'
    as _i844;
import '../../components/cubits/location_cubit/location_cubit.dart' as _i935;
import '../../components/cubits/navigation_cubit/navigation_cubit.dart'
    as _i284;
import '../location_service.dart' as _i458;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i458.LocationService>(() => _i458.LocationService());
    gh.factory<_i656.AppointmentCubit>(() => _i656.AppointmentCubit());
    gh.factory<_i1069.FeedCubit>(() => _i1069.FeedCubit());
    gh.factory<_i775.OnboardingCubit>(() => _i775.OnboardingCubit());
    gh.factory<_i109.ScanCubit>(() => _i109.ScanCubit());
    gh.singleton<_i284.NavigationCubit>(() => _i284.NavigationCubit());
    gh.singleton<_i609.LoginRemoteDataSource>(
        () => _i609.LoginRemoteDataSource());
    gh.singleton<_i301.RegisterRemoteDataSource>(
        () => _i301.RegisterRemoteDataSource());
    gh.singleton<_i790.VerifyCodeRemoteDataSource>(
        () => _i790.VerifyCodeRemoteDataSource());
    gh.singleton<_i487.VerifyCodeRepository>(() => _i487.VerifyCodeRepository(
        dataSource: gh<_i790.VerifyCodeRemoteDataSource>()));
    gh.singleton<_i558.RegisterRepository>(() => _i558.RegisterRepository(
        dataSource: gh<_i301.RegisterRemoteDataSource>()));
    gh.factory<_i935.LocationCubit>(
        () => _i935.LocationCubit(gh<_i458.LocationService>()));
    gh.factory<_i5.RigesterScreenCubit>(() => _i5.RigesterScreenCubit(
        registerRepository: gh<_i558.RegisterRepository>()));
    gh.singleton<_i340.LoginRepository>(() =>
        _i340.LoginRepository(dataSource: gh<_i609.LoginRemoteDataSource>()));
    gh.factory<_i638.LoginCubit>(
        () => _i638.LoginCubit(repository: gh<_i340.LoginRepository>()));
    gh.factory<_i844.VerificationCodeCubit>(() => _i844.VerificationCodeCubit(
        repository: gh<_i487.VerifyCodeRepository>()));
    return this;
  }
}
