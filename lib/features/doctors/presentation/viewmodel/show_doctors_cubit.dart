import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'show_doctors_state.dart';

class ShowDoctorsCubit extends Cubit<ShowDoctorsState> {
  ShowDoctorsCubit() : super(ShowDoctorsInitial());
}
