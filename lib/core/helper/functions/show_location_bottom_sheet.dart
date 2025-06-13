import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/colors/app_colors.dart';
import 'package:flutter/material.dart';

import '../../components/widgets/custom_location_sheet.dart';

Future<void> showLocationBottomSheet(BuildContext context) async {
  await showModalBottomSheet(
    backgroundColor: AppColors.white,
    constraints: BoxConstraints(
      minHeight: 350.h,
      maxHeight: 450.h,
    ),
    elevation: 0,
    isDismissible: true,
    showDragHandle: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
    ),
    context: context,
    builder: (context) {
      return const CustomLocationSheet();
    },
  );
}
