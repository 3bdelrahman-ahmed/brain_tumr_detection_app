import 'package:brain_tumr_detection_app/core/services/service_locator/service_locator.dart';
import 'package:brain_tumr_detection_app/features/feed/presentation/view_model/cubit/feed_cubit.dart';
import 'package:brain_tumr_detection_app/features/reports/presentation/viewmodel/reports_cubit.dart';
import 'package:brain_tumr_detection_app/features/scan/view_model/scan_cubit.dart';
import 'package:brain_tumr_detection_app/features/slots/presentation/view_model/slots_cubit.dart';
import 'package:brain_tumr_detection_app/features/view_patients/presentation/view/screens/view_patients_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../features/appointments/presentation/view/screens/appointments_screen.dart';
import '../../../../features/appointments/presentation/view_model/appointment_cubit.dart';
import '../../../../features/doctors/presentation/view/screens/doctors_page.dart';
import '../../../../features/feed/presentation/view/screens/feed_page.dart';
import '../../../../features/profle/presentation/view/screens/profile_page.dart';
import '../../../../features/reports/presentation/view/screens/reports_screen.dart';
import '../../../../features/scan/view/screens/scan_page.dart';
import '../../../../features/slots/presentation/view/screens/slots_screen.dart';
import '../../../../features/view_patients/presentation/view_model/cubit/view_patients_cubit.dart';

part 'navigation_state.dart';

@injectable
class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationInitial());

  int currentIndex = 0;

  final Map<int, ScrollController> scrollControllers = {};

  ScrollController getScrollController(int index) {
    if (!scrollControllers.containsKey(index)) {
      scrollControllers[index] = ScrollController();
    }
    return scrollControllers[index]!;
  }

  final List<Widget> tabs = [];

  void initializeDoctorTabs() {
    tabs.addAll([
      BlocProvider(
        create: (context) => getIt<FeedCubit>(),
        child: FeedPage(
          controller: getScrollController(0),
        ),
      ),
      BlocProvider(
        create: (context) => getIt<SlotsCubit>(),
        child: SlotsScreen(),
      ),
      BlocProvider(
        create: (context) => getIt<ReportsCubit>(),
        child: ReportsScreen(),
      ),
      BlocProvider(
        create: (context) => getIt<ViewPatientsCubit>(),
        child: ViewPatientsScreen(),
      ),
      ProfilePage(),
    ]);
  }

  void initializePatientTabs() {
    tabs.addAll([
      BlocProvider(
        create: (context) => getIt<FeedCubit>(),
        child: FeedPage(
          controller: getScrollController(0),
        ),
      ),
      BlocProvider(
        create: (context) => getIt<AppointmentCubit>(),
        child: AppointmentsScreen(),
      ),
      BlocProvider(
        create: (context) => getIt<ScanCubit>(),
        child: ScanPage(),
      ),
      DoctorsPage(),
      ProfilePage(),
    ]);
  }

  void changePage(int index) {
    if (currentIndex != index) {
      currentIndex = index;
      emit(ChangeTabNavigation());
    }
  }
}
