import 'package:brain_tumr_detection_app/core/components/widgets/custom_image_view.dart';
import 'package:brain_tumr_detection_app/core/utils/assets/assets_svg.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/image_extentions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/theme/colors/app_colors.dart';
import '../../../../../generated/l10n.dart';

class CustomMessagesTextField extends StatelessWidget {
  const CustomMessagesTextField(
      {Key? key, required this.controller, required this.onSend})
      : super(key: key);
  final TextEditingController controller;
  final VoidCallback onSend;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: AppColors.buttonsAndNav)),
                child: TextField(
                  onEditingComplete: onSend,
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: S.of(context).writeAMessage,
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 16),
                    filled: true,
                    fillColor: Colors.white,
                    hintStyle: AppTextStyles.font12GreyW500,
                  ),
                ),
              ).paddingSymmetric(vertical: 5.h, horizontal: 5),
            ),
            8.toWidth,
            CustomImageView(
              svgPath: AssetsSvg.sendMessage.toSVG(),
              width: 32.w,
              onTap: () {
                if (controller.text.isNotEmpty) {
                  onSend();
                  controller.clear();
                }
              },
              color: AppColors.buttonsAndNav,
              height: 32.w,
            )
          ],
        ),
      ),
    );
  }
}
