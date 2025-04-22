import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/features/register/presentation/view_model/rigester_screen_cubit.dart';
import 'package:brain_tumr_detection_app/features/register/presentation/view_model/rigester_screen_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/components/widgets/custom_auth_container.dart';
import '../../../../../core/components/widgets/custom_text_field.dart';
import '../../../../../core/config/app_routing.dart';
import '../../../../../core/utils/assets/assets_svg.dart';
import '../../../../../core/utils/strings/app_string.dart';
import '../../../../../core/utils/theme/text_styles/app_text_styles.dart';
import '../../../../../foundations/validations.dart';

class ClincFormWidget extends StatelessWidget {
  const ClincFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<RigesterScreenCubit>();
    return BlocBuilder<RigesterScreenCubit, RigesterScreenState>(
      builder: (context, state) {
        return CustomAuthContainerWidget(
          child: Form(
            key: cubit.formKeys[2],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(AppStrings.kindlyCompleteTheForm,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.font20GreenW500),
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
                    onSubmit: (p0) => FocusScope.of(context)
                        .requestFocus(cubit.clinicPhoneNumberFocus),
                    validator: (_) => cubit.streetName != null
                        ? null
                        : AppStrings.locationError,
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
                CustomTextField(
                  focusNode: cubit.clinicPhoneNumberFocus,
                  label: AppStrings.clinicPhoneNumber,
                  keyboardType: TextInputType.phone,
                  hintText: AppStrings.enterYourClinicPhoneNumber,
                  controller: cubit.clinicPhoneNumberController,
                  validator: (value) => checkFieldValidation(
                      val: value,
                      fieldName: AppStrings.clinicPhoneNumber,
                      fieldType: ValidationType.phone),
                ),
                16.toHeight,
                CustomTextField(
                  controller: cubit.clinicLicenseController,
                  focusNode: cubit.imageFocus,
                  hintText: AppStrings.tapToAttachFile,
                  label: AppStrings.clinicLicense,
                  readOnly: true,
                  suffixIcon: AssetsSvg.uploadDoc,
                  validator: (v) => checkFieldValidation(
                      val: cubit.licenseFrontController.text,
                      fieldName: AppStrings.clinicLicense,
                      fieldType: ValidationType.text),
                  onTap: () {
                    cubit.pickDocument().then((v) {
                      if (v != null) {
                        cubit.setClinicLicense(v);
                      }
                    });
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
