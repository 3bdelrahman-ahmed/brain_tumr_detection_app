import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/toast_string_extenstion.dart';
import 'package:brain_tumr_detection_app/core/utils/strings/app_string.dart';
import 'package:brain_tumr_detection_app/features/register/data/models/register_model.dart';
import 'package:brain_tumr_detection_app/features/register/data/repository/register_repository.dart';
import 'package:brain_tumr_detection_app/features/register/presentation/view_model/rigester_screen_state.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/config/app_routing.dart';
import '../../../../core/utils/extenstions/navigation_extenstions.dart';

@injectable
class RigesterScreenCubit extends Cubit<RigesterScreenState> {
  final RegisterRepository registerRepository;

  RigesterScreenCubit({required this.registerRepository})
      : super(RigesterScreenInitial());
  final GlobalKey<FormState> patientFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> doctorFormKey = GlobalKey<FormState>();
  File? imagePath;

  DateTime? pickedDate;
  final fullNameController = TextEditingController();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final FocusNode emailFocus = FocusNode();
  final FocusNode fullNameFocus = FocusNode();
  final FocusNode userNameFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  final ImagePicker picker = ImagePicker();
  final selectedGender = TextEditingController();
  int? currentIndex = 0;
  LatLng? position;
  String? streetName;
  BuildContext context = NavigationExtensions.navigatorKey.currentContext!;
  bool isSelectMaleGenders = false;
  bool isSelectFemaleGenders = false;
  File? documentFile;
 String? doctorFileName;
  String? documentError;
  void setDocumentFile(File file,String fileName) {
    documentFile = file;
    doctorFileName = fileName;
    documentError = null;
    emit(RigesterScreenSuccessState());
  }
  void setDocumentError(String error) {
    documentError = error;
  }

  void setUserLocation(LatLng location, String street) {
    position = location;
    streetName = street;
    print("User Location Saved: $position, $streetName");
    emit(RigesterScreenUpdateScreen());
  }

  Future<void> registerPatient() async {
    if (patientFormKey.currentState!.validate()) {
      emit(RigesterScreenLoadingState());
      final result = await registerRepository.register(RegisterRequestModel(
          imagePath,
          fullNameController.text,
          userNameController.text,
          emailController.text,
          pickedDate.toString(),
          passwordController.text,
          position!.latitude,
          position!.longitude,
          selectedGender.text));
      result.fold((l) {
        l.message!.showToast();
        emit(RigesterScreenErrorState());
      }, (r) async {
        context.navigateTo(AppRoutes.loginScreen);
        clear();

        emit(RigesterScreenSuccessState());
      });
    } else {
      print("Form is not valid");
    }
  }
  Future<void> registerDoctor() async {
    if (doctorFormKey.currentState!.validate()) {
      emit(RigesterScreenLoadingState());
      final result = await registerRepository.register(RegisterRequestModel(
          imagePath,
          fullNameController.text,
          userNameController.text,
          emailController.text,
          pickedDate.toString(),
          passwordController.text,
          position!.latitude,
          position!.longitude,
          selectedGender.text));
      result.fold((l) {
        l.message!.showToast();
        emit(RigesterScreenErrorState());
      }, (r) async {
        context.navigateTo(AppRoutes.loginScreen);
        clear();

        emit(RigesterScreenSuccessState());
      });
    } else {
      print("Form is not valid");
    }
  }

  void changeForm(int? index) {
    currentIndex = index;
    emit(RigesterScreenChangeForm(index: currentIndex!));
  }

  void setSelectedDate(DateTime date) {
    pickedDate = date;
    emit(RigesterScreenUpdateScreen()); // Notify UI to rebuild
  }

  void selectMaleGenders() {
    isSelectMaleGenders = true;
    isSelectFemaleGenders = false;
    selectedGender.text = AppStrings.male;
    emit(SelectGenderState(gender: AppStrings.male));
  }

  void selectFemaleGenders() {
    isSelectMaleGenders = false;
    isSelectFemaleGenders = true;
    selectedGender.text = AppStrings.female;
    emit(SelectGenderState(gender: AppStrings.female));
  }

  void saveImage(File image) {
    imagePath = image;
    print(imagePath?.path);
    emit(RigesterScreenUpdateScreen());
  }

  void clear() {
    fullNameController.clear();
    userNameController.clear();
    emailController.clear();
    passwordController.clear();
    streetName = null;
    selectedGender.clear();
    pickedDate = null;
    emit(ClearAuthFieldsState());
  }
}
