import 'package:brain_tumr_detection_app/core/components/screens/register_screen_location_widget.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_image_view.dart';
import 'package:brain_tumr_detection_app/core/utils/assets/assets_svg.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/image_extentions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/features/medical_history/presentation/view_model/medical_history_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/theme/colors/app_colors.dart';
import '../../../../../core/utils/theme/text_styles/app_text_styles.dart';
import '../../../../../generated/l10n.dart';

class MedicalHistoryScreen extends StatelessWidget {
  const MedicalHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(S.of(context).medicalDataManagement,
            style: AppTextStyles.font16BlueW700.copyWith(
              color: AppColors.black,
            )),
      ),
      body: BlocBuilder<MedicalHistoryCubit, MedicalHistoryState>(
        builder: (context, state) {
          // Dummy list of dates (in real usage, replace with actual data from the Cubit)
          final files = List.generate(7, (index) => 'February 15, 2025');

          return ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            itemCount: files.length,
            separatorBuilder: (_, __) => SizedBox(height: 12.h),
            itemBuilder: (context, index) {
              return TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: 1),
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeIn,
                builder: (context, value, child) {
                  return Opacity(
                    opacity: value,
                    child: Transform.translate(
                      offset: Offset(0, (1 - value) * 20), // slight upward slide
                      child: child,
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(24.r),
                    border: Border.all(color: AppColors.buttonsAndNav),
                  ),
                  child: Row(
                    children: [
                      CustomImageView(
                        svgPath: AssetsSvg.file.toSVG(),
                        height: 30.w,
                        width: 30.w,
                        color: AppColors.buttonsAndNav,
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Text(
                          'File.pdf',
                          style: AppTextStyles.font14BlueW700,
                        ),
                      ),
                      Text(
                        files[index],
                        style: AppTextStyles.font10BlueW600,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
