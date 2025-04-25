import 'package:bloc/bloc.dart';
import 'package:brain_tumr_detection_app/features/slots/data/repository/clinics_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import '../../data/model/Slots.dart';
import '../../data/model/clinic.dart';

part 'slots_state.dart';

@injectable
class SlotsCubit extends Cubit<SlotsState> {
  final ClinicsRepository clinicsRepository;

  SlotsCubit({required this.clinicsRepository}) : super(SlotsInitial()) {
  getClinics();
  }

  List<Clinic> clinics = [];
  Clinic? selectedClinic;

  Future<void> getClinics() async {
    try {
      emit(SlotsLoading());
      final response = await clinicsRepository.getDoctorClinics();
      response.fold((l){
        print(l);
      }, (r) {
        clinics = r;
        if (clinics.isNotEmpty) {
          debugPrint(clinics[0].address);
        }});
      emit(SlotsGetClinics());
    } catch(e){
      print(e);
    }
  }

  void setSelectedClinic(Clinic? clinic) {
    selectedClinic = clinic;
    emit(SelectedClinicChanged()); // Create this new state if needed
  }

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 4));
  DateTime selectedDay = DateTime.now();
  List<Slot> slots = [];
  Slot? _lastRemovedSlot;
  int? _lastRemovedIndex;

  String formatDate() {
    return "${DateFormat('dd MMM yyyy').format(startDate)} -"
        " ${DateFormat('dd MMM yyyy').format(endDate)}";
  }

  void goToNext() {
    startDate = startDate.add(const Duration(days: 5));
    endDate = endDate.add(const Duration(days: 5));
    selectedDay = startDate;
    emit(SlotsChangeDays());
  }

  void goToPrevious() {
    startDate = startDate.subtract(const Duration(days: 5));
    endDate = endDate.subtract(const Duration(days: 5));
    selectedDay = startDate;
    emit(SlotsChangeDays());
  }

  void selectDay(DateTime day) {
    selectedDay = day;
    emit(SlotsSelectDay());
  }

  void removeSlot(int index) {
    _lastRemovedSlot = slots[index];
    _lastRemovedIndex = index;
    slots.removeAt(index);
    emit(SlotsListRemoved());
  }

  void addSlot(DateTime slotTime) {
    slots.add(Slot(slots.length, DateFormat('hh:mm a').format(slotTime)));
    emit(SlotsListAdded());
  }

  void editSlot(int index, DateTime slotTime) {
    if (index >= 0 && index < slots.length) {
      slots[index] = Slot(index, DateFormat('hh:mm a').format(slotTime));
      emit(SlotsListUpdated());
    }
  }

  void undoRemove() {
    if (_lastRemovedSlot != null && _lastRemovedIndex != null) {
      slots.insert(_lastRemovedIndex!, _lastRemovedSlot!);
      _lastRemovedSlot = null;
      _lastRemovedIndex = null;
      emit(SlotsUndoRemoved());
    }
  }
}
