import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../foundations/app_constants.dart';
import '../../../data/models/get_doctor_request_model.dart';
import '../../../data/models/get_doctor_response.dart';
import '../../../data/repository/get_doctors_clinics_repository.dart'; // Add this import

part 'app_state.dart';

@injectable
class AppCubit extends Cubit<AppState> {
  final GetDoctorsClinicsRepository getDoctorsClinicsRepository;

  AppCubit(this.getDoctorsClinicsRepository) : super(AppInitial()) {
    isEnglish = AppConstants.langCode;
  }

  bool isEnglish = true;
  GetDoctorResponseModel? doctorsClinicsResponse;

  void changeLanguage(bool lang) {
    AppConstants.setLanguage(lang);
    isEnglish = lang;
    emit(ChangeLanguage(lang));
  }

  Future<void> getDoctorsClinics() async {
    print("__________________ A PATIENT ______________");
    emit(GetDoctorsClinicsLoading());
    final result = await getDoctorsClinicsRepository.getDoctorsClinics(
      GetDoctorRequestModel(
        pageSize: 10,
        pageIndex: 1,
        search: '',
        long: 31.242681,
        lat: 30.091584,
      ),
    );
    result.fold(
          (error) {
        emit(GetDoctorsClinicsError(error.toString()));
      },
          (response) {
        doctorsClinicsResponse = response;
        emit(GetDoctorsClinicsSuccess());
      },
    );
  }
}

