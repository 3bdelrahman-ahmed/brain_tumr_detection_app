import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:flutter/material.dart';
import '../../../../../core/components/widgets/custom_app_shimmer.dart';

class DoctorCardAppointmentShimmer extends StatelessWidget {
  const DoctorCardAppointmentShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            spreadRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              CustomAppShimmer(
                width: 134.w,
                height: 157.w,
                borderRaduis: 10.r,
              ),
              15.toWidth,
              // Right section shimmer placeholders
              Container(
                width: 130.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomAppShimmer(
                      width: 100.w,
                      height: 20.h,
                      borderRaduis: 8.r,
                    ),
                    5.toHeight,
                    CustomAppShimmer(
                      width: 60.w,
                      height: 14.h,
                      borderRaduis: 8.r,
                    ),
                    5.toHeight,
                    CustomAppShimmer(
                      width: 90.w,
                      height: 16.h,
                      borderRaduis: 8.r,
                    ),
                    5.toHeight,
                    CustomAppShimmer(
                      width: 120.w,
                      height: 16.h,
                      borderRaduis: 8.r,
                    ),
                  ],
                ),
              ),
            ],
          ),
          25.toHeight,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomAppShimmer(
                width: 140.w,
                height: 50.h,
                borderRaduis: 10.r,
              ),
              CustomAppShimmer(
                width: 140.w,
                height: 50.h,
                borderRaduis: 10.r,
              ),
            ],
          )
        ],
      ).paddingOnly(top: 5.h),
    );
  }
}
