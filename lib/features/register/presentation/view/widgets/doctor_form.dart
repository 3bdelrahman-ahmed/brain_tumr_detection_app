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
import '../../../../../core/config/app_routing.dart';
import '../../../../../core/utils/assets/assets_svg.dart';
import '../../../../../core/utils/extenstions/validators.dart';
import '../../../../../core/utils/strings/app_string.dart';
import '../../../../../core/utils/theme/colors/app_colors.dart';
import '../../../../../core/utils/theme/text_styles/app_text_styles.dart';
import '../../../../../foundations/validations.dart';

class DoctorForm extends StatelessWidget {
  const DoctorForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RigesterScreenCubit>();

    return CustomAuthContainerWidget(
      child: Form(
        key: cubit.doctorFormKey,
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
              controller: cubit.licenseController,
              focusNode: cubit.imageFocus,
              hintText: AppStrings.tapToAttachFile,
              label: AppStrings.medicalCertificate,
              readOnly: true,
              onSubmit: (p0) {
                FocusScope.of(context).requestFocus(cubit.locationFocus);
              },
              suffixIcon: AssetsSvg.uploadDoc,
              validator: (_) =>
                  cubit.documentFile != null ? null : AppStrings.documentError,
              onTap: () => _pickDocument(cubit),
            ),
            16.toHeight,
            CustomTextField(
                focusNode: cubit.locationFocus,
                hintText: cubit.streetName != null
                    ? cubit.streetName!
                    : AppStrings.setLocation,
                readOnly: true,
                hintTextStyle: cubit.streetName != null
                    ? AppTextStyles.font20GreenW500
                    : AppTextStyles.font15LightGreenW500,
                label: AppStrings.setLocation,
                suffixIcon: AssetsSvg.location,
                validator: (_) =>
                    cubit.streetName != null ? null : AppStrings.locationError,
                onTap: () async {
                  final result = await Navigator.pushNamed(
                      context, AppRoutes.locationScreen);
                  if (result != null && result is Map<String, dynamic>) {
                    final position = result["position"];
                    final streetName = result["streetName"];
                    cubit.setUserLocation(position, streetName);
                  }
                }),
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

  Future<void> _pickDocument(RigesterScreenCubit cubit) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'jpg', 'png', 'doc', 'docx'],
      );

      if (result != null) {
        File file = File(result.files.single.path!);
        String fileName = result.files.single.name;
        cubit.setDocumentFile(file, fileName);
      }
    } catch (e) {
      cubit.setDocumentError('Error picking document: $e');
    }
  }
}
