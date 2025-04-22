import 'package:brain_tumr_detection_app/core/components/widgets/custom_auth_container.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/features/register/presentation/view/widgets/profile_image_picker.dart';
import 'package:brain_tumr_detection_app/features/register/presentation/view/widgets/select_gender.dart';
import 'package:brain_tumr_detection_app/features/register/presentation/view_model/rigester_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import '../../../../../core/components/widgets/custom_text_field.dart';
import '../../../../../core/utils/assets/assets_svg.dart';
import '../../../../../core/utils/extenstions/validators.dart';
import '../../../../../core/utils/strings/app_string.dart';
import '../../../../../core/utils/theme/colors/app_colors.dart';
import '../../../../../core/utils/theme/text_styles/app_text_styles.dart';
import '../../../../../foundations/validations.dart';

class DoctorFormWidget extends StatelessWidget {
  const DoctorFormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RigesterScreenCubit>();

    return CustomAuthContainerWidget(
      child: Form(
        key: cubit.formKeys[1],
        child: Column(
          children: [
            ProfileImagePicker(cubit: cubit),
            16.toHeight,
            CustomTextField(
              focusNode: cubit.fullNameFocus,
              onSubmit: (p0) {
                FocusScope.of(context).requestFocus(cubit.userNameFocus);
              },
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
              focusNode: cubit.userNameFocus,
              onSubmit: (p0) {
                FocusScope.of(context).requestFocus(cubit.emailFocus);
              },
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
                focusNode: cubit.emailFocus,
                onSubmit: (p0) {
                  FocusScope.of(context).requestFocus(cubit.imageFocus);
                },
                label: AppStrings.email,
                hintText: AppStrings.enterYourEmail,
                controller: cubit.emailController,
                validator: Validators.emailValidate),
            16.toHeight,
            CustomTextField(
              subLabel: AppStrings.uploadYourNationalMedical,
              controller: cubit.licenseFrontController,
              hintText: AppStrings.tapToAttachFile,
              label: AppStrings.medicalCertificateFrontImage,
              readOnly: true,
              suffixIcon: AssetsSvg.uploadDoc,
              validator: (v) => checkFieldValidation(
                  val: cubit.licenseFrontController.text,
                  fieldName: AppStrings.medicalCertificateFrontImage,
                  fieldType: ValidationType.text),
              onTap: () {
                cubit.pickDocument().then((v) {
                  if (v != null) {
                    cubit.setDoctorLicenseFrontFile(v);
                  }
                });
              },
            ),
            16.toHeight,
            CustomTextField(
              controller: cubit.licenseBackController,
              hintText: AppStrings.tapToAttachFile,
              label: AppStrings.medicalCertificateBackImage,
              readOnly: true,
              onSubmit: (p0) {
                FocusScope.of(context).requestFocus(cubit.locationFocus);
              },
              suffixIcon: AssetsSvg.uploadDoc,
              validator: (v) => checkFieldValidation(
                  val: cubit.licenseBackController.text,
                  fieldName: AppStrings.medicalCertificateBackImage,
                  fieldType: ValidationType.text),
              onTap: () {
                cubit.pickDocument().then((v) {
                  if (v != null) {
                    cubit.setDoctorLicenseBackFile(v);
                  }
                });
              },
            ),
            16.toHeight,

            // Date Picker
            CustomTextField(
              focusNode: cubit.birthDateFocus,
              onSubmit: (p0) {
                FocusScope.of(context).requestFocus(cubit.genderFocus);
              },
              hintText: cubit.pickedDate != null
                  ? cubit.pickedDate.toString().substring(0, 10)
                  : AppStrings.selectDateOfBirth,
              readOnly: true,
              hintTextStyle: cubit.pickedDate != null
                  ? AppTextStyles.font20GreenW500
                  : AppTextStyles.font15LightGreenW500,
              label: AppStrings.birthDate,
              suffixIcon: AssetsSvg.datePicker,
              validator: (_) =>
                  cubit.pickedDate != null ? null : AppStrings.dateError,
              onTap: () => _selectDate(context, cubit),
            ),
            16.toHeight,
            SelectGender(),
            16.toHeight,
            CustomTextField(
              focusNode: cubit.passwordFocus,
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
      ),
    );
  }

  Future<void> _selectDate(
      BuildContext context, RigesterScreenCubit cubit) async {
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
