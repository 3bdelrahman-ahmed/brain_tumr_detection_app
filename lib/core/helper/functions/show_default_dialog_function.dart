  import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
  import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
  import 'package:brain_tumr_detection_app/core/utils/theme/colors/app_colors.dart';
  import 'package:flutter/material.dart';

  Future<Object?> showDefaultDialog(context,
          {required Widget child, bool removeStyle = false, barrierDismissible = true}) =>
      showGeneralDialog(
        barrierLabel: "Barrier",
        barrierDismissible: barrierDismissible,
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: const Duration(milliseconds: 250),
        context: context,
        pageBuilder: (_, __, ___) {
          return child;
        },
        transitionBuilder: (_, anim, __, child) {
          return SlideTransition(
            position: anim.drive(Tween(begin: const Offset(0, 1), end: const Offset(0, 0))),
            child: removeStyle
                ? child
                : Center(
                    child: Container(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
                            decoration: BoxDecoration(color: AppColors.background, borderRadius: BorderRadius.circular(10)),
                            child: Material(color: AppColors.background, child: child))
                        .paddingSymmetric(horizontal: 16.w)),
          );
        },
      );