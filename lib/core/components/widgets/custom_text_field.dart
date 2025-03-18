import 'package:brain_tumr_detection_app/core/components/widgets/custom_image_view.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/image_extentions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/colors/app_colors.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final bool? obscureText;
  final String? label;
  final TextInputType keyboardType;
  final String? prefixIcon;
  final String? suffixIcon;
  final VoidCallback? onSuffixTap;
  final FormFieldValidator<String>? validator;
  final Function(String)? onChanged;

  const CustomTextField({
    Key? key,
    required this.hintText,
    this.controller,
    this.obscureText = false,
    this.label,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixTap,
    required this.validator,
    this.onChanged,
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
        if (label != null) 4.toHeight,
        TextFormField(
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
            hintText: hintText,
            hintStyle: AppTextStyles.font15LightGreenW500,
            prefixIcon: prefixIcon != null
                ? Padding(
                    padding: EdgeInsets.all(8.w),
                    child: CustomImageView(
                      svgPath: prefixIcon!.toSVG(),
                      width: 25.w,
                      height: 25.w,
                    ),
                  )
                : null,
            // prefixIconColor: AppColors.typographyLowOpacity,
            suffixIcon: suffixIcon != null
                ? GestureDetector(
                    onTap: onSuffixTap,
                    child: Padding(
                      padding: EdgeInsets.all(8.w),
                      child: CustomImageView(
                        svgPath: suffixIcon!.toSVG(),
                        width: 25.w,
                        height: 25.w,
                      ),
                    ),
                  )
                : null,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.r),
              borderSide: BorderSide(color: AppColors.typographyLowOpacity),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.r),
              borderSide: BorderSide(color: AppColors.typographyLowOpacity),
            ),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
          ),
        ),
      ],
    );
  }
}
