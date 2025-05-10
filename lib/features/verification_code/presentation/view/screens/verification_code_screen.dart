import 'package:brain_tumr_detection_app/core/components/widgets/custom_button.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_image_view.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_pin_submission_field.dart';
import 'package:brain_tumr_detection_app/core/utils/assets/assets_png.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/image_extentions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/strings/app_string.dart';
import 'package:brain_tumr_detection_app/features/verification_code/presentation/view/widgets/resend_code_widget.dart';
import 'package:brain_tumr_detection_app/features/verification_code/presentation/view/widgets/sub_header_text_widget.dart';
import 'package:brain_tumr_detection_app/features/verification_code/presentation/view_model/cubit/verification_code_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../generated/l10n.dart';
import '../widgets/header_text_widget.dart';

class VerificationCodeScreen extends StatelessWidget {
  final String email;
  const VerificationCodeScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<VerificationCodeCubit>();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocBuilder<VerificationCodeCubit, VerificationCodeState>(
            builder: (context, state) {
              return Form(
                key: cubit.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomImageView(
                      imagePath: AssetsPng.verifyCode.toPng(),
                      width: double.infinity,
                      height: 250.h,
                    ),
                    16.toHeight,
                    const HeaderTextWidget().paddingSymmetric(horizontal: 24.w),
                    8.toHeight,
                    const SubHeaderTextWidget()
                        .paddingSymmetric(horizontal: 24.w),
                    16.toHeight,
                    CustomPinSubmissionWidget(
                      onChanged: (p0, p1) {},
                      verificationCode: cubit.code,
                    ).paddingSymmetric(horizontal: 24.w),
                    16.toHeight,
                    const ResendCodeWidget().paddingSymmetric(horizontal: 24.w),
                    50.toHeight,
                    CustomButton(
                        isLoading: state is SubmitVerificationCodeLoadingState,
                        text: S.of(context).submit,
                        onTap: () {
                          cubit.verifyCode(email);
                        }).paddingSymmetric(horizontal: 24.w),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
