import 'package:brain_tumr_detection_app/core/components/widgets/posts_row.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/colors/app_colors.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/features/slots/presentation/view_model/slots_cubit.dart';

class DaySelector extends StatelessWidget {
  const DaySelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SlotsCubit, SlotsState>(
      builder: (context, state) {
        final cubit = context.read<SlotsCubit>();
        return Container(
          height: 50.h,
          decoration: BoxDecoration(
            color: AppColors.buttonsAndNav.withOpacity(0.6),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Row(
            children: List.generate(5, (index) {
              final day = cubit.startDate.add(Duration(days: index));
              final isSelected = cubit.selectedDay != null &&
                  DateFormat('yyyy-MM-dd').format(cubit.selectedDay!) ==
                      DateFormat('yyyy-MM-dd').format(day);
              return Expanded(
                child: GestureDetector(
                  onTap: () => cubit.selectDay(day),
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.buttonsAndNav
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(20.r),
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
                        5.toWidth,
                        Text(
                          DateFormat('d').format(day),
                          style: isSelected
                              ? AppTextStyles.font10WhiteW600
                              : AppTextStyles.font10BlueW600,
                        ),
                      ],
                    ).paddingSymmetric(vertical: 10.h),
                  ),
                ),
              );
            }),
          ),
        ).paddingSymmetric(horizontal: 8.w);
      },
    );
  }
}
