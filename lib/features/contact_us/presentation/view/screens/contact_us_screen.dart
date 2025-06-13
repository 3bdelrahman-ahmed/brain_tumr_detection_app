import 'package:brain_tumr_detection_app/core/components/widgets/custom_button.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_text_field.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/features/contact_us/presentation/view_model/cubit/contact_us_cubit.dart';
import 'package:brain_tumr_detection_app/foundations/validations.dart';
import 'package:brain_tumr_detection_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/theme/colors/app_colors.dart';
import '../../../../../core/utils/theme/text_styles/app_text_styles.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ContactUsCubit>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(S.of(context).supportFeedback,
            style: AppTextStyles.font16BlueW700.copyWith(
              color: AppColors.black,
            )),
      ),
      body: BlocBuilder<ContactUsCubit, ContactUsState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 6,
                      spreadRadius: 2,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Form(
                  key: cubit.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).ContactUs,
                        style: AppTextStyles.font20BlueW700,
                      ),
                      8.toHeight,
                      Text(
                        S.of(context).contactUsMessage,
                        style: AppTextStyles.font14BlueW500,
                        textAlign: TextAlign.center,
                      ),
                      12.toHeight,
                      CustomTextField(
                        controller: cubit.message,
                        validator: (v) => checkFieldValidation(
                            val: cubit.message.text,
                            fieldName: S.of(context).messages,
                            fieldType: ValidationType.text),
                        minLines: 4,
                        maxLines: 100,
                        hintText: "my appointments is cancelled",
                      ),
                    ],
                  ),
                ),
              ),
              32.toHeight,
              CustomButton(
                  isLoading: state is ContactUsLoading,
                  raduis: 8.r,
                  text: S.of(context).submit,
                  onTap: () {
                    cubit.sendMessage(context);
                  }).animate().flipV(duration: 500.ms)
            ],
          );
        },
      ).paddingSymmetric(horizontal: 24.w, vertical: 24.h),
    );
  }
}
