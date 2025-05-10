import 'package:brain_tumr_detection_app/core/components/widgets/custom_welcome_row.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/features/view_patients/presentation/view/widgets/view_patient_row.dart';
import 'package:brain_tumr_detection_app/features/view_patients/presentation/view_model/cubit/view_patients_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    context.read<ViewPatientsCubit>().getPatients('1',DateTime.now());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final cubit=context.read<ViewPatientsCubit>();
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
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                  childCount:cubit.patients?.length??0 ,
                  (context, index) {
                    return ViewPatientRow(viewPatientResponseModel: cubit.patients![index]);
                  },
                ))
              ],
            );
        },
      ),
    );
  }
}
