import 'package:brain_tumr_detection_app/core/data/network_services/api_service.dart';
import 'package:brain_tumr_detection_app/features/contact_us/data/models/contact_us_model.dart';
import 'package:brain_tumr_detection_app/foundations/app_urls.dart';
import 'package:injectable/injectable.dart';

@singleton
class ContactUsRemoteDataSource {

  Future<ContactUsResponseModel> sendMessage(ContactUsRequestModel body) async{
    final response = await AppDio().post(path: AppUrls.contactUs, data: body.toJson());
    return ContactUsResponseModel.fromJson(response.data);
  }
}