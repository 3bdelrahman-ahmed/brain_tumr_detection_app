import 'package:brain_tumr_detection_app/core/utils/assets/assets_svg.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/features/register/presentation/view/widgets/profile_image_picker.dart';
import 'package:brain_tumr_detection_app/features/register/presentation/viewmodel/rigester_screen_cubit.dart';
import 'package:brain_tumr_detection_app/foundations/validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/components/widgets/custom_text_field.dart';
import '../../../../../core/config/app_routing.dart';
import '../../../../../core/utils/extenstions/navigation_extenstions.dart';
import '../../../../../core/utils/string/app_string.dart';
import '../../../../../core/utils/theme/text_styles/app_text_styles.dart';
import '../../../../../core/utils/theme/colors/app_colors.dart';

class PatientFormFields extends StatelessWidget {
  const PatientFormFields();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RigesterScreenCubit>();
    return Form(
      key: cubit.formKey, // Attach Form Key from Cubit
      child: Column(
        children: [
          ProfileImagePicker(cubit: cubit),
          16.toHeight,
          CustomTextField(
            label: AppStrings.fullName,
            hintText: AppStrings.enterYourFullName,
            controller: cubit.fullNameController,
            validator: (value) => checkFieldValidation(
                val: value,
                fieldName: AppStrings.fullName,
                fieldType: ValidationType.name),
          ),
          16.toHeight,
          CustomTextField(
            label: AppStrings.userName,
            hintText: AppStrings.enterYourUserName,
            controller: cubit.userNameController,
            validator: (value) => checkFieldValidation(
                val: value,
                fieldName: AppStrings.userName,
                fieldType: ValidationType.name),
          ),
          16.toHeight,
          CustomTextField(
            label: AppStrings.email,
            hintText: AppStrings.enterYourEmail,
            controller: cubit.emailController,
            validator: (value) => checkFieldValidation(
                val: value,
                fieldName: AppStrings.email,
                fieldType: ValidationType.email),
          ),
          16.toHeight,
          CustomTextField(
            hintText: cubit.pickedDate != null ? cubit.pickedDate.toString().substring(0,10) : AppStrings.selectDateOfBirth,
            readOnly: true,
            label: AppStrings.setLocation,
            suffixIcon: AssetsSvg.location,
            onTap: () {
              NavigationExtensions.navigatorKey.currentState
                  ?.pushNamed(AppRoutes.locationScreen);
            }
          ),
          16.toHeight,
          // Date Picker
          CustomTextField(
            hintText: cubit.pickedDate != null ? cubit.pickedDate.toString().substring(0,10) : AppStrings.selectDateOfBirth,
            readOnly: true,
            label: AppStrings.birthDate,
            suffixIcon: AssetsSvg.datePicker,
            onTap: () => _selectDate(context,cubit),
          ),
          16.toHeight,
          Column(
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
                    borderSide: BorderSide(color: AppColors.typographyLowOpacity),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.r),
                    borderSide: BorderSide(color: AppColors.typographyLowOpacity),
                  ),
                ),
                items: ['Male', 'Female'].map((String gender){
                  return DropdownMenuItem<String>(
                    value: gender,
                    child: Text(gender,style: AppTextStyles.font20GreenW500,),
                  );
                }).toList(),
                onChanged: (value){
                  if (value != null){
                    cubit.setSelectedGender(value);
                  }
                },
                validator: (value) =>
                value == null ? 'Please select a gender' : null,
              ),
            ],
          ),
          16.toHeight,
          CustomTextField(
            label: AppStrings.password,
            hintText: AppStrings.enterYourPassword,
            controller: cubit.passwordController,
            validator: (value) => checkFieldValidation(
                val: value,
                fieldName: AppStrings.password,
                fieldType: ValidationType.password),
            obscureText: true,
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context, RigesterScreenCubit cubit) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.typography,
              onPrimary: AppColors.background,
              onSurface: AppColors.navSecondary,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      cubit.setSelectedDate(picked);
    }
  }
}
