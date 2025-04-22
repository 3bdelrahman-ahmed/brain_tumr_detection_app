import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/toast_string_extenstion.dart';
import 'package:brain_tumr_detection_app/core/utils/strings/app_string.dart';
import 'package:brain_tumr_detection_app/features/register/data/models/register_model.dart';
import 'package:brain_tumr_detection_app/features/register/data/repository/register_repository.dart';
import 'package:brain_tumr_detection_app/features/register/presentation/view_model/rigester_screen_state.dart';
import 'package:file_picker/file_picker.dart';
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

  List<GlobalKey<FormState>> formKeys = [
    GlobalKey<FormState>(), // Patient Form Key
    GlobalKey<FormState>(), // Doctor Form Key
    GlobalKey<FormState>(), // Clinic Form Key
  ];

  DateTime? pickedDate;
  final fullNameController = TextEditingController();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final clinicLicenseController = TextEditingController();
  final licenseFrontController = TextEditingController();
  final licenseBackController = TextEditingController();
  final clinicPhoneNumberController = TextEditingController();
  final FocusNode emailFocus = FocusNode();
  final FocusNode fullNameFocus = FocusNode();
  final FocusNode clinicPhoneNumberFocus = FocusNode();
  final FocusNode userNameFocus = FocusNode();
  final FocusNode birthDateFocus = FocusNode();
  final FocusNode genderFocus = FocusNode();
  final FocusNode imageFocus = FocusNode();
  final FocusNode locationFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  final ImagePicker picker = ImagePicker();
  final selectedGender = TextEditingController();
  int currentIndex = 0;
  LatLng? position;
  String? streetName;
  BuildContext context = NavigationExtensions.navigatorKey.currentContext!;
  bool isSelectMaleGenders = false;
  bool isSelectFemaleGenders = false;
  File? doctorLicenseForont;
  File? doctorLicenseBack;
  File? clinicLicenseFile;
  File? profileImage;

  void setDoctorLicenseFrontFile(File file) {
    doctorLicenseForont = file;
    licenseFrontController.text = file.path.split('/').last;
    emit(SetDoctorLicenseState(fileName: file.path.split('/').last));
  }

  void setDoctorLicenseBackFile(File file) {
    doctorLicenseBack = file;
    licenseBackController.text = file.path.split('/').last;
    emit(SetDoctorLicenseState(fileName: file.path.split('/').last));
  }

  void setClinicLicense(File license) {
    clinicLicenseController.text = license.path.split('/').last;
    clinicLicenseFile = license;
    emit(SetClinicLiscenseState());
  }

  void setUserLocation(LatLng location, String street) {
    position = location;
    streetName = street;
    print("User Location Saved: $position, $streetName");
    emit(RigesterScreenUpdateScreen());
  }

  Future<void> registerPatient() async {
    emit(RigesterScreenLoadingState());
    final result = await registerRepository.patientRegister(
        PatientRegisterRequestModel(
            profileImage,
            fullNameController.text.trim(),
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
      context.navigateTo(AppRoutes.verificationCodeScreen, arguments: r.email);
      clear();

      emit(RigesterScreenSuccessState());
    });
  }

  Future<void> registerDoctor() async {
    emit(RigesterScreenLoadingState());
    final result =
        await registerRepository.doctorRegister(DoctorRegisterRequestModel(
      clinicAddress: streetName!,
      cliniclicense: clinicLicenseFile!,
      dateOfBirth: pickedDate.toString(),
      licenseBack: doctorLicenseBack!,
      licenseFront: doctorLicenseForont!,
      latitude: position!.latitude,
      longitude: position!.longitude,
      phone: clinicPhoneNumberController.text,
      profileProfile: profileImage!,
      fullName: fullNameController.text.trim(),
      userName: userNameController.text,
      email: emailController.text,
      password: passwordController.text,
      gender: selectedGender.text,
    ));
    result.fold((l) {
      l.message!.showToast();
      emit(RigesterScreenErrorState());
    }, (r) async {
      context.navigateTo(AppRoutes.verificationCodeScreen, arguments: r.email);
      clear();

      emit(RigesterScreenSuccessState());
    });
  }

  void changeForm(int index) {
    currentIndex = index;
    emit(RigesterScreenChangeForm(index: currentIndex));
  }

  void setSelectedDate(DateTime date) {
    pickedDate = date;
    emit(RigesterScreenUpdateScreen()); // Notify UI to rebuild
  }

  Future<File?> pickDocument() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'jpg', 'png', 'doc', 'docx'],
      );

      if (result != null) {
        File file = File(result.files.single.path!);
        return file;
      }
    } catch (e) {
      print("Error picking document: $e");
    }
    return null;
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
    profileImage = image;
    print(profileImage?.path);
    emit(RigesterScreenUpdateScreen());
  }

  void clear() {
    profileImage = null;
    fullNameController.clear();
    userNameController.clear();
    emailController.clear();
    passwordController.clear();
    licenseFrontController.clear();
    licenseBackController.clear();
    clinicPhoneNumberController.clear();
    doctorLicenseForont = null;
    doctorLicenseBack = null;
    clinicLicenseFile = null;
    position = null;
    isSelectMaleGenders = false;
    isSelectFemaleGenders = false;
    streetName = null;
    selectedGender.clear();
    pickedDate = null;
    emit(ClearAuthFieldsState());
  }
}
