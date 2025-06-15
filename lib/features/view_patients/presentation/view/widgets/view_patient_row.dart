import 'package:brain_tumr_detection_app/core/config/app_routing.dart';
import 'package:brain_tumr_detection_app/core/utils/assets/assets_svg.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/image_extentions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/navigation_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/components/widgets/custom_button.dart';
import '../../../../../core/components/widgets/custom_image_view.dart';
import '../../../../../core/helper/functions/convert_time_slot_function.dart';
import '../../../../../core/utils/responsive_helper.dart';
import '../../../../../core/utils/theme/text_styles/app_text_styles.dart';
import '../../../../../foundations/app_constants.dart';
import '../../../../../generated/l10n.dart';
import '../../../../chats/data/models/chat_preview.dart';
import '../../../../chats/data/models/get_all_coversation_response.dart';
import '../../../data/model/view_patient_response_model/view_patient_response_model.dart';
import '../../view_model/cubit/view_patients_cubit.dart';

class ViewPatientRow extends StatelessWidget {
  final ViewPatientResponseModel viewPatientResponseModel;

  const ViewPatientRow({Key? key, required this.viewPatientResponseModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        patientTime(viewPatientResponseModel: viewPatientResponseModel),
        10.toWidth,
        Expanded(
            child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 6,
                spreadRadius: 2,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(100.r)),
                    child: CustomImageView(
                      width: 50.w,
                      height: 50.w,
                      url: AppConstants.user?.profilePicture,
                      fit: BoxFit.cover,
                    ),
                  ),
                  15.toWidth,
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  width: 120.w,
                                  child: Text(
                                    viewPatientResponseModel
                                            .patient!.fullName ??
                                        '',
                                    style: AppTextStyles.font12GreenW700,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  )),
                              // Text(
                              //   viewPatientResponseModel.patient!.gender ?? "Female",
                              //   style: AppTextStyles.font12BlueW700,
                              // ),
                            ],
                          ),
                          // 20.toWidth,
                          // Text("${viewPatientResponseModel.startTime} ${S.of(context).session}",
                          //     style: AppTextStyles.font12GreyW500),
                        ],
                      ),
                      // ResponsiveHelper.isTablet(context) ? 40.toHeight : 20.toHeight,
                    ],
                  )
                ],
              ),
              BlocBuilder<ViewPatientsCubit, ViewPatientsState>(
                builder: (context, state) {
                  return PositionedDirectional(
                    bottom: -18.h,
                    end: 15.w,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomButton(
                          // isLoading: state is GetConversationIdLoading,
                          text: S.of(context).chat,
                          onTap: () async {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: AppColors.background,
                              content: Text(
                                "${S.of(context).preparingChatWith}${viewPatientResponseModel.patient!.fullName} .....",
                                style: AppTextStyles.font16GreenW400,
                              ),
                            ));
                            context
                                .read<ViewPatientsCubit>()
                                .getConversationId(viewPatientResponseModel
                                    .patient!.id
                                    .toString())
                                .then((conversationId) {
                              print('Conversation ID: $conversationId');
                              context.navigateTo(AppRoutes.chatsScreen,
                                  arguments: ChatPreview(
                                      chatId: conversationId ?? 0,
                                      name: viewPatientResponseModel
                                              .patient!.fullName ??
                                          '',
                                      time: DateTime.now(),
                                      message: '',
                                      user: User(
                                        userName: viewPatientResponseModel
                                                .patient!.userName ??
                                            '',
                                        id: viewPatientResponseModel.patient!.id
                                            .toString(),
                                        fullName: viewPatientResponseModel
                                                .patient!.fullName ??
                                            '',
                                        profilePicture: viewPatientResponseModel
                                            .patient!.profilePicture,
                                      )));
                            });
                          },
                          height: 30.h,
                          backgroundColor: AppColors.typography,
                          textStyle: AppTextStyles.font12WhiteW500,
                          width: ResponsiveHelper.isTablet(context)
                              ? 120.h
                              : 100.h,
                        ),
                        ResponsiveHelper.isTablet(context)
                            ? 7.toWidth
                            : 7.toWidth,
                        CustomButton(
                          text: S.of(context).cancel,
                          onTap: () {},
                          height: 30.h,
                          backgroundColor: AppColors.red,
                          textStyle: AppTextStyles.font12WhiteW500,
                          width: ResponsiveHelper.isTablet(context)
                              ? 120.h
                              : 100.h,
                        )
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        )),
      ],
    ).paddingSymmetric(horizontal: 10.w, vertical: 5.h);
  }
}

class patientTime extends StatelessWidget {
  const patientTime({
    super.key,
    required this.viewPatientResponseModel,
  });

  final ViewPatientResponseModel viewPatientResponseModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomImageView(
          svgPath: AssetsSvg.clock2.toSVG(),
        ),
        Text(
          '${formatTimeTo24Hour(viewPatientResponseModel.startTime ?? '').split(' ')[0]}\n${formatTimeTo24Hour(viewPatientResponseModel.startTime ?? '').split(' ')[1]}',
          style: AppTextStyles.font12GreenW700,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
