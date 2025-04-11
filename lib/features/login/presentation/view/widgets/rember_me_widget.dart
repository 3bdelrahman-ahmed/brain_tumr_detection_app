import 'package:brain_tumr_detection_app/core/helper/functions/show_default_dialog_function.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/strings/app_string.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/colors/app_colors.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import 'package:brain_tumr_detection_app/features/login/presentation/view/widgets/biometric_auth_dialog_widget.dart';
import 'package:flutter/material.dart';

class RemberMeWidget extends StatelessWidget {
  bool remmberMeClicked;
  final Function onChanged;
  RemberMeWidget(
      {super.key, required this.remmberMeClicked, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox.adaptive(
            activeColor: AppColors.typography,
            side:
                BorderSide(color: AppColors.typographyLowOpacity, width: 1.5.w),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.r),
            ),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity.compact,
            value: remmberMeClicked,
            onChanged: (value) {
              if (value!) {
                showDefaultDialog(context, child: BiometricAuthDialogWidget());
              }
              onChanged();
            }),
        Text(
          AppStrings.remmberMe,
          style: AppTextStyles.font15GreenW500,
        ),
      ],
    );
  }
}
