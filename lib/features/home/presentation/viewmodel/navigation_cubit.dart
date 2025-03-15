import 'package:bloc/bloc.dart';
import 'package:brain_tumr_detection_app/features/home/presentation/view/tabs/appointments/view/screens/appointments_page.dart';
import 'package:brain_tumr_detection_app/features/home/presentation/view/tabs/doctors/view/screens/doctors_page.dart';
import 'package:brain_tumr_detection_app/features/home/presentation/view/tabs/feed/view/screens/feed_page.dart';
import 'package:brain_tumr_detection_app/features/home/presentation/view/tabs/profle/view/screens/profile_page.dart';
import 'package:brain_tumr_detection_app/features/home/presentation/view/tabs/scan/view/screens/scan_page.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'navigation_state.dart';

@injectable
class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationInitial());

   int currentIndex = 0;
  final List<Widget> tabs =[
    FeedPage(),
    AppointmentsPage(),
    ScanPage(),
    DoctorsPage(),
    ProfilePage()
  ];

  void changePage(int index){
    if(currentIndex != index)
      {
        currentIndex = index;
        emit(ChangeTabNavigation());
      }
  }
}
