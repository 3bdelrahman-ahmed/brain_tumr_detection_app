import 'package:brain_tumr_detection_app/core/components/cubits/app_cubit/app_cubit.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_button.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_sliver_search_bar.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_welcome_row.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/register_screen_location_widget.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/features/doctors/presentation/view/widgets/doctor_card_doctors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/strings/app_string.dart';
import '../../../../../core/utils/theme/colors/app_colors.dart';

class DoctorsPage extends StatelessWidget {
  const DoctorsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AppCubit>();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomWelcomeAppBar(),
          SliverPersistentHeader(
              pinned: true,
              delegate: CustomSliverSearchBar(AppStrings.searchForTherapist)),
          BlocBuilder<AppCubit, AppState>(
            builder: (context, state){
              if (state is GetDoctorsClinicsLoading) {
                return SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: AppColors.buttonsAndNav,
                    ),
                  ),
                );
              } else {
                return SliverList(
                    delegate: SliverChildBuilderDelegate(
                        addAutomaticKeepAlives: true, (context, index) {
                  return DoctorCardDoctors(
                    doctor: cubit.doctorsClinicsResponse!.data[index],
                  ).paddingOnly(top: 13.h, left: 20.w, right: 20.w);
                }, childCount: cubit.doctorsClinicsResponse?.data.length));
              }
            },
          ),
          SliverPadding(padding: EdgeInsets.symmetric(vertical: 30.h))
        ],
      ),
    );
  }
}
