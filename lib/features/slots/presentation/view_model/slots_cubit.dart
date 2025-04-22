import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import '../../data/model/Slots.dart';

part 'slots_state.dart';

@injectable
class SlotsCubit extends Cubit<SlotsState> {
  SlotsCubit() : super(SlotsInitial()) {
    // Initialize dummy slots
    slots = List.generate(5, (index) => Slot(index, "0${index}:00 PM"));
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
  void goToNext(){
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
  void addSlot(DateTime slotTime){
    slots.add(Slot(slots.length, DateFormat('hh:mm a').format(slotTime)));
    emit(SlotsListAdded());
  }

  void editSlot(int index, DateTime slotTime) {
    if (index >= 0 && index < slots.length) {
      slots[index] = Slot(index,DateFormat('hh:mm a').format(slotTime));
      emit(SlotsListUpdated());
    }
  }

  void undoRemove(){
    if (_lastRemovedSlot != null && _lastRemovedIndex != null) {
      slots.insert(_lastRemovedIndex!, _lastRemovedSlot!);
      _lastRemovedSlot = null;
      _lastRemovedIndex = null;
      emit(SlotsUndoRemoved());
    }
  }
}
