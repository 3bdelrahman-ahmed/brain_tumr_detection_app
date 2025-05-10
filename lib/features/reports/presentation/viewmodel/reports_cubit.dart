import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../data/model/ReportsDm.dart';

part 'reports_state.dart';

@injectable
class ReportsCubit extends Cubit<ReportsState> {
  ReportsCubit() : super(ReportsInitial());

  List<Report> reports = [
    Report(patientName: "Youssef Ibrahim Marzouk", profileUrl: ''),
    Report(patientName: "Mohamed Akram Tawfik", profileUrl: ''),
    Report(patientName: "Fawzy Aly Alaa", profileUrl: ''),
    Report(patientName: "Abdelrahman Mohamed", profileUrl: ''),
    Report(patientName: "Ana Shab Gamed Tahn ", profileUrl: ''),
    Report(patientName: "Ana BAMOOOOOT", profileUrl: ''),
    Report(patientName: "معنديش دماغ يخواتي والله", profileUrl: ''),
    Report(patientName: "Youssef Ibrahim Marzouk", profileUrl: ''),
    Report(patientName: "Youssef Ibrahim Marzouk", profileUrl: ''),
    Report(patientName: "Youssef Ibrahim Marzouk", profileUrl: ''),
    Report(patientName: "Youssef Ibrahim Marzouk", profileUrl: ''),
    Report(patientName: "Youssef Ibrahim Marzouk", profileUrl: ''),
    Report(patientName: "Youssef Ibrahim Marzouk", profileUrl: ''),
    Report(patientName: "Youssef Ibrahim Marzouk", profileUrl: ''),
  ];

  void onViewReport(int index) {
    reports[index].isViewed = !reports[index].isViewed;
    emit(ReportsViewReport());
  }
}
