import 'package:brain_tumr_detection_app/core/components/widgets/custom_button.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_text_field.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/features/reports/data/model/doctor_reports_model.dart';
import 'package:brain_tumr_detection_app/features/reports/presentation/view_model/reports_cubit.dart';
import 'package:brain_tumr_detection_app/foundations/validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../generated/l10n.dart';

class RejectingResultDialogWidget extends StatelessWidget {
  final Report report;
  const RejectingResultDialogWidget({super.key, required this.report});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ReportsCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      child: Form(
        key: cubit.dialogFormKey,
        child: BlocBuilder<ReportsCubit, ReportsState>(
          builder: (context, state) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                  label: S.of(context).tumorType,
                  hintText: S.of(context).tumorType,
                  controller: cubit.tumortypeController,
                  validator: (value) => checkFieldValidation(
                      fieldName: S.of(context).tumorType,
                      val: cubit.tumortypeController.text,
                      fieldType: ValidationType.text),
                ),
                48.toHeight,
                CustomButton(
                    raduis: 8.r,
                    width: 100.w,
                    isLoading: state is ViewReportLoading,
                    text: S.of(context).confirm,
                    onTap: () {
                      if (cubit.dialogFormKey.currentState!.validate()) {
                        cubit.viewReport(report, context);
                      }
                    })
              ],
            );
          },
        ),
      ),
    );
  }
}
