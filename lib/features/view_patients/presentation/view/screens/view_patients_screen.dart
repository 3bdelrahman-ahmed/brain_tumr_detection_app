import 'package:brain_tumr_detection_app/core/components/widgets/custom_app_shimmer.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_empty_widget.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_welcome_row.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/features/view_patients/presentation/view/widgets/view_patient_row.dart';
import 'package:brain_tumr_detection_app/features/view_patients/presentation/view_model/cubit/view_patients_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/components/widgets/custom_drop_down_menu.dart';
import '../../../../../generated/l10n.dart';
import '../../../../slots/presentation/view/widget/date_range_selector.dart';
import '../../../../slots/presentation/view/widget/days_slots.dart';

class ViewPatientsScreen extends StatefulWidget {
  const ViewPatientsScreen({Key? key}) : super(key: key);

  @override
  State<ViewPatientsScreen> createState() => _ViewPatientsScreenState();
}

class _ViewPatientsScreenState extends State<ViewPatientsScreen> {
  @override
  void initState() {
    featchData();
    super.initState();
  }

  Future<void> featchData() async {
    final cubit = context.read<ViewPatientsCubit>();
    await cubit.getClinics();
    if (cubit.clinics.isNotEmpty) {
      await cubit.getPatients(
        cubit.selectedClinic!.id.toString(),
        DateTime.now(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ViewPatientsCubit>();
    return Scaffold(
      body: BlocBuilder<ViewPatientsCubit, ViewPatientsState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              CustomWelcomeAppBar(),
              SliverToBoxAdapter(child: DateRangeSelector()),
              SliverPadding(padding: EdgeInsets.symmetric(vertical: 5.h)),
              SliverToBoxAdapter(child: DaySelector()),
              SliverPadding(padding: EdgeInsets.symmetric(vertical: 7.h)),
              SliverToBoxAdapter(
                child: CustomDropDownMenu(
                  items: cubit.clinics.map((e) {
                    return e.address;
                  }).toList(),
                  hintText: S.of(context).selectClinic,
                  selectedValue: cubit.selectedClinic?.address ??
                      S.of(context).selectClinic,
                  onItemSelected: (v) {
                    final selectedClinic = cubit.clinics.firstWhere(
                      (clinic) => clinic.address == v,
                    );
                    cubit.setSelectedClinic(selectedClinic);
                    cubit.getPatients(
                      selectedClinic.id.toString(),
                      DateTime.now(),
                    );
                  },
                ).paddingSymmetric(horizontal: 20.w, vertical: 10.h),
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                childCount:
                    cubit.patients.isEmpty && state is ViewPatientsLoading
                        ? 2
                        : cubit.patients.length,
                (context, index) {
                  return cubit.patients.isEmpty && state is ViewPatientsLoading
                      ? CustomAppShimmer(
                          height: 80.h,
                          width: double.infinity,
                          borderRaduis: 8.r,
                        ).paddingSymmetric(vertical: 10.h, horizontal: 10.w)
                      : ViewPatientRow(
                              viewPatientResponseModel: cubit.patients[index])
                          .paddingSymmetric(vertical: 16.h);
                },
              )),
              if (cubit.patients.isEmpty && state is! ViewPatientsLoading)
                SliverFillRemaining(child: CustomEmptyWidget.appointments()),
            ],
          );
        },
      ),
    );
  }
}
