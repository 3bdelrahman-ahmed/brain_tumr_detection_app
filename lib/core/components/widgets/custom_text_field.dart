import 'package:brain_tumr_detection_app/core/components/widgets/custom_drop_down_menu.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_image_view.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/image_extentions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/colors/app_colors.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final bool? obscureText;
  final String? label;
  final String? subLabel;
  final TextInputType keyboardType;
  final String? prefixIcon;
  final String? suffixIcon;
  final VoidCallback? onSuffixTap;
  final TextStyle? hintTextStyle;
  final int? maxLines;
  final int? minLines;
  final VoidCallback? onTap;
  final TextInputAction? onAction;
  final FormFieldValidator<String>? validator;
  final bool? readOnly;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final Function(String)? onSubmit;
  const CustomTextField({
    Key? key,
    required this.hintText,
    this.controller,
    this.focusNode,
    this.subLabel,
    this.onSubmit,
    this.obscureText = false,
    this.label,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixTap,
    this.hintTextStyle,
    this.maxLines,
    this.minLines,
    this.onAction,
    this.validator,
    this.onChanged,
    this.readOnly,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Text(
            label!,
            style: AppTextStyles.font15LightGreenW500
                .copyWith(color: AppColors.typography),
          ),
        label != null ? 2.toHeight : 4.toHeight,
        if (subLabel != null)
          Text(
            subLabel!,
            style: AppTextStyles.font12LightGreenW500
                .copyWith(color: AppColors.typographyLowOpacity),
          ),
        if (subLabel != null) 4.toHeight,
        TextFormField(
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
          maxLines: maxLines ?? 1,
          minLines: minLines ,
          onFieldSubmitted: onSubmit,
          focusNode: focusNode,
          onTap: onTap,
          readOnly: readOnly ?? false,
          cursorColor: AppColors.typography,
          controller: controller,
          obscureText: obscureText ?? false,
          keyboardType: keyboardType,
          validator: validator,
          mouseCursor: MouseCursor.uncontrolled,
          cursorHeight: 24.h,
          style: AppTextStyles.font15GreenW500
              .copyWith(fontWeight: FontWeight.w600),
          cursorWidth: 1.5.w,
          onChanged: onChanged,
          decoration: InputDecoration(
            errorMaxLines: 3,
            hintText: hintText,
            hintStyle: hintTextStyle ?? AppTextStyles.font15LightGreenW500,
            prefixIcon: prefixIcon != null
                ? GestureDetector(
                    child: Padding(
                      padding: EdgeInsets.all(8.w),
                      child: CustomImageView(
                        svgPath: prefixIcon!.toSVG(),
                        width: 25.w,
                        height: 25.w,
                      ),
                    ),
                  )
                : null,
            suffixIcon: suffixIcon != null
                ? GestureDetector(
                    onTap: onSuffixTap,
                    child: Padding(
                      padding: EdgeInsets.all(8.w),
                      child: CustomImageView(
                        svgPath: suffixIcon!.toSVG(),
                        width: 20.w,
                        height: 20.w,
                      ),
                    ),
                  ).animate().flipV(duration: 300.ms)
                : null,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(color: AppColors.typographyLowOpacity),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(color: AppColors.typographyLowOpacity),
            ),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(color: AppColors.error),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(color: AppColors.typographyLowOpacity),
            ),
          ),
        ),
      ],
    );
  }
}
