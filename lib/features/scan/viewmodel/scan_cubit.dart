import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'scan_state.dart';

@injectable
class ScanCubit extends Cubit<ScanState> {
  ScanCubit() : super(ScanInitial());

  File? file;
  String fileName = "";
  bool isCancelled = false; // Flag to track cancellation

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
    emit(ScanLoading(0));
    for (int progress = 10; progress <= 90; progress += 20) {
      await Future.delayed(Duration(milliseconds: 300));
      if (isCancelled) {
        emit(ScanInitial()); // Stop progress if canceled
        return;
      }
      emit(ScanLoading(progress));
    }
    file = File(result.files.single.path!);
    fileName = result.files.single.name;
    if (!isCancelled) {
      emit(ScanFilePicked());
    }
  }

  void cancelUpload() {
    isCancelled = true; // Stop progress loop
    emit(ScanInitial());
  }
}

//We Need When Connected with Backend to link when user press Done To send the file to Database
