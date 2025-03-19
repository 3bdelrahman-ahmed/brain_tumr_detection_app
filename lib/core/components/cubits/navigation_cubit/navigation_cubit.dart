import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../features/appointments/view/screens/appointments_page.dart';
import '../../../../features/doctors/view/screens/doctors_page.dart';
import '../../../../features/feed/view/screens/feed_page.dart';
import '../../../../features/profle/view/screens/profile_page.dart';
import '../../../../features/scan/view/screens/scan_page.dart';

part 'navigation_state.dart';

@singleton
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
