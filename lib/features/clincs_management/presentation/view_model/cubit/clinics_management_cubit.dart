import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/toast_string_extenstion.dart';
import 'package:brain_tumr_detection_app/features/clincs_management/data/models/add_clinic_model.dart';
import 'package:brain_tumr_detection_app/features/clincs_management/data/repo/clinic_management_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../../../../generated/l10n.dart';

part 'clinics_management_state.dart';

@injectable
class ClinicsManagementCubit extends Cubit<ClinicsManagementState> {
  final ClinicManagementRepository repository;
  ClinicsManagementCubit({required this.repository})
      : super(ClinicsManagementInitial());

  final TextEditingController clinicPhoneNumberController =
      TextEditingController();
  TextEditingController clinicAddressController = TextEditingController();
  TextEditingController clinicLicenseController = TextEditingController();

  File? clinicLicenseFile;

  final formKey = GlobalKey<FormState>();

  void setClinicLicense(File license) {
    clinicLicenseController.text = license.path.split('/').last;
    clinicLicenseFile = license;
    print(clinicLicenseFile.toString());
    emit(SetClinicLiscenseState());
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

  LatLng? position;
  String? streetName;

  void setUserLocation(LatLng location, String street) {
    position = location;
    streetName = street;
    clinicAddressController.text = streetName!;
    print("User Location Saved: $position, $streetName");
    emit(SetClinicLocationState());
  }

  Future<void> addClinic(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      emit(AddClinicLoadingState());
      final result = await repository.addClinic(
        AddClinicRequestModel(
          phoneNumber: clinicPhoneNumberController.text,
          street: clinicAddressController.text,
          latitude: position?.latitude ?? 0,
          longitude: position?.longitude ?? 0,
          license: clinicLicenseFile!,
        ),
      );
      result.fold(
        (error) {
          emit(AddClinicErrorState());
        },
        (success) {
          S.of(context).clinicAddedSuccessfully.showToast();
          clinicPhoneNumberController.clear();
          clinicAddressController.clear();
          clinicLicenseController.clear();
          clinicLicenseFile = null;
          position = null;
          streetName = null;

          emit(AddClinicSuccessState());
        },
      );
    }
  }
}
