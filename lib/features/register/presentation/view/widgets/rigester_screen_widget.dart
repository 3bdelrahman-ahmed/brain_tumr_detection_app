import 'package:brain_tumr_detection_app/core/components/widgets/custom_button.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/responsive_helper.dart';
import 'package:brain_tumr_detection_app/core/utils/string/app_string.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import 'package:brain_tumr_detection_app/features/register/presentation/view/widgets/doctor_form.dart';
import 'package:brain_tumr_detection_app/features/register/presentation/view/widgets/patient_column.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../../../../core/utils/theme/colors/app_colors.dart';
import '../../view_model/rigester_screen_cubit.dart';
import '../../view_model/rigester_screen_state.dart';

class RigesterScreenWidget extends StatelessWidget {
  RigesterScreenWidget({Key? key}) : super(key: key);

  int prevoiusIndex = 0;

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<RigesterScreenCubit>();
    return SafeArea(
      child: BlocBuilder<RigesterScreenCubit, RigesterScreenState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(AppStrings.createYourAcc,
                    style: AppTextStyles.font20GreenW500),
                6.toHeight,
                Text(
                  AppStrings.welcomeAbroadSentence,
                  style: AppTextStyles.font15LightGreenW500,
                  textAlign: TextAlign.center,
                ),
                16.toHeight,
                _buildToggleSwitch(cubit),
                16.toHeight,
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),
                  transitionBuilder: (widget, animation) {
                    final isMovingRight = cubit.currentIndex! > prevoiusIndex;
                    final beginOffset =
                        isMovingRight ? Offset(1.0, 0.0) : Offset(-1.0, 0.0);

                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: beginOffset,
                        end: Offset(0.0, 0.0),
                      ).animate(animation),
                      child: widget,
                    );
                  },
                  child: cubit.currentIndex == 0
                      ? PatientFormFields(key: ValueKey(0))
                      : DoctorForm(
                          Key: ValueKey(1)), // Fix: Add key parameter here
                ),
                24.toHeight,
                CustomButton(
                        isLoading: state is RigesterScreenLoadingState,
                        text: AppStrings.next,
                        onTap: () => {cubit.register()}).animate().flipV(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                    ),
                16.toHeight,
              ],
            ),
          );
        },
      ).paddingOnly(top: 24.h, left: 24.w, right: 24.w),
    );
  }
}

Widget _buildToggleSwitch(cubit) {
  return LayoutBuilder(
    builder: (context, constraints) {
      double switchWidth = constraints.maxWidth / 2; // Divide width for 3 tabs

      return Stack(
        children: [
          Container(
            height: 45.h,
            decoration: BoxDecoration(
              color: AppColors.typographyLowOpacity, // Main background color
              borderRadius: BorderRadius.circular(30),
            ),
          ),

          /// Highlighted selected tab
          AnimatedPositionedDirectional(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            top: ResponsiveHelper.isTablet(context) ? 5 : 3.5,
            start: (switchWidth * cubit.currentIndex).clamp(0.0,
                constraints.maxWidth - switchWidth), // Moves with selection
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: ResponsiveHelper.isTablet(context) ? 14 : 12,
                  vertical: ResponsiveHelper.isTablet(context) ? 30 : 20),
              width: switchWidth,
              // height: 45.h,
              decoration: BoxDecoration(
                color: AppColors.typography, // Highlighted tab color
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),

          /// ToggleSwitch
          ToggleSwitch(
            minWidth: switchWidth,
            minHeight: 40.h,
            fontSize: 14.sp,
            cornerRadius: 30.0.w,
            activeBgColors: List.generate(
                2, (_) => [Colors.transparent]), // Transparent active bg
            activeFgColor: AppColors.background,
            inactiveBgColor:
                Colors.transparent, // Keep unselected tabs transparent
            inactiveFgColor: AppColors.typography,
            initialLabelIndex: cubit.currentIndex,
            doubleTapDisable: true,
            totalSwitches: 2,
            labels: [
              AppStrings.asAPatient,
              AppStrings.asADoctor,
            ],
            dividerColor: Colors.transparent,
            radiusStyle: true,
            onToggle: (index) {
              if (index != null && cubit.currentIndex != index) {
                cubit.changeForm(index);
              }
            },
          ),
        ],
      );
    },
  );
}
