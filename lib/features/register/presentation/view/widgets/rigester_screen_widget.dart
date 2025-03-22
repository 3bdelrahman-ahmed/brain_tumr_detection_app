import 'package:brain_tumr_detection_app/core/components/widgets/custom_button.dart';
import 'package:brain_tumr_detection_app/core/config/app_routing.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/navigation_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/string/app_string.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import 'package:brain_tumr_detection_app/features/register/presentation/view/widgets/doctor_form.dart';
import 'package:brain_tumr_detection_app/features/register/presentation/view/widgets/patient_column.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../../../core/utils/theme/colors/app_colors.dart';
import '../../viewmodel/rigester_screen_cubit.dart';

class RigesterScreenWidget extends StatelessWidget {
  const RigesterScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<RigesterScreenCubit>();
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(AppStrings.createYourAcc, style: AppTextStyles.font20GreenW500),
          6.toHeight,
          Text(
            AppStrings.welcomeAbroadSentence,
            style: AppTextStyles.font15LightGreenW500,
            textAlign: TextAlign.center,
          ),
          16.toHeight,
          _buildToggleSwitch(cubit),
          16.toHeight,
          cubit.currentIndex == 0 ? PatientFormFields() : DoctorForm(),
          24.toHeight,
          BlocBuilder<RigesterScreenCubit, RigesterScreenState>(
            builder: (context, state) {
              return CustomButton(
                  isLoading: state is RigesterScreenLoadingState,
                  text: AppStrings.next,
                  onTap: () =>
                  {
                    cubit.register()
                  });
            },
          ),
        ],
      ).paddingOnly(top: 32.h),
    );
  }
}

Widget _buildToggleSwitch(cubit) {
  return ToggleSwitch(
    minWidth: 180.0,
    cornerRadius: 30.0,
    activeBgColors: [
      [AppColors.typography],
      [AppColors.typography]
    ],
    activeFgColor: AppColors.background,
    inactiveBgColor: AppColors.typographyLowOpacity,
    inactiveFgColor: AppColors.typography,
    initialLabelIndex: cubit.currentIndex,
    totalSwitches: 2,
    labels: [AppStrings.asAPatient, AppStrings.asADoctor],
    radiusStyle: true,
    animate: true,
    animationDuration: 200,
    onToggle: (index) {
      cubit.changeForm(index);
    },
  );
}
