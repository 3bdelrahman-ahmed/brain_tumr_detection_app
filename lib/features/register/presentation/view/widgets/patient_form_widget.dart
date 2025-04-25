import 'package:brain_tumr_detection_app/core/components/widgets/custom_auth_container.dart';
import 'package:brain_tumr_detection_app/core/utils/assets/assets_svg.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/validators.dart';
import 'package:brain_tumr_detection_app/features/register/presentation/view/widgets/profile_image_picker.dart';
import 'package:brain_tumr_detection_app/features/register/presentation/view/widgets/select_gender.dart';
import 'package:brain_tumr_detection_app/features/register/presentation/view_model/rigester_screen_cubit.dart';
import 'package:brain_tumr_detection_app/foundations/validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/components/widgets/custom_text_field.dart';
import '../../../../../core/config/app_routing.dart';
import '../../../../../core/utils/strings/app_string.dart';
import '../../../../../core/utils/theme/text_styles/app_text_styles.dart';
import '../../../../../core/utils/theme/colors/app_colors.dart';
import '../../../../../generated/l10n.dart';

class PatientFormFields extends StatelessWidget {
  const PatientFormFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RigesterScreenCubit>();
    return CustomAuthContainerWidget(
      child: Form(
        key: cubit.formKeys[0],
        child: Column(
          children: [
            ProfileImagePicker(cubit: cubit),
            16.toHeight,
            CustomTextField(
              focusNode: cubit.fullNameFocus,
              onSubmit: (p0) {
                FocusScope.of(context)
                    .requestFocus(cubit.userNameFocus);
              },
              label: S.of(context).fullName,
              hintText: S.of(context).enterYourFullName,
              controller: cubit.fullNameController,
              validator: (value) => checkFieldValidation(
                  val: value,
                  fieldName: S.of(context).fullName,
                  fieldType: ValidationType.fullName),
            ),
            16.toHeight,
            CustomTextField(
              focusNode: cubit.userNameFocus,
              onSubmit:  (p0) {
                FocusScope.of(context)
                    .requestFocus(cubit.emailFocus);
              },
              label: S.of(context).userName,
              hintText: S.of(context).enterYourUserName,
              controller: cubit.userNameController,
              validator: (value) => checkFieldValidation(
                  val: value,
                  fieldName: S.of(context).userName,
                  fieldType: ValidationType.name),
            ),
            16.toHeight,
            //Email Picker
            CustomTextField(
              focusNode: cubit.emailFocus,
              onSubmit:  (p0) {
                FocusScope.of(context)
                    .requestFocus(cubit.passwordFocus);
              },
              label: S.of(context).email,
              hintText: S.of(context).enterYourEmail,
              controller: cubit.emailController,
              validator: Validators.emailValidate),
            16.toHeight,
            //Location Picker
            CustomTextField(
                hintText: cubit.streetName != null
                    ? cubit.streetName!
                    : S.of(context).setLocation,
                readOnly: true,
                hintTextStyle: cubit.streetName != null
                    ? AppTextStyles.font20GreenW500
                    : AppTextStyles.font15LightGreenW500,
                label: S.of(context).setLocation,
                suffixIcon: AssetsSvg.location,
                validator: (_) =>
                    cubit.streetName != null ? null : S.of(context).locationError,
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
              hintText: cubit.pickedDate != null
                  ? cubit.pickedDate.toString().substring(0, 10)
                  : S.of(context).selectDateOfBirth,
              readOnly: true,
              hintTextStyle: cubit.pickedDate != null
                  ? AppTextStyles.font20GreenW500
                  : AppTextStyles.font15LightGreenW500,
              label: S.of(context).birthDate,
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
              label: S.of(context).password,
              hintText:S.of(context).enterYourPassword,
              controller: cubit.passwordController,
              validator: (value) => checkFieldValidation(
                  val: value,
                  fieldName: S.of(context).password,
                  fieldType: ValidationType.password),
              obscureText: true,
            ),
          ],
        ),
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
