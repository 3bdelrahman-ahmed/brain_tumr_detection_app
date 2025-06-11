import 'package:brain_tumr_detection_app/core/data/network_services/api_error_handler.dart';
import 'package:brain_tumr_detection_app/features/contact_us/data/models/contact_us_model.dart';
import 'package:brain_tumr_detection_app/features/contact_us/data/remote/contact_us_remote_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
@singleton
class ContactUsRepository {
  final ContactUsRemoteDataSource remoteDataSource;
  ContactUsRepository({required this.remoteDataSource});

  Future<Either<ApiErrorModel,ContactUsResponseModel>> sendMessage(ContactUsRequestModel body) async {
    try {
      final response = await remoteDataSource.sendMessage(body);
      return Right(response);
    } catch (error) {
      return Left(ErrorHandler.handle(error));
    }
  }
}