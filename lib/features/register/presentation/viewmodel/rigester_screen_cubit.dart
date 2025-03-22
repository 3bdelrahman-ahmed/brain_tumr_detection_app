import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

part 'rigester_screen_state.dart';
@injectable
class RigesterScreenCubit extends Cubit<RigesterScreenState> {
  RigesterScreenCubit() : super(RigesterScreenInitial());
  final formKey = GlobalKey<FormState>();
  XFile? imagePath ;
  DateTime? pickedDate;
  final fullNameController = TextEditingController();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ImagePicker picker = ImagePicker();
  String? selectedGender;
  int? currentIndex = 0;
  LatLng? position;
  String? streetName;

  void setUserLocation(LatLng location, String street) {
    position = location;
    streetName = street;
    print("User Location Saved: $position, $streetName");
    emit(RigesterScreenUpdateScreen());
  }
  void register(){
    if (formKey.currentState!.validate()) {
      print("Form is valid! Proceed with registration...");
      clear();
    } else {
      print("Form is not valid");
    }
  }
   void changeForm(int? index){
     currentIndex = index;
    emit(RigesterScreenChangeForm());
   }
  void setSelectedDate(DateTime date){
    pickedDate = date;
    emit(RigesterScreenUpdateScreen()); // Notify UI to rebuild
  }
  void setSelectedGender(String gender) {
    selectedGender = gender;
    print("Selected Gender : ${selectedGender}");
    emit(RigesterScreenUpdateScreen());
  }
  void saveImage(XFile image){
    imagePath = image;
    print(imagePath?.path);
    emit(RigesterScreenUpdateScreen());
  }

  void clear(){
    fullNameController.clear();
    userNameController.clear();
    emailController.clear();
    passwordController.clear();
  }
}
