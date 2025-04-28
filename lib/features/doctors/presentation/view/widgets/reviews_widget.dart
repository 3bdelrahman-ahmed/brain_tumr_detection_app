import 'package:brain_tumr_detection_app/core/components/widgets/custom_profile_image.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/stars_generator.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/theme/colors/app_colors.dart';
import '../../../../../generated/l10n.dart';
import '../../viewmodel/show_doctors_cubit.dart';

class ReviewsListWidget extends StatelessWidget {
  const ReviewsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            spreadRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).reviews,
            style: AppTextStyles.font16BlueW700,
          ),
          12.toHeight,
          SizedBox(
            height: 170.h,
            child: BlocBuilder<ShowDoctorsCubit, ShowDoctorsState>(
              builder: (context, state) {
                if (state is ShowDoctorsLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is ShowDoctorsLoaded) {
                  final reviews = state.reviews;
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: reviews.length,
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    itemBuilder: (context, index) {
                      final review = reviews[index];
                      return Container(
                        width: 220.w,
                        margin: EdgeInsets.only(right: 16.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(12.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10.r,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10.r),
                          child: Column(
                            children: [
                              CustomProfileImage(
                                imageUrl: reviews[index].profileImage,
                              ),
                              8.toHeight,
                              Text(
                                review.patientName,
                                style: AppTextStyles.font12BlueW500,
                                textAlign: TextAlign.center,
                              ),
                              4.toHeight,
                              StarsGenerator(rating: review.rating),
                              8.toHeight,
                              Expanded(
                                child: Text(
                                  review.comment,
                                  style: AppTextStyles.font12GreenW700,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else if (state is ShowDoctorsError) {
                  return Center(child: Text(state.message));
                } else {
                  return SizedBox();
                }
              },
            ),
          ),
        ],
      ),
    ).paddingSymmetric(horizontal: 19.w);
  }
}
