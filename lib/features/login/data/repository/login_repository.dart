import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/data/network_services/api_error_handler.dart';
import '../models/login_model.dart';
import '../remote/login_remote_data_source.dart';

@singleton
class LoginRepository {
  final LoginRemoteDataSource dataSource;
  LoginRepository({required this.dataSource});

  Future<Either<ApiErrorModel, LoginResponseModel>> login(
      LoginRequestModel parameters) async {
    try {
      final response = await dataSource.login(parameters);
      return Right(response);
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  // Future<Either<ApiErrorModel,String>> sentDiviceToken(String token) async {
  //   try {
  //     final respons = await dataSource.sentDeviceToken(token);
  //     return Right(respons);
  //   } on Exception catch (e) {
  //     return Left(ErrorHandler.handle(e));
  //   }
  // }
}
