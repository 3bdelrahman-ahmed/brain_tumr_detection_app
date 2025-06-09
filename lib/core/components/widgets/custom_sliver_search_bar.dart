import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:flutter/material.dart';

import '../../../foundations/validations.dart';
import '../../utils/assets/assets_svg.dart';
import '../../utils/strings/app_string.dart';
import 'custom_text_field.dart';

class CustomSliverSearchBar extends SliverPersistentHeaderDelegate {
  final String hintText;
  final TextEditingController? controller;
  const CustomSliverSearchBar(this.hintText, {Key? key, this.controller});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context)
          .scaffoldBackgroundColor, // Ensures it's not transparent
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      child: CustomTextField(
        controller: controller ?? TextEditingController(),
        validator: (value) => checkFieldValidation(
            val: value,
          
            fieldName: AppStrings.search,
            fieldType: ValidationType.text),
        hintText: hintText,
        prefixIcon: AssetsSvg.searchIcon,
      ),
    );
  }

  @override
  double get maxExtent => 85.h; // Increased height for spacing
  @override
  double get minExtent => 85.h; // Same as max for consistency

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
