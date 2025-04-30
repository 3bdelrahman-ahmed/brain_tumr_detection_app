import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../foundations/app_constants.dart';
import '../../../data/models/doctor_clinic_model.dart';
import '../../../data/models/get_doctor_request_model.dart';
import '../../../data/models/get_doctor_response.dart';
import '../../../data/repository/get_doctors_clinics_repository.dart'; // Add this import

part 'app_state.dart';

@injectable
class AppCubit extends Cubit<AppState> {
  final GetDoctorsClinicsRepository repository;

  AppCubit(this.repository) : super(AppInitial()) {
    isEnglish = AppConstants.langCode;
  }

  bool isEnglish = true;

  void changeLanguage(bool lang) {
    AppConstants.setLanguage(lang);
    isEnglish = lang;
    emit(ChangeLanguage(lang));
  }

  List<DoctorClinicModel> doctorsList = [];

  // internal paging state
  int _pageIndex = 1;
  final int _pageSize = 10;
  int _totalPages = 1;
  bool _isFetching = false;

  Future<void> getDoctorsClinics({required bool reset}) async {
    if (_isFetching) return;
    // on reset, clear list and start from page 1
    if (reset) {
      _pageIndex = 1;
      doctorsList.clear();
    } else {
      // if no more pages, bail out
      if (_pageIndex >= _totalPages) return;
      _pageIndex++;
    }

    _isFetching = true;
    emit(GetDoctorsClinicsLoading(isPaging: !reset));

    final result = await repository.getDoctorsClinics(
      GetDoctorRequestModel(
        pageIndex: _pageIndex,
        pageSize: _pageSize,
        search: '',
        long: 31.242681,
        lat: 30.091584,
      ),
    );

    result.fold(
      (err) {
        _isFetching = false;
        emit(GetDoctorsClinicsError(err.toString()));
      },
      (resp) {
        // update totalPages from response
        _totalPages = resp.totalPages;
        doctorsList.addAll(resp.data);
        _isFetching = false;
        emit(GetDoctorsClinicsSuccess());
      },
    );
  }
}
