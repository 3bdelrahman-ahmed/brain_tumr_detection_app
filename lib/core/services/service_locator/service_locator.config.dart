  // GENERATED CODE - DO NOT MODIFY BY HAND

  // **************************************************************************
  // InjectableConfigGenerator
  // **************************************************************************

  // ignore_for_file: type=lint
  // coverage:ignore-file

  // ignore_for_file: no_leading_underscores_for_library_prefixes
  import 'package:brain_tumr_detection_app/features/login/data/remote/login_remote_data_source.dart';
import 'package:brain_tumr_detection_app/features/login/data/repository/login_repository.dart';
import 'package:get_it/get_it.dart' as _i174;
  import 'package:injectable/injectable.dart' as _i526;

  import '../../components/cubits/navigation_cubit/navigation_cubit.dart'
      as _i544;
  import '../../../features/login/presentation/view_model/login_screen_cubit.dart'
      as _i809;
  import '../../../features/onboarding/manager/onboarding_cubit.dart' as _i379;
  import '../../../features/register/presentation/viewmodel/location_cubit.dart'
      as _i450;
  import '../../../features/register/presentation/viewmodel/rigester_screen_cubit.dart'
      as _i1054;
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

      /// [login]
            gh.factory<_i809.LoginScreenCubit>(() => _i809.LoginScreenCubit(repository: gh<LoginRepository>() ));
            gh.singleton<LoginRemoteDataSource>(() => LoginRemoteDataSource());
            gh.singleton<LoginRepository>(() => LoginRepository(dataSource: gh<LoginRemoteDataSource>()));

      gh.factory<_i458.LocationService>(() => _i458.LocationService());
      gh.factory<_i379.OnboardingCubit>(() => _i379.OnboardingCubit());
      gh.factory<_i1054.RigesterScreenCubit>(() => _i1054.RigesterScreenCubit());
      gh.singleton<_i544.NavigationCubit>(() => _i544.NavigationCubit());
      gh.factory<_i450.LocationCubit>(
          () => _i450.LocationCubit(gh<_i458.LocationService>()));
      return this;
    }
  }
