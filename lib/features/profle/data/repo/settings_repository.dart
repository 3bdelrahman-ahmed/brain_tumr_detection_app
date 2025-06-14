import 'package:brain_tumr_detection_app/features/profle/data/remote/settings_remote_data_sourec.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/data/network_services/api_error_handler.dart';

@singleton
class SettingsRepository {
  final SettingsRemoteDataSourec remoteDataSource;

  SettingsRepository({required this.remoteDataSource});

    Future<Either<ApiErrorModel, String>> forgetPassword(String email) async {
    try {
      final response = await remoteDataSource.forgetPassword(email);
      return Right(response);
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

}