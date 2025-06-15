import 'package:brain_tumr_detection_app/core/components/screens/register_screen_location_widget.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_app_shimmer.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_image_view.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_profile_image.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/image_extentions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/features/medical_history/data/model/detection_response.dart';
import 'package:brain_tumr_detection_app/features/medical_history/presentation/view_model/medical_history_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/config/app_routing.dart';
import '../../../../../core/utils/assets/assets_png.dart';
import '../../../../../core/utils/theme/colors/app_colors.dart';
import '../../../../../core/utils/theme/text_styles/app_text_styles.dart';
import '../../../../../generated/l10n.dart';
import '../../../../reports/presentation/view/widget/diagnosis_container.dart';

class DetailedScanResultScreen extends StatefulWidget {
  const DetailedScanResultScreen(
      {Key? key, required this.doctorReview, required this.detectionClass})
      : super(key: key);
  final DoctorReview doctorReview;
  final String detectionClass;

  @override
  State<DetailedScanResultScreen> createState() =>
      _DetailedScanResultScreenState();
}

class _DetailedScanResultScreenState extends State<DetailedScanResultScreen> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
          backgroundColor: AppColors.background,
          elevation: 0,
          centerTitle: true,
          title: Text(
            S.of(context).result,
            style:
                AppTextStyles.font16BlueW700.copyWith(color: AppColors.black),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Container(
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: BlocConsumer<MedicalHistoryCubit, MedicalHistoryState>(
                  listener: (context, state) {
                    if (state is GetDoctorByIdLoaded) {
                      Navigator.pushNamed(
                          context, AppRoutes.doctorProfileScreen,
                          arguments: state.doctorClinicModel);
                    }
                  },
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: state is GetDoctorByIdLoading
                          ? () {}
                          : () => context
                              .read<MedicalHistoryCubit>()
                              .getDoctorById(widget.doctorReview.doctorId),
                      child: Row(
                        children: [
                          state is GetDoctorByIdLoading
                              ? CustomAppShimmer(
                                  width: 60.w,
                                  height: 60.w,
                                  borderRaduis: 30.r,
                                )
                              : CustomProfileImage(
                                  size: 30.w,
                                  imageUrl:
                                      widget.doctorReview.doctorProfilePicture,
                                ),
                          16.toWidth,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                S.of(context).reviewedBy,
                                style: AppTextStyles.font10BlueW600,
                              ),
                              Text(
                                widget.doctorReview.doctorName,
                                style: AppTextStyles.font16BlueW700,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 6,
                            spreadRadius: 2,
                            offset: Offset(0, 2),
                          )
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => setState(() => isExpanded = !isExpanded),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(S.of(context).diagnosis,
                                  style: AppTextStyles.font16BlueW700),
                              Icon(
                                isExpanded
                                    ? Icons.expand_less
                                    : Icons.expand_more,
                                color: AppColors.buttonsAndNav,
                              ),
                            ],
                          ),
                        ),
                        AnimatedCrossFade(
                          duration: Duration(milliseconds: 300),
                          firstChild: Container(),
                          secondChild: Column(
                            children: [
                              10.toHeight,
                              DiagnosisContainer(
                                head: S.of(context).result,
                                diagnosis:
                                    "${S.of(context).detectedAs} ${widget.detectionClass}",
                              ),
                              DiagnosisContainer(
                                head: S.of(context).findings,
                                diagnosis: widget.doctorReview.findings,
                              ),
                              DiagnosisContainer(
                                head: S.of(context).reasoning,
                                diagnosis: widget.doctorReview.reasoning,
                              ),
                            ],
                          ),
                          crossFadeState: isExpanded
                              ? CrossFadeState.showSecond
                              : CrossFadeState.showFirst,
                        ),
                      ],
                    ).paddingSymmetric(vertical: 20.h, horizontal: 20.w))
                .paddingSymmetric(horizontal: 20.w)
          ],
        ),
      ),
    );
  }
}
