import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import 'package:brain_tumr_detection_app/features/chats/presentation/view_model/chats_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../../../../../core/components/widgets/custom_app_shimmer.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../core/utils/theme/colors/app_colors.dart';
import '../widgets/chat_tile.dart';

class ChatListScreen extends StatefulWidget {
  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ChatsCubit>().loadConversations(refresh: true);
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChatsCubit>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          S.of(context).messages,
          style: AppTextStyles.font20BlueW700,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        surfaceTintColor: Colors.white,
        scrolledUnderElevation: 0,
        foregroundColor: AppColors.buttonsAndNav,
      ),
      body: BlocBuilder<ChatsCubit, ChatsState>(
        builder: (context, state) {
          if (state is ChatsLoading) {
            return Column(
              children: [
                _chatShimmer(),
                10.toHeight,
                _chatShimmer(),
                10.toHeight,
                _chatShimmer()
              ],
            );
          } else if (cubit.chats.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LottieBuilder.asset(
                    "assets/lotties/chats.json",
                    width: 175.w,
                    height: 175.w,
                    fit: BoxFit.cover,
                    repeat: true,
                    animate: true,
                  ),
                  Text(
                    S.of(context).youDontHaveChatsYet,
                    style: AppTextStyles.font16BlueW700,
                  )
                ],
              ),
            );
          } else
            return ListView.builder(
              padding: EdgeInsets.only(top: 10.h),
              itemCount: cubit.chats.length,
              itemBuilder: (context, index) {
                return ChatTile(chat: cubit.chats[index]);
              },
            );
        },
      ),
    );
  }
}

Widget _chatShimmer() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CustomAppShimmer(
        child: CircleAvatar(
          radius: 20.r,
        ),
      ),
      10.toWidth,
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppShimmer(
            height: 20.h,
            width: 100.w,
          ),
          10.toHeight,
          CustomAppShimmer(
            height: 10.h,
            width: 60.w,
          )
        ],
      ),
      Spacer(),
      CustomAppShimmer(
        height: 10.h,
        width: 30.w,
      )
    ],
  ).paddingSymmetric(horizontal: 15.w, vertical: 20.h);
}
