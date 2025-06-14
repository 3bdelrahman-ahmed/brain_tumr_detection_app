import 'package:brain_tumr_detection_app/core/components/widgets/custom_button.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_profile_image.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_welcome_row.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import 'package:brain_tumr_detection_app/features/feed/presentation/view_model/cubit/feed_cubit.dart';
import 'package:brain_tumr_detection_app/foundations/app_constants.dart';
import 'package:brain_tumr_detection_app/foundations/validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/theme/colors/app_colors.dart';
import '../../../../../generated/l10n.dart';

class AddPost extends StatelessWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<FeedCubit>();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // SliverPadding(padding: EdgeInsets.symmetric(vertical: 24.h)),
          CustomWelcomeAppBar(),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: EdgeInsets.all(20.r),
              child: BlocBuilder<FeedCubit, FeedState>(
                builder: (context, state) {
                  return Form(
                    key: cubit.addPostFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Post Input Field
                        Container(
                          padding: EdgeInsets.all(16.r),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CustomProfileImage(
                                    imageUrl: AppConstants.user!.profilePicture,
                                    size: 24.w,
                                  ),
                                  8.toWidth,
                                  Text(
                                    S.of(context).posst,
                                    style: AppTextStyles.font16BlueW700,
                                  ),
                                ],
                              ),
                              12.toHeight,
                              TextFormField(
                                controller: cubit.postTitleController,
                                minLines: 1,
                                maxLines: 1,
                                validator: (v) => checkFieldValidation(
                                    val: cubit.postTitleController.text,
                                    fieldName: S.of(context).posttitle,
                                    fieldType: ValidationType.text),
                                decoration: InputDecoration(
                                    fillColor: AppColors.typography,
                                    focusColor: AppColors.typography,
                                    hintStyle: AppTextStyles.font12GreyW500,
                                    hintText: S.of(context).posttitle,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: AppColors.typography,
                                          width: 1.5.w,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8.r))),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: AppColors.typography,
                                          width: 1.5.w,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8.r)))),
                              ),
                              10.toHeight,
                              TextFormField(
                                controller: cubit.postContentController,
                                minLines: 5,
                                maxLines: 100,
                                validator: (v) => checkFieldValidation(
                                    val: cubit.postContentController.text,
                                    fieldName: S.of(context).postContent,
                                    fieldType: ValidationType.text),
                                keyboardType: TextInputType.multiline,
                                decoration: InputDecoration(
                                    fillColor: AppColors.typography,
                                    focusColor: AppColors.typography,
                                    hintStyle: AppTextStyles.font12GreyW500,
                                    hintText: S.of(context).whatIsHappening,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: AppColors.typography,
                                          width: 1.5.w,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8.r))),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: AppColors.typography,
                                          width: 1.5.w,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8.r)))),
                              ),
                            ],
                          ),
                        ),
                        20.toHeight,
                        // Buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomButton(
                              text: S.of(context).cancel,
                              onTap: () {
                                Navigator.of(context, rootNavigator: true)
                                    .pop(); // Close the add post screen
                              },
                              width: 80.w,
                              raduis: 8.r,
                              height: 40.w,
                              backgroundColor: Colors.grey[300],
                              textStyle: AppTextStyles.font12BlueW500,
                            ),
                            CustomButton(
                              isLoading: state is AddPostLoading,
                              text: S.of(context).post,
                              onTap: () {
                                if (cubit.addPostFormKey.currentState!
                                    .validate()) {
                                  cubit.addPost(context);
                                }
                              },
                              width: 80.w,
                              raduis: 8.r,
                              height: 40.w,
                              textStyle: AppTextStyles.font12WhiteW500,
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
