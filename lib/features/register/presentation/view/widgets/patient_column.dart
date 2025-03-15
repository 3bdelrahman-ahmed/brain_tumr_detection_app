import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/features/register/presentation/viewmodel/rigester_screen_cubit.dart';
import 'package:brain_tumr_detection_app/foundations/validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/components/widgets/custom_text_field.dart';
import '../../../../../core/utils/string/app_string.dart';

class PatientFormFields extends StatelessWidget {
  const PatientFormFields();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RigesterScreenCubit>();

    return Form(
      key: cubit.formKey, // Attach Form Key from Cubit
      child: Column(
        children: [
          CustomTextField(
            label: AppStrings.fullName,
            hintText: AppStrings.enterYourFullName,
            controller: cubit.fullNameController,
            validator: (value)=> checkFieldValidation(val: value, fieldName: AppStrings.fullName, fieldType: ValidationType.name),
          ),
          16.toHeight,
          CustomTextField(
            label: AppStrings.userName,
            hintText: AppStrings.enterYourUserName,
            controller: cubit.userNameController,
            validator: (value) => checkFieldValidation(val: value, fieldName: AppStrings.userName, fieldType: ValidationType.name),
          ),
          16.toHeight,
          CustomTextField(
            label: AppStrings.email,
            hintText: AppStrings.enterYourEmail,
            controller: cubit.emailController,
            validator: (value) => checkFieldValidation(val: value, fieldName: AppStrings.email, fieldType: ValidationType.email),
          ),
          16.toHeight,
          CustomTextField(
            label: AppStrings.password,
            hintText: AppStrings.enterYourPassword,
            controller: cubit.passwordController,
            validator: (vlaue)=> checkFieldValidation(val: vlaue, fieldName: AppStrings.password, fieldType: ValidationType.password),
            obscureText: true,
          ),
        ],
      ),
    );
  }

  // Widget _buildInputField({
  //   required String label,
  //   required String hintText,
  //   TextEditingController? controller,
  //   String? Function(String?)? validator,
  //   bool obscureText = false,
  // }) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text(label, style: AppTextStyles.font15GreenW500),
  //       5.toHeight,
  //       CustomTextField(
  //         hintText: hintText,
  //         controller: controller,
  //         validator: validator,
  //         obscureText: obscureText,
  //       ),
  //     ],
  //   );
  // }
}
