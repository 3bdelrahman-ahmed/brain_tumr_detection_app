import 'package:brain_tumr_detection_app/core/data/network_services/api_error_handler.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../models/edit_profile_model.dart';
import '../remote/edit_profile_remote_data_source.dart';
@singleton
class EditProfileRepository {
  final EditProfileRemoteDataSource remoteDataSource;

  EditProfileRepository({required this.remoteDataSource});


  Future<Either<ApiErrorModel, EditProfileResponseModel>> updateProfile(
      EditProfileRequestModel body) async {
    try {
      final response = await remoteDataSource.editProfile(body);
      return Right(response);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
}