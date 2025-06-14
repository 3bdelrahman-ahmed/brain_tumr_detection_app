import 'package:brain_tumr_detection_app/core/utils/extenstions/image_extentions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/features/reset_password/presentation/view/widgets/reset_password_form.dart';
import 'package:flutter/material.dart';

import '../../../../../core/components/widgets/custom_auth_container.dart';
import '../../../../../core/components/widgets/custom_image_view.dart';
import '../../../../../core/utils/assets/assets_png.dart';
import '../../../../../core/utils/theme/text_styles/app_text_styles.dart';
import '../../../../../generated/l10n.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // CustomAppLogoContainer(),
            CustomImageView(
              imagePath: AssetsPng.resetPassword.toPng(),
              width: double.infinity,
            ),
            15.toHeight,
            Text(
              S.of(context).resetPassword,
              style: AppTextStyles.font20GreenW500
                  .copyWith(fontWeight: FontWeight.w700),
            ),
            8.toHeight,
            Text(
              S.of(context).letsResetIt,
              style: AppTextStyles.font15LightGreenW500,
              textAlign: TextAlign.center,
            ),
            16.toHeight,
            CustomAuthContainerWidget(
              child: ResetPasswordForm(),
            ).paddingSymmetric(horizontal: 10.w),
            32.toHeight,
          ],
        ),
      ),
    );
  }
}
