import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/foundations/validations.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/components/widgets/custom_button.dart';
import '../../../../../../../core/components/widgets/custom_text_field.dart';
import '../../../../../core/utils/strings/app_string.dart';
import '../../../../../../../core/utils/theme/text_styles/app_text_styles.dart';

class ForgotPasswordSheet extends StatelessWidget {
  const ForgotPasswordSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40.w,
              height: 5.h,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          5.toHeight,
          Center(
              child: Text(AppStrings.forgetYourPassword,
                  style: AppTextStyles.font20GreenW500)),
          10.toHeight,
          Center(
            child: Text(
              AppStrings.dontWorryPassword,
              style: AppTextStyles.font15LightGreenW500,
              textAlign: TextAlign.center,
            ),
          ),
          20.toHeight,
          CustomTextField(
              validator: (value) => checkFieldValidation(
                  val: value,
                  fieldName: AppStrings.email,
                  fieldType: ValidationType.email),
              label: AppStrings.email,
              hintText: AppStrings.enterYourEmail),
          20.toHeight,
          Center(
            child: CustomButton(
              text: AppStrings.next,
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
          20.toHeight,
        ],
      ).paddingOnly(
        right: 20.w,
        left: 20.w,
        top: 5.h,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
    );
  }
}
