import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../data/model/ReportsDm.dart';

part 'reports_state.dart';
@injectable
class ReportsCubit extends Cubit<ReportsState> {
  ReportsCubit() : super(ReportsInitial());
  List<Report> reports = List.generate(15, (index) => Report(
    patientName: 'Patient $index',
    profileUrl: '',
  ));

  void onViewReport(int index) {
    reports[index].isViewed = !reports[index].isViewed;
    emit(ReportsViewReport());
  }
}
