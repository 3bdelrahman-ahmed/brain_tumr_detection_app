import 'package:brain_tumr_detection_app/core/data/network_services/api_error_handler.dart';
import 'package:brain_tumr_detection_app/features/verification_code/data/remote/verify_code_remote_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../models/verification_code_model.dart';

@singleton
class VerifyCodeRepository {
  final VerifyCodeRemoteDataSource dataSource;

  VerifyCodeRepository({required this.dataSource});

  Future<Either<ApiErrorModel, String>> verifyCode(
      VerificationCodeRequestModel body) async {
    try {
      final String response = await dataSource.verifyCode(body);
      return Right(response);
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  Future<Either<ApiErrorModel, String>> verifyForgetCode(
      VerificationCodeRequestModel body) async {
    try {
      final String response = await dataSource.verifyForgetCode(body);
      return Right(response);
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
}
