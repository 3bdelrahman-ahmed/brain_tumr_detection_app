part of 'reports_cubit.dart';

@immutable
sealed class ReportsState {}

final class ReportsInitial extends ReportsState {}

final class ReportsViewReport extends ReportsState {}

final class ReportsExpandedDiagnosis extends ReportsState {}

final class GetAssignedScansLoading extends ReportsState {}
final class GetAssignedScansSuccess extends ReportsState {
}
final class GetAssignedScansFailure extends ReportsState {
}


final class ViewReportLoading extends ReportsState {}
final class ViewReportSuccess extends ReportsState {

}
final class ViewReportFailure extends ReportsState {

}