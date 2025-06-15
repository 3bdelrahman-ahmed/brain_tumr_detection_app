import 'package:brain_tumr_detection_app/core/components/widgets/custom_button.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_image_view.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_profile_image.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_text_field.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/colors/app_colors.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import 'package:brain_tumr_detection_app/features/edit_profile/presentation/view_model/cubit/edit_profile_cubit.dart';
import 'package:brain_tumr_detection_app/foundations/app_constants.dart';
import 'package:brain_tumr_detection_app/foundations/validations.dart';
import 'package:brain_tumr_detection_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/components/widgets/custom_upload_image_icon.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<EditProfileCubit>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          S.of(context).accountSetting,
          style: AppTextStyles.font20BlueW700.copyWith(color: AppColors.black),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        child: BlocBuilder<EditProfileCubit, EditProfileState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => cubit.pickProfileImage(),
                  child: AppConstants.user!.profilePicture == null &&
                          cubit.profileImage == null
                      ? CustomUploadImageIcon()
                          .animate()
                          .flipH(duration: 500.ms)
                      : cubit.profileImage != null
                          ? CustomImageView(
                              file: cubit.profileImage,
                              width: 100.w,
                              height: 100.w,
                              radius: BorderRadius.circular(100.w),
                            ).animate().flipH(duration: 500.ms)
                          : CustomProfileImage(
                              imageUrl: AppConstants.user!.profilePicture,
                              size: 100.w,
                            ).animate().flipH(duration: 500.ms),
                ),
                24.toHeight,
                CustomTextField(
                    label: S.of(context).fullName,
                    validator: (value) => checkFieldValidation(
                        val: cubit.nameController.text,
                        fieldName: S.of(context).fullName,
                        fieldType: ValidationType.text),
                    controller: cubit.nameController,
                    hintText: S.of(context).fullName),
                16.toHeight,
                CustomTextField(
                  label: S.of(context).email,
                  validator: (value) => checkFieldValidation(
                    val: cubit.emailController.text,
                    fieldName: S.of(context).email,
                    fieldType: ValidationType.email,
                  ),
                  controller: cubit.emailController,
                  hintText: S.of(context).email,
                ),
                16.toHeight,
                CustomTextField(
                  label: S.of(context).userName,
                  validator: (value) => checkFieldValidation(
                    val: cubit.userNameController.text,
                    fieldName: S.of(context).userName,
                    fieldType: ValidationType.phone,
                  ),
                  controller: cubit.userNameController,
                  hintText: S.of(context).userName,
                ),
                // if(AppConstants.user!.role == "Doctor")16.toHeight,
                // if(AppConstants.user!.role == "Doctor")
                // CustomTextField(
                //   label: S.of(context).clinicPhoneNumber,
                //   controller: cubit.clinicPhoneController,
                //   validator: (value) => checkFieldValidation(
                //     val: cubit.clinicPhoneController.text,
                //     fieldName: S.of(context).clinicPhoneNumber,
                //     fieldType: ValidationType.phone,
                //   ),
                //   hintText: S.of(context).clinicPhoneNumber),

                48.toHeight,
                CustomButton(
                        raduis: 8.r,
                        width: 100.w,
                        text: S.of(context).edit,
                        onTap: () {})
                    .animate()
                    .flipV(duration: 500.ms)
              ],
            ).animate().fadeIn(duration: 300.ms);
          },
        ),
      ),
    );
  }
}
