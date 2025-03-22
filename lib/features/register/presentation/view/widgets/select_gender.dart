import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/features/register/presentation/viewmodel/rigester_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/string/app_string.dart';
import '../../../../../core/utils/theme/colors/app_colors.dart';
import '../../../../../core/utils/theme/text_styles/app_text_styles.dart';

class SelectGender extends StatelessWidget {
  const SelectGender({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   final cubit = context.read<RigesterScreenCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.selectGender,
          style: AppTextStyles.font15GreenW500,
        ),
        4.toHeight,
        DropdownButtonFormField<String>(
          value: cubit.selectedGender,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.r),
              borderSide:
              BorderSide(color: AppColors.typographyLowOpacity),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.r),
              borderSide:
              BorderSide(color: AppColors.typographyLowOpacity),
            ),
          ),
          items: ['Male', 'Female'].map((String gender) {
            return DropdownMenuItem<String>(
              value: gender,
              child: Text(
                gender,
                style: AppTextStyles.font20GreenW500,
              ),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              cubit.setSelectedGender(value);
            }
          },
          validator: (value) =>
          value == null ? 'Please select a gender' : null,
        ),
      ],
    )
    ;
  }
}
