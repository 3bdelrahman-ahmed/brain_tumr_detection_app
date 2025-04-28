import 'dart:async';

import 'package:brain_tumr_detection_app/core/components/cubits/app_cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_image_view.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/foundations/app_constants.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/colors/app_colors.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/image_extentions.dart';
import '../../../../core/components/cubits/navigation_cubit/navigation_cubit.dart';
import '../../../../core/components/widgets/custom_profile_image.dart';
import '../../../../core/utils/assets/assets_svg.dart';
import '../../../../core/utils/responsive_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late ScrollController currentScrollController;
  bool isScrolling = false;
  late AnimationController _animationController;
  late Animation<double> _animation;
  Timer? _scrollStopTimer;

  @override
  void initState() {
    super.initState();
    if (AppConstants.user?.role == 'Doctor') {
      context.read<NavigationCubit>().initializeDoctorTabs();
    } else {
      context.read<AppCubit>().getDoctorsClinics();
      context.read<NavigationCubit>().initializePatientTabs();
    }
    currentScrollController =
        context.read<NavigationCubit>().getScrollController(0);
    currentScrollController.addListener(_onScroll);

    // Animation setup
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  void _onScroll() {
    if (currentScrollController.position.userScrollDirection !=
        ScrollDirection.idle) {
      if (!isScrolling) {
        setState(() {
          isScrolling = true;
        });
        _animationController.forward(); // Animate when scrolling starts
        debugPrint("User started scrolling...");
      }

      // Cancel any existing timer and start a new one
      _scrollStopTimer?.cancel();
      _scrollStopTimer = Timer(const Duration(milliseconds: 200), () {
        if (currentScrollController.position.userScrollDirection ==
            ScrollDirection.idle) {
          setState(() {
            isScrolling = false;
          });
          _animationController.reverse(); // Animate back when scrolling stops
          debugPrint("User stopped scrolling.");
        }
      });
    }
  }

  @override
  void dispose() {
    currentScrollController.removeListener(_onScroll);
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          final cubit = context.read<NavigationCubit>();

          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              cubit.tabs[cubit.currentIndex],
              // Animated Bottom Navigation Bar
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                bottom: 20.h,
                // Move down when scrolling
                left: 30.w,
                right: 30.w,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                  height: 60.h,
                  decoration: BoxDecoration(
                    color: AppColors.buttonsAndNav,
                    borderRadius: BorderRadius.circular(45),
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildNavItem(
                          image: AssetsSvg.feed.toSVG(),
                          index: 0,
                          cubit: cubit),
                      _buildNavItem(
                          image: AssetsSvg.history.toSVG(),
                          index: 1,
                          cubit: cubit),
                      SizedBox(width: 40.w),
                      _buildNavItem(
                          image: AssetsSvg.doctor.toSVG(),
                          index: 3,
                          cubit: cubit),
                      GestureDetector(
                        onTap: () => cubit.changePage(4),
                        child: CustomProfileImage(
                          imageUrl: AppConstants.user?.profilePicture,
                          size: 18.r,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Animated Scan Button
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Positioned(
                    bottom: (ResponsiveHelper.isTablet(context) ? 30.h : 42.h) +
                        (_animation.value *
                            (ResponsiveHelper.isTablet(context)
                                ? -14.h
                                : -15.h)),
                    child: GestureDetector(
                      onTap: () => cubit.changePage(2),
                      child: Container(
                        width: 48.w,
                        height: 48.w,
                        padding: EdgeInsets.symmetric(
                            horizontal: 4.w, vertical: 4.w),
                        decoration: BoxDecoration(
                          color: AppColors.buttonsAndNav,
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: CustomImageView(
                          svgPath: AppConstants.user?.role == 'Doctor'
                              ? AssetsSvg.doctorScan.toSVG()
                              : AssetsSvg.upload.toSVG(),
                          width: 48.w,
                          height: 48.w,
                          color: cubit.currentIndex == 2
                              ? AppColors.background
                              : AppColors.navSecondary,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildNavItem(
      {required String image,
      required int index,
      required NavigationCubit cubit}) {
    return GestureDetector(
      onTap: () => cubit.changePage(index),
      child: CustomImageView(
        svgPath: image,
        width: 30.w,
        height: 30.w,
        color: cubit.currentIndex == index
            ? AppColors.background
            : AppColors.navSecondary,
      ),
    );
  }
}
