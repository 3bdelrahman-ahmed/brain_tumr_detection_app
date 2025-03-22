import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/toast_string_extenstion.dart';
import 'package:brain_tumr_detection_app/features/register/data/models/register_model.dart';
import 'package:brain_tumr_detection_app/features/register/data/repository/register_repository.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/config/app_routing.dart';
import '../../../../core/utils/extenstions/navigation_extenstions.dart';

part 'rigester_screen_state.dart';

@injectable
class RigesterScreenCubit extends Cubit<RigesterScreenState> {
  final RegisterRepository registerRepository;

  RigesterScreenCubit({required this.registerRepository})
      : super(RigesterScreenInitial());
  final formKey = GlobalKey<FormState>();
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
  String? selectedGender;
  int? currentIndex = 0;
  LatLng? position;
  String? streetName;
  BuildContext context = NavigationExtensions.navigatorKey.currentContext!;

  void setUserLocation(LatLng location, String street) {
    position = location;
    streetName = street;
    print("User Location Saved: $position, $streetName");
    emit(RigesterScreenUpdateScreen());
  }

  Future<void> register() async {
    if (formKey.currentState!.validate()) {
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
          selectedGender!));
      result.fold((l) {
        l.message!.showToast();
        emit(RigesterScreenErrorState());
      }, (r) async {
        context.navigateTo(AppRoutes.loginScreen);
        emit(RigesterScreenSuccessState());
      });
      //   print("Image Path: ${imagePath}");
      //   print("Full Name: ${fullNameController.text}");
      //   print("Username: ${userNameController.text}");
      //   print("Email: ${emailController.text}");
      //   print("Date of Birth: ${ pickedDate?.toIso8601String().split("T")[0], // Converts to yyyy-MM-dd
      // }");
      //   print("Password: ${passwordController.text}");
      //   print("Latitude: ${position!.latitude}");
      //   print("Longitude: ${position!.longitude}");
      //   print("Gender: ${selectedGender}");
      clear();
    } else {
      print("Form is not valid");
    }
  }

  void changeForm(int? index) {
    currentIndex = index;
    emit(RigesterScreenChangeForm());
  }

  void setSelectedDate(DateTime date) {
    pickedDate = date;
    emit(RigesterScreenUpdateScreen()); // Notify UI to rebuild
  }

  void setSelectedGender(String gender) {
    selectedGender = gender;
    print("Selected Gender : ${selectedGender}");
    emit(RigesterScreenUpdateScreen());
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
  }
}
