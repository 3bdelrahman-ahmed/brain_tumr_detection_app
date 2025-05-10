part of 'scan_cubit.dart';

@immutable
sealed class ScanState {}

final class ScanInitial extends ScanState {}

final class ScanFilePicked extends ScanState {}

final class ScanLoading extends ScanState {
  final int progress;
  ScanLoading(this.progress);
}

final class ScanFileUploaded extends ScanState {}
