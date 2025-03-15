import 'package:brain_tumr_detection_app/core/components/widgets/custom_button.dart';
import 'package:brain_tumr_detection_app/core/config/app_routing.dart';
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
    final cubit = context.read<RigesterScreenCubit>();
    return SingleChildScrollView(
      child: Column(
        children: [
          Center(
            child: Text(AppString.createYourAcc,
                style: AppTextStyles.font20GreenW500),
          ),
          5.toHeight,
          Center(
            child: Text(
              AppString.welcomeAbroadSentence,
              style: AppTextStyles.font15LightGreenW500,
              textAlign: TextAlign.center,
            ),
          ),
          25.toHeight,
          _buildToggleSwitch(cubit),
          15.toHeight,
          cubit.currentIndex == 0
              ? PatientFormFields().paddingSymmetric(horizontal: 15.w)
              : DoctorForm().paddingSymmetric(horizontal: 15.w),
          20.toHeight,
          CustomButton(
              text: AppString.next,
              onTap: () => {
                    Navigator.pushNamed(
                        context, AppRoutes.loginScreen)
                  }),
        ],
      ).paddingOnly(top: 50.h),
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
    labels: [AppString.asAPatient, AppString.asADoctor],
    radiusStyle: true,
    animate: true,
    animationDuration: 200,
    onToggle: (index) {
      cubit.changeForm(index);
    },
  );
}
