import 'package:brain_tumr_detection_app/core/components/widgets/custom_image_view.dart';
import 'package:brain_tumr_detection_app/core/utils/assets/assets_png.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/image_extentions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/cubits/navigation_cubit/navigation_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => NavigationCubit(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: BlocBuilder<NavigationCubit, NavigationState>(
            builder: (context, state) {
              final cubit = context.read<NavigationCubit>();
              return Stack(
                children: [
                  cubit.tabs[cubit.currentIndex],
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.buttonsAndNav,
                        borderRadius: BorderRadius.circular(45.r),
                        // Rounded corners
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 40.w),
                      // Left & right margins
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          splashFactory: NoSplash.splashFactory,
                          // Remove ripple effect
                          highlightColor:
                              Colors.transparent, // Remove highlight effect
                        ),
                        child: BottomNavigationBar(
                          iconSize: 40,
                          type: BottomNavigationBarType.fixed,
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          showUnselectedLabels: false,
                          showSelectedLabels: false,
                          // Remove shadow
                          selectedItemColor: AppColors.background,
                          unselectedItemColor: AppColors.navSecondary,
                          items: [
                            BottomNavigationBarItem(
                                icon: Image.asset(
                                  AssetsPng.community.toPng(),
                                  color: cubit.currentIndex == 0
                                      ? AppColors.background
                                      : AppColors.navSecondary,
                                  width: 30.w,
                                  height: 30.h,
                                ),
                                label: ""),
                            BottomNavigationBarItem(
                                icon: Image.asset(
                                  AssetsPng.clock.toPng(),
                                  color: cubit.currentIndex == 1
                                      ? AppColors.background
                                      : AppColors.navSecondary,
                                  width: 30.w,
                                  height: 30.h,
                                ),
                                label: ""),
                            BottomNavigationBarItem(
                                icon: SizedBox.shrink(), label: ""),
                            // Empty space for floating button
                            BottomNavigationBarItem(
                                icon: Image.asset(
                                  AssetsPng.doctor.toPng(),
                                  color: cubit.currentIndex == 3
                                      ? AppColors.background
                                      : AppColors.navSecondary,
                                  width: 30.w,
                                  height: 30.h,),
                                label: ""),
                            BottomNavigationBarItem(
                                icon: Icon(Icons.person), label: ""),
                          ],
                          onTap: (index) {
                            cubit.changePage(index);
                          },
                          currentIndex: cubit.currentIndex,
                        ),
                      ),
                    ).paddingOnly(bottom: 20.h),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        splashFactory: NoSplash.splashFactory,
                        highlightColor: Colors.transparent,
                      ),
                      child: FloatingActionButton(
                          highlightElevation: 0,
                          onPressed: () {
                            cubit.changePage(2);
                          },
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30.r),
                                  topLeft: Radius.circular(30.r))),
                          backgroundColor: AppColors.buttonsAndNav,
                          child: Image.asset(
                            AssetsPng.upload.toPng(),
                            color: cubit.currentIndex == 2
                                ? AppColors.background
                                : AppColors.navSecondary,
                          )),
                    ),
                  ).paddingOnly(bottom: 55.h),
                ],
              );
            },
          ),
        ));
  }
}
