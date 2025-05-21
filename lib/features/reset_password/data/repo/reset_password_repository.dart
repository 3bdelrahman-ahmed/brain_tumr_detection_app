import 'package:brain_tumr_detection_app/core/data/network_services/api_error_handler.dart';
import 'package:brain_tumr_detection_app/features/reset_password/data/model/reset_password_request_model.dart';
import 'package:brain_tumr_detection_app/features/reset_password/data/remote/reset_password_data_soruce.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetPasswordRepository {
  ResetPasswordDataSource resetPasswordDataSource;

  ResetPasswordRepository(this.resetPasswordDataSource);

  Future<Either<ApiErrorModel,String>> resetPassword(ResetPasswordRequestModel request) async{
    try{
      final response = await resetPasswordDataSource.resetPassword(request);
      return Right(response);
    }
    on Exception catch(e){
      return Left(ErrorHandler.handle(e));
    }
  }
}
