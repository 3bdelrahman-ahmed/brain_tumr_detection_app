import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/string/app_string.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/colors/app_colors.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_model/rigester_screen_cubit.dart';

class GenderContainerWidget extends StatelessWidget {
  bool isSelected;
  final String gender;
  GenderContainerWidget(
      {super.key, required this.isSelected, required this.gender});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<RigesterScreenCubit>();
    return GestureDetector(
      onTap: () {
        if (gender == AppStrings.male) {
          cubit.selectMaleGenders();
        } else {
          cubit.selectFemaleGenders();
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 24.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
                color: isSelected
                    ? AppColors.typography
                    : AppColors.typographyLowOpacity,
                width: isSelected ? 1.5.w : 0.75.w)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              gender,
              style: AppTextStyles.font15GreenW500.copyWith(
                  color:
                      AppColors.typography.withOpacity(isSelected ? 1 : 0.5)),
            )
          ],
        ),
      ),
    );
  }
}
