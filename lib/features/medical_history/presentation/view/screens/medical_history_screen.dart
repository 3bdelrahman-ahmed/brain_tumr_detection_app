import 'package:brain_tumr_detection_app/core/components/widgets/custom_app_shimmer.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_empty_widget.dart';
import 'package:brain_tumr_detection_app/features/medical_history/presentation/view/widgets/scan_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_image_view.dart';
import 'package:brain_tumr_detection_app/core/utils/assets/assets_svg.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/image_extentions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/features/medical_history/presentation/view_model/medical_history_cubit.dart';
import '../../../../../core/utils/theme/colors/app_colors.dart';
import '../../../../../core/utils/theme/text_styles/app_text_styles.dart';
import '../../../../../generated/l10n.dart';

class MedicalHistoryScreen extends StatefulWidget {
  const MedicalHistoryScreen({super.key});

  @override
  State<MedicalHistoryScreen> createState() => _MedicalHistoryScreenState();
}

class _MedicalHistoryScreenState extends State<MedicalHistoryScreen> {
  late final MedicalHistoryCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<MedicalHistoryCubit>();
    _cubit.getPatientScans();

    // Attach scroll listener
    context
        .read<MedicalHistoryCubit>()
        .scrollController
        .addListener(() {
      if (context
          .read<MedicalHistoryCubit>()
          .scrollController
          .position
          .pixels >=
          context
              .read<MedicalHistoryCubit>()
              .scrollController
              .position
              .maxScrollExtent -
              200) {
        final cubit = context.read<MedicalHistoryCubit>();
        cubit.loadMoreScans();
      }
    });
  }

  @override
  void dispose() {
    _cubit.scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.background,
          elevation: 0,
          centerTitle: true,
          title: Text(
            S
                .of(context)
                .medicalDataManagement,
            style:
            AppTextStyles.font16BlueW700.copyWith(color: AppColors.black),
          )),
      body: BlocBuilder<MedicalHistoryCubit, MedicalHistoryState>(
        builder: (context, state) {
          final scans = _cubit.detectionResponse?.data ?? [];
          if (state is MedicalHistoryLoading && scans.isEmpty) {
            return Column(
              children: [
                CustomAppShimmer(
                  height: 50.h,
                  borderRaduis: 24.r,
                ).paddingSymmetric(horizontal: 24.w, vertical: 12.h),
                CustomAppShimmer(
                  height: 50.h,
                  borderRaduis: 24.r,
                ).paddingSymmetric(horizontal: 24.w, vertical: 12.h),
              ],
            );
          }

          if (state is MedicalHistoryError) {
            return Center(child: Text('Error loading medical scans'));
          }

          if (scans.isEmpty) {
            return Center(child: CustomEmptyWidget.scans());
          }

          return ListView.separated(
            controller: _cubit.scrollController,
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
            itemCount: scans.length,
            separatorBuilder: (_, __) => SizedBox(height: 12.h),
            itemBuilder: (context, index) {
              final scan = scans[index];
              return TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: 1),
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeIn,
                builder: (context, value, child) {
                  return Opacity(
                    opacity: value,
                    child: Transform.translate(
                      offset: Offset(0, (1 - value) * 20),
                      child: child,
                    ),
                  );
                },
                child: ScanRow(scan: scan),
              );
            },
          );
        },
      ),
    );
  }
}
