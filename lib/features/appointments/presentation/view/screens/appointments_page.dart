import 'package:brain_tumr_detection_app/core/components/widgets/custom_welcome_row.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/features/appointments/presentation/view/widgets/doctor_card_shimmer.dart';
import 'package:brain_tumr_detection_app/features/appointments/presentation/viewmodel/appointment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/doctor_card.dart';

class AppointmentsPage extends StatefulWidget {
  const AppointmentsPage({Key? key}) : super(key: key);

  @override
  State<AppointmentsPage> createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {
  late ScrollController _scrollController;
  late AppointmentCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<AppointmentCubit>();
    _scrollController = ScrollController()
      ..addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      cubit.loadMoreAppointments();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        CustomWelcomeAppBar(),
        BlocBuilder<AppointmentCubit, AppointmentState>(
          builder: (context, state) {
            if (state is AppointmentLoading && cubit.appointments.isEmpty) {
              return SliverFillRemaining(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      DoctorCardAppointmentShimmer(),
                      12.toHeight,
                      DoctorCardAppointmentShimmer(),
                    ],
                  ),
                ),
              );
            } else if (cubit.appointments.isEmpty) {
              return SliverFillRemaining(
                child: Center(child: Text("There are no appointments")),
              );
            }

            return SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  // Show loader at bottom
                  if (index == cubit.appointments.length) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                  final appointment = cubit.appointments[index];
                  return Padding(
                    padding: EdgeInsets.only(top: 16.h, left: 20.w, right: 20.w),
                    child: DoctorCardAppointment(appointmentData: appointment),
                  );
                },
                childCount: cubit.hasMore
                    ? cubit.appointments.length + 1
                    : cubit.appointments.length,
              ),
            );
          },
        ),
        SliverPadding(padding: EdgeInsets.only(bottom: 80.h)),
      ],
    );
  }
}
