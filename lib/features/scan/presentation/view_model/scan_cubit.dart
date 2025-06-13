import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/navigation_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/toast_string_extenstion.dart';
import 'package:brain_tumr_detection_app/features/scan/data/repo/upload_scan%20_repotitory.dart';
import 'package:brain_tumr_detection_app/foundations/app_constants.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import '../../../../core/helper/functions/show_default_dialog_function.dart';
import '../../data/models/upload_scan_model.dart';
import '../view/widgets/sucess_upload_dialog.dart';

part 'scan_state.dart';

@injectable
class ScanCubit extends Cubit<ScanState> {
  final UploadScanRepotitory repotitory;

  ScanCubit({required this.repotitory}) : super(ScanInitial());

  File? file;
  String fileName = "";
  bool isCancelled = false;
  final BuildContext context =
      NavigationExtensions.navigatorKey.currentContext!;

  void pickFile() async {
    isCancelled = false;
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
    );

    if (result == null) {
      emit(ScanInitial());
      return;
    }
    //Simulate Loading Progress

    file = File(result.files.single.path!);
    fileName = result.files.single.name;
    if (!isCancelled) {
      emit(ScanFilePicked());
    }
    emit(ScanFilePicked());
  }

  Future<void> uploadScan() async {
    emit(UploadScanLoadingState());

    final result = await repotitory.uploadScan(UploadScanRequestModel(
      image: file!,
      lat: AppConstants.currentLocation?.latitude ?? 30.01,
      long: AppConstants.currentLocation?.longitude ?? 30.01,
    ));
    result.fold((l) {
      l.message!.showToast();
      emit(UploadScanErrorState());
    }, (r) {
      showDefaultDialog(context, child: SucessUploadDialog());
      file = null;
      fileName = "";
      isCancelled = false;
      emit(UploadScanSuccessState());
    });
  }

  void cancelUpload() {
    file = null; // Clear the file
    isCancelled = true; // Stop progress loop
    emit(ScanInitial());
  }
}

//We Need When Connected with Backend to link when user press Done To send the file to Database
