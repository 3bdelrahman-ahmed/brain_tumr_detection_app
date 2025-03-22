// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../../features/feed/presentation/view_model/cubit/feed_cubit.dart'
    as _i1069;
import '../../../features/login/data/remote/login_remote_data_source.dart'
    as _i609;
import '../../../features/login/data/repository/login_repository.dart' as _i340;
import '../../../features/login/presentation/view_model/login_cubit.dart'
    as _i638;
import '../../../features/onboarding/manager/onboarding_cubit.dart' as _i379;
import '../../../features/register/presentation/viewmodel/rigester_screen_cubit.dart'
    as _i1054;
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
    gh.factory<_i1069.FeedCubit>(() => _i1069.FeedCubit());
    gh.factory<_i609.LoginRemoteDataSource>(
        () => _i609.LoginRemoteDataSource());
    gh.factory<_i379.OnboardingCubit>(() => _i379.OnboardingCubit());
    gh.factory<_i1054.RigesterScreenCubit>(() => _i1054.RigesterScreenCubit());
    gh.singleton<_i284.NavigationCubit>(() => _i284.NavigationCubit());
    gh.factory<_i935.LocationCubit>(
        () => _i935.LocationCubit(gh<_i458.LocationService>()));
    gh.factory<_i340.LoginRepository>(() =>
        _i340.LoginRepository(dataSource: gh<_i609.LoginRemoteDataSource>()));
    gh.factory<_i638.LoginCubit>(
        () => _i638.LoginCubit(repository: gh<_i340.LoginRepository>()));
    return this;
  }
}
