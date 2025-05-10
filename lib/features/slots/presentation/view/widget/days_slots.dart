import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/features/view_patients/presentation/view_model/cubit/view_patients_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/colors/app_colors.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';

class DaySelector extends StatelessWidget {
  const DaySelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewPatientsCubit, ViewPatientsState>(
      builder: (context, state) {
        final cubit = context.read<ViewPatientsCubit>();
        return Container(
          height: 45.h,
          decoration: BoxDecoration(
            color: AppColors.buttonsAndNav.withOpacity(0.6),
            borderRadius: BorderRadius.circular(32.r),
          ),
          child: Row(
            children: List.generate(5, (index) {
              final day = cubit.startDate.add(Duration(days: index));
              final isSelected =
                  DateFormat('yyyy-MM-dd').format(cubit.selectedDay) ==
                      DateFormat('yyyy-MM-dd').format(day);
              return Expanded(
                child: GestureDetector(
                  onTap: () => cubit.selectDay(day),
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.buttonsAndNav
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(25.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          DateFormat('EEE').format(day).substring(0, 3),
                          style: isSelected
                              ? AppTextStyles.font10WhiteW600
                              : AppTextStyles.font10BlueW600,
                        ),
                        2.toWidth,
                        Text(
                          DateFormat('d').format(day),
                          style: isSelected
                              ? AppTextStyles.font10WhiteW600
                              : AppTextStyles.font10BlueW600,
                        ),
                      ],
                    ).paddingSymmetric(vertical: 7.h),
                  ).paddingSymmetric(horizontal: 5.w),
                ),
              );
            }),
          ),
        ).paddingSymmetric(horizontal: 8.w);
      },
    );
  }
}
