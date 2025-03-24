import 'package:brain_tumr_detection_app/core/components/widgets/custom_welcome_row.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:flutter/material.dart';

import '../widgets/doctor_card.dart';

class AppointmentsPage extends StatelessWidget {

  AppointmentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: true,
      slivers: [
        CustomWelcomeAppBar(),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 5,
            (context, index) {
              return Padding(
                padding: EdgeInsets.only(top: 16.h, left: 20.w, right: 20.w),
                child: DoctorCardAppointment(),
              );
            },
          ),
        ),
        SliverPadding(padding: EdgeInsets.only(bottom: 80.h)),
      ],
    );
  }
}
