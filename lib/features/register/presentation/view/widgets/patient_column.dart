import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/features/register/presentation/viewmodel/rigester_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/components/widgets/custom_text_field.dart';
import '../../../../../core/utils/extenstions/validators.dart';
import '../../../../../core/utils/string/app_string.dart';
import '../../../../../core/utils/theme/text_styles/app_text_styles.dart';

class PatientFormFields extends StatelessWidget {
  const PatientFormFields();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RigesterScreenCubit>();

    return Form(
      key: cubit.formKey, // Attach Form Key from Cubit
      child: Column(
        children: [
          _buildInputField(
            label: AppString.fullName,
            hintText: AppString.enterYourFullName,
            controller: cubit.fullNameController,
            validator: Validators.nameValidate,
          ),
          _buildInputField(
            label: AppString.userName,
            hintText: AppString.enterYourUserName,
            controller: cubit.userNameController,
            validator: Validators.nameValidate,
          ),
          _buildInputField(
            label: AppString.email,
            hintText: AppString.enterYourEmail,
            controller: cubit.emailController,
            validator: Validators.emailValidate,
          ),
          _buildInputField(
            label: AppString.password,
            hintText: AppString.enterYourPassword,
            controller: cubit.passwordController,
            validator: Validators.passwordValidate,
            obscureText: true,
          ),
        ],
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required String hintText,
    TextEditingController? controller,
    String? Function(String?)? validator,
    bool obscureText = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.font15GreenW500),
        5.toHeight,
        CustomTextField(
          hintText: hintText,
          controller: controller,
          validator: validator,
          obscureText: obscureText,
        ),
        30.toHeight,
      ],
    );
  }
}
