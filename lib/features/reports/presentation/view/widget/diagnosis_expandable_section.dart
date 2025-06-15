import 'package:brain_tumr_detection_app/core/components/widgets/custom_button.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_text_field.dart';
import 'package:brain_tumr_detection_app/core/helper/functions/show_default_dialog_function.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/features/reports/data/model/doctor_reports_model.dart';
import 'package:brain_tumr_detection_app/features/reports/presentation/view_model/reports_cubit.dart';
import 'package:brain_tumr_detection_app/foundations/validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/theme/colors/app_colors.dart';
import '../../../../../core/utils/theme/text_styles/app_text_styles.dart';
import '../../../../../generated/l10n.dart';
import 'diagnosis_container.dart';
import 'rejecting_result_dialog_widget.dart';

class DiagnosisExpandableSection extends StatefulWidget {
  final Report report;
  const DiagnosisExpandableSection({Key? key, required this.report})
      : super(key: key);
  @override
  State<DiagnosisExpandableSection> createState() =>
      _DiagnosisExpandableSectionState();
}

class _DiagnosisExpandableSectionState
    extends State<DiagnosisExpandableSection> {
  bool isExpanded = false;
  @override
  void initState() {
    context.read<ReportsCubit>().resetControllers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ReportsCubit>();
    return BlocBuilder<ReportsCubit, ReportsState>(
      builder: (context, state) {
        return Column(
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
                    isExpanded ? Icons.expand_less : Icons.expand_more,
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
                    diagnosis: widget.report.detectionClass ?? "",
                  ),
                  DiagnosisContainer(
                    head: S.of(context).aiModelConfedence,
                    diagnosis: widget.report.confidence ?? "",
                  ),
                  Form(
                    key: cubit.formKey,
                    child: Column(
                      children: [
                        CustomTextField(
                            validator: (v) => checkFieldValidation(
                                val: cubit.findingsController.text,
                                fieldName: S.of(context).findings,
                                fieldType: ValidationType.text),
                            controller: cubit.findingsController,
                            subLabelStyle: AppTextStyles.font16GreenW400,
                            labelStyle: AppTextStyles.font14BlueW700,
                            subLabel: S
                                .of(context)
                                .pleaseWriteYourFindingsAboutThisResultKeepInMindThisWillBeShownToThePatient,
                            // hintTextStyle: AppTextStyles.font15GreenW700,
                            label: S.of(context).findings,
                            keyboardType: TextInputType.multiline,
                            minLines: 4,
                            maxLines: 150,
                            hintText: S.of(context).findings),
                        16.toHeight,
                        CustomTextField(
                            controller: cubit.reasoningController,
                            validator: (v) => checkFieldValidation(
                                val: cubit.reasoningController.text,
                                fieldName: S.of(context).reasoning,
                                fieldType: ValidationType.text),
                            subLabelStyle: AppTextStyles.font16GreenW400,
                            labelStyle: AppTextStyles.font14BlueW700,
                            subLabel: S
                                .of(context)
                                .inCaseOfRejectingTheResulOrAcceptItPleaseProvideYourReasoning,
                            // hintTextStyle: AppTextStyles.font15GreenW700,
                            label: S.of(context).reasoning,
                            keyboardType: TextInputType.multiline,
                            minLines: 4,
                            maxLines: 150,
                            hintText: S.of(context).reasoning),
                      ],
                    ).paddingSymmetric(horizontal: 15.w),
                  ),
                  24.toHeight,
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                            raduis: 8.r,
                            backgroundColor: AppColors.error,
                            text: S.of(context).reject,
                            onTap: () {
                              if (cubit.formKey.currentState!.validate()) {
                                showDefaultDialog(context,
                                    child: BlocProvider.value(
                                      value: cubit,
                                      child: RejectingResultDialogWidget(
                                        report: widget.report,
                                      ),
                                    ));
                              }
                            }),
                      ),
                      12.toWidth,
                      Expanded(
                          child: CustomButton(
                              isLoading: state is ViewReportLoading &&
                                  cubit.tumortypeController.text.trim().isEmpty,
                              raduis: 8.r,
                              backgroundColor: AppColors.typography,
                              text: S.of(context).accept,
                              onTap: () {
                                if (cubit.formKey.currentState!.validate()) {
                                  cubit.viewReport(widget.report, context);
                                }
                              }))
                    ],
                  )
                ],
              ),
              crossFadeState: isExpanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
            ),
          ],
        );
      },
    ).paddingSymmetric(vertical: 20.h, horizontal: 20.w);
  }
}
