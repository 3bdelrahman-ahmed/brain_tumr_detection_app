import 'package:brain_tumr_detection_app/core/components/cubits/app_cubit/app_cubit.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../foundations/validations.dart';
import '../../utils/assets/assets_svg.dart';
import '../../utils/strings/app_string.dart';
import 'custom_text_field.dart';

class CustomSliverSearchBar extends SliverPersistentHeaderDelegate {
  final String hintText;
  final String? suffixIcon;
  final TextEditingController? controller;

  const CustomSliverSearchBar(this.hintText,
      {Key? key, this.controller, this.suffixIcon});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Container(
          height: maxExtent, // Explicit height to prevent geometry issues
          color: Theme.of(context).scaffoldBackgroundColor,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
          child: CustomTextField(
            onSuffixTap: () {
              context.read<AppCubit>().searchController.clear();
              context.read<AppCubit>().getDoctorsClinics(
                    reset: true,
                  );
            },
            suffixIcon: context
                    .watch<AppCubit>()
                    .searchController
                    .text
                    .trim()
                    .isNotEmpty
                ? suffixIcon
                : null,
            onSubmit: (p0) {
              context.read<AppCubit>().getDoctorsClinics(
                    reset: true,
                  );
            },
            controller: controller ?? TextEditingController(),
            validator: (value) => checkFieldValidation(
                val: value,
                fieldName: AppStrings.search,
                fieldType: ValidationType.text),
            hintText: hintText,
            prefixIcon: AssetsSvg.searchIcon,
          ),
        );
      },
    );
  }

  @override
  double get maxExtent => 85.0.h;

  @override
  double get minExtent => 85.0.h;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
