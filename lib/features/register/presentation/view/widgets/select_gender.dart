import 'package:brain_tumr_detection_app/core/components/widgets/custom_text_field.dart';
import 'package:brain_tumr_detection_app/features/register/presentation/view/widgets/select_gender_bottom_sheet.dart';
import 'package:brain_tumr_detection_app/features/register/presentation/view_model/rigester_screen_cubit.dart';
import 'package:brain_tumr_detection_app/foundations/validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/strings/app_string.dart';
import '../../../../../generated/l10n.dart';

class SelectGender extends StatelessWidget {
  const SelectGender({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RigesterScreenCubit>();
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            showDragHandle: true,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            context: context,
            builder: (context) {
              return BlocProvider.value(
                value: cubit,
                child: SelectGenderBottomSheet(),
              );
            });
      },
      child: AbsorbPointer(
        child: CustomTextField(
          readOnly: true,
          focusNode: cubit.genderFocus,
          onSubmit: (p0) {
            FocusScope.of(context).requestFocus(cubit.passwordFocus);
          },
          controller: cubit.selectedGender,
          validator: (value) => checkFieldValidation(
              val: cubit.selectedGender.text,
              fieldName: S.of(context).gender,
              fieldType: ValidationType.text),
          label: S.of(context).selectGender,
          hintText: S.of(context).tapToSelectYourGender,
        ),
      ),
    );
    //  Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     Text(
    //       S.of(context).selectGender,
    //       style: AppTextStyles.font15GreenW500,
    //     ),
    //     4.toHeight,
    //     DropdownButtonFormField<String>(
    //       value: cubit.selectedGender,
    //       decoration: InputDecoration(
    //         focusedBorder: OutlineInputBorder(
    //           borderRadius: BorderRadius.circular(30.r),
    //           borderSide:
    //           BorderSide(color: AppColors.typographyLowOpacity),
    //         ),
    //         enabledBorder: OutlineInputBorder(
    //           borderRadius: BorderRadius.circular(30.r),
    //           borderSide:
    //           BorderSide(color: AppColors.typographyLowOpacity),
    //         ),
    //       ),
    //       items: ['Male', 'Female'].map((String gender) {
    //         return DropdownMenuItem<String>(
    //           value: gender,
    //           child: Text(
    //             gender,
    //             style: AppTextStyles.font20GreenW500,
    //           ),
    //         );
    //       }).toList(),
    //       onChanged: (value) {
    //         if (value != null) {
    //           cubit.setSelectedGender(value);
    //         }
    //       },
    //       validator: (value) =>
    //       value == null ? 'Please select a gender' : null,
    //     ),
    //   ],
    // )
    // ;
  }
}
