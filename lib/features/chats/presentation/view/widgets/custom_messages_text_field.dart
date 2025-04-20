import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/strings/app_string.dart';
import '../../../../../core/utils/theme/colors/app_colors.dart';

class CustomMessagesTextField extends StatelessWidget {
  const CustomMessagesTextField({Key? key, required this.controller, required this.onSend}) : super(key: key);
  final TextEditingController controller;
  final VoidCallback onSend;
  @override
  Widget build(BuildContext context) {
    return Row(
      children:[
        Expanded(
          child: Container(
            padding:EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                border: Border.all(
                    color: AppColors.buttonsAndNav
                )
            ),
            child: TextField(
              onEditingComplete: onSend,
              controller: controller,
              decoration: InputDecoration(
                hintText: AppStrings.writeAMessage,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                filled: true,
                fillColor: Colors.white,
                hintStyle: AppTextStyles.font12GreyW500,
              ),
            ),
          ).paddingSymmetric(vertical: 5.h,horizontal: 5),
        ),
        8.toWidth,
        IconButton(
          icon: const Icon(Icons.send, color: AppColors.buttonsAndNav),
          onPressed: onSend,
        )
      ],
    );
  }
}
