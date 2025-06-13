import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'medical_history_state.dart';
@injectable
class MedicalHistoryCubit extends Cubit<MedicalHistoryState> {
  MedicalHistoryCubit() : super(MedicalHistoryInitial());
}
