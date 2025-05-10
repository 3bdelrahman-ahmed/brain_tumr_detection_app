import 'package:bloc/bloc.dart';
import 'package:brain_tumr_detection_app/core/data/local_services/hive_caching_helper.dart';
import 'package:brain_tumr_detection_app/core/helper/functions/convert_time_slot_function.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/toast_string_extenstion.dart';
import 'package:brain_tumr_detection_app/features/slots/data/model/available_slots.dart';
import 'package:brain_tumr_detection_app/features/slots/data/repository/clinics_repository.dart';
import 'package:brain_tumr_detection_app/features/slots/presentation/view/widget/slot_bottom_sheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import '../../../../core/data/local_services/cached_models/clinics_model.dart';
import '../view/widget/slot_card.dart';

part 'slots_state.dart';

@injectable
class SlotsCubit extends Cubit<SlotsState> {
  final ClinicsRepository clinicsRepository;

  SlotsCubit({required this.clinicsRepository}) : super(SlotsInitial()) {}
  final GlobalKey<SliverAnimatedListState> listKey =
      GlobalKey<SliverAnimatedListState>();
  List<Clinic> clinics = [];
  List<AvailableSlotsModel> wantToEditSlots = [];
  List<AvailableSlotsModel> slotsToAdd = [];
  List<AvailableSlotsModel> availableSlots = [];
  Clinic? selectedClinic;
  int selectedDayIndex = 0;
  bool isLoadingSlots = false;
  bool hasChanges = false;

  final ScrollController scrollController = ScrollController();

  void markSlotChanged() {
    hasChanges = true;
    emit(SlotsChangedState(hasChanges: hasChanges));
  }

  Future<void> getClinics() async {
    emit(GetClinicsLoading());
    final response = await clinicsRepository.getDoctorClinics();
    response.fold((l) {
      emit(GetClinicsError());
      l.message!.showToast();
    }, (r) {
      clinics = r;
      selectedClinic = clinics.isNotEmpty ? clinics[0] : null;
      HiveCachingHelper.saveClinics(clinics);
    });
    emit(GetClinicsSuccess());
  }

  void setSelectedClinic(Clinic? clinic) {
    selectedClinic = clinic;
    emit(SelectedClinicChanged());
  }

  Future<void> loadCachedClinics() async {
    final cachedClinics = await HiveCachingHelper.getClinics();
    clinics = cachedClinics;

    selectedClinic = clinics.isNotEmpty ? clinics[0] : null;
    emit(GetCachedClinics());
  }

  void setSelectedDayIndex(int index) {
    selectedDayIndex = index;
    emit(SelectedDayIndexChanged());
  }

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 4));
  DateTime selectedDay = DateTime.now();
  AvailableSlotsModel? _lastRemovedSlot;
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
    _lastRemovedSlot = availableSlots[index];
    _lastRemovedIndex = index;

    availableSlots.removeAt(index);
    listKey.currentState?.removeItem(
      index,
      (context, animation) {
        return SizeTransition(
          sizeFactor: animation,
          child: SlotCard(
            slot: _lastRemovedSlot!,
            onRemove: () {},
          ).paddingOnly(top: 8.h, bottom: 8.h),
        );
      },
      duration: const Duration(milliseconds: 300),
    );
    markSlotChanged();
    emit(SlotsListRemoved());
  }

  void addSlot(TimeOfDay slotTime) {
    print("slotTime: ${formatTimeTo24Hour("$slotTime")}");

    final newSlot = AvailableSlotsModel(
      dayOfWeek: selectedDayIndex,
      isAvailable: true,
      startTime: formatTimeTo24Hour("${slotTime.hour}:${slotTime.minute}"),
    );

    final index = availableSlots.length;

    availableSlots.insert(index, newSlot);

    listKey.currentState?.insertItem(index);
    markSlotChanged();

    emit(SlotsListAdded());

    Future.delayed(const Duration(milliseconds: 300), () {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent + 150.h,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    });
  }

  void editSlot(int soltId, TimeOfDay slotTime) {
    print("slotTime: $slotTime");
    availableSlots.forEach((element) {
      if (element.id == soltId) {
        element.startTime =
            formatTimeTo24Hour("${slotTime.hour}:${slotTime.minute}");
      }
    });
    markSlotChanged();
    emit(SlotsListUpdated());
  }

  void undoRemove() {
    if (_lastRemovedSlot != null && _lastRemovedIndex != null) {
      availableSlots.insert(_lastRemovedIndex!, _lastRemovedSlot!);
      listKey.currentState?.insertItem(_lastRemovedIndex!);
      markSlotChanged();
      _lastRemovedSlot = null;
      _lastRemovedIndex = null;

      emit(SlotsUndoRemoved());
    }
  }

  Future<void> getClinicsSlots() async {
    for (int i = availableSlots.length - 1; i >= 0; i--) {
      final removedSlot = availableSlots.removeAt(i);
      listKey.currentState?.removeItem(
        i,
        (context, animation) => SizeTransition(
          sizeFactor: animation,
          child: SlotCard(
            slot: removedSlot,
            onRemove: () {
              removeSlot(i);
            },
          ),
        ),
      );
    }

    isLoadingSlots = true;
    emit(SlotsLoading());

    final response = await clinicsRepository.getAvailabelSlots(
      AvailableSlotsRequestModel(
        clinicId: selectedClinic!.id,
        day: selectedDayIndex,
      ),
    );

    response.fold((l) {
      isLoadingSlots = false;
      emit(SlotsError());
      l.message?.showToast();
    }, (r) async {
      isLoadingSlots = false;

      for (int i = 0; i < r.length; i++) {
        await Future.delayed(
            const Duration(milliseconds: 50)); // slight delay for animation
        availableSlots.insert(i, r[i]);
        listKey.currentState?.insertItem(i);
      }

      emit(SlotsLoaded());
    });
  }

  Future<TimeOfDay?> showTimePicker(BuildContext context,
      {AvailableSlotsModel? slot}) async {
    // print("object");

    return await showModalBottomSheet<TimeOfDay>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) {
        return SlotBottomSheetWidget(
          slot: slot,
        );
      },
    );
  }
}
