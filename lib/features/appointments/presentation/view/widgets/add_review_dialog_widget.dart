import 'package:brain_tumr_detection_app/core/components/widgets/custom_button.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_text_field.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import 'package:brain_tumr_detection_app/foundations/validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../generated/l10n.dart';
import '../../view_model/appointment_cubit.dart';
import 'star_rating_widget.dart';

class AddReviewDialogWidget extends StatelessWidget {
  final int doctorId;
  const AddReviewDialogWidget({super.key, required this.doctorId});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AppointmentCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      child: Form(
        key: cubit.reviewFormKey,
        child: BlocBuilder<AppointmentCubit, AppointmentState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(S.of(context).addReview,
                    style: AppTextStyles.font20GreenW500
                        .copyWith(fontWeight: FontWeight.w700)),
                16.toHeight,
                StarRating(
                  onRatingChanged: (rating) {
                    cubit.setrating(rating);
                  },
                ),
                16.toHeight,
                CustomTextField(
                    label: S.of(context).yourReview,
                    minLines: 3,
                    maxLines: 20,
                    controller: cubit.reviewController,
                    validator: (v) => checkFieldValidation(
                        val: cubit.reviewController.text,
                        fieldName: S.of(context).yourReview,
                        fieldType: ValidationType.text),
                    hintText: S.of(context).yourReview),
                24.toHeight,
                CustomButton(
                  raduis: 8.r,
                  isLoading: state is AddReviewLoadingState,
                  width: 100.w,
                  text: S.of(context).submit,
                  onTap: () {
                    if (cubit.reviewFormKey.currentState!.validate()) {
                      cubit.addReview(doctorId, context);
                    }
                  },
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
