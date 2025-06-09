import 'package:brain_tumr_detection_app/core/components/widgets/custom_app_shimmer.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_empty_widget.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_welcome_row.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_model/appointment_cubit.dart';
import '../widgets/doctor_card.dart';

class AppointmentsScreen extends StatefulWidget {
  AppointmentsScreen({Key? key}) : super(key: key);

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  @override
  void initState() {
    context.read<AppointmentCubit>().getPatientAppointments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AppointmentCubit>();
    return CustomScrollView(
      shrinkWrap: true,
      slivers: [
        CustomWelcomeAppBar(),
        BlocBuilder<AppointmentCubit, AppointmentState>(
          builder: (context, state) {
            if (cubit.appointmentsResponseModel != null) {
              if (cubit.appointmentsResponseModel!.appointments!.isNotEmpty) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount:
                        cubit.appointmentsResponseModel!.appointments!.length,
                    (context, index) {
                      return Padding(
                        padding:
                            EdgeInsets.only(top: 16.h, left: 20.w, right: 20.w),
                        child: DoctorCardAppointment(
                          appointment: cubit
                              .appointmentsResponseModel!.appointments![index],
                        ).animate().fadeIn(
                              duration: const Duration(milliseconds: 300),
                            ),
                      );
                    },
                  ),
                );
              } else {
                // make it sliver list with empty widget
                return SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomEmptyWidget.appointments(),
                    ],
                  ),
                );
              }
            } else if (state is AppointmentLoading &&
                cubit.appointmentsResponseModel == null) {
              return SliverList(
                  delegate: SliverChildBuilderDelegate(
                childCount: 5,
                (context, index) {
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                    child: CustomAppShimmer(
                      height: 150.h,
                    ),
                  );
                },
              ));
            } else {
              return SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomEmptyWidget.appointments(),
                  ],
                ),
              );
            }
          },
        ),
        SliverPadding(padding: EdgeInsets.only(bottom: 100.h)),
      ],
    );
  }
}
