part of 'scan_cubit.dart';

@immutable
sealed class ScanState {}

final class ScanInitial extends ScanState {}

final class ScanFilePicked extends ScanState {}

final class UploadScanLoadingState extends ScanState {
  
  UploadScanLoadingState();
}

final class ScanFileUploaded extends ScanState {}

final class UploadScanSuccessState extends ScanState {}

final class UploadScanErrorState extends ScanState {}
