import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:flutter/material.dart';

import '../../../foundations/validations.dart';
import '../../utils/assets/assets_svg.dart';
import '../../utils/string/app_string.dart';
import 'custom_text_field.dart';

class CustomSliverSearchBar extends SliverPersistentHeaderDelegate {
 final String hintText;
  const CustomSliverSearchBar(this.hintText, {Key? key});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context)
          .scaffoldBackgroundColor, // Ensures it's not transparent
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      child: CustomTextField(
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
  double get maxExtent => 75.h; // Increased height for spacing
  @override
  double get minExtent => 75.h; // Same as max for consistency

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate){
    return false;
  }
}

