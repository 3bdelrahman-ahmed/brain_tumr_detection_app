import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import 'package:brain_tumr_detection_app/features/chats/data/models/send_message_request.dart';
import 'package:brain_tumr_detection_app/features/chats/presentation/view/widgets/custom_messages_text_field.dart';
import 'package:brain_tumr_detection_app/features/chats/presentation/view_model/chats_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/theme/colors/app_colors.dart';
import '../../../../../foundations/app_constants.dart';
import '../../../data/models/chat_preview.dart';
import '../../../data/models/message.dart'; // Add this import for Message type
import '../widgets/message_bubble.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({Key? key, required this.chat}) : super(key: key);
  final ChatPreview chat;

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> with SingleTickerProviderStateMixin {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  List<Message> _previousMessages = [];
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    final chatId = widget.chat.chatId;

    // Get messages from the cubit
    context.read<ChatsCubit>().getConversationMessages(chatId);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ChatsCubit>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.chat.name, style: AppTextStyles.font20BlueW700),
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.white,
        scrolledUnderElevation: 0,
        foregroundColor: AppColors.buttonsAndNav,
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocConsumer<ChatsCubit, ChatsState>(
              listener: (context, state) {
                // Handle new messages with animation
                if (state is! ChatsLoading && _previousMessages.length < cubit.allMessages.length) {
                  // If we have new messages
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    // Scroll to bottom when new message arrives
                    if (_scrollController.hasClients) {
                      _scrollController.animateTo(
                        0,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                      );
                    }
                  });
                }
                _previousMessages = List.from(cubit.allMessages);
              },
              builder: (context, state) {
                if (state is ChatsLoading) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.buttonsAndNav,
                    ),
                  );
                }

                return ListView.builder(
                  key: ValueKey<int>(cubit.allMessages.length), // Force rebuild when list changes
                  controller: _scrollController,
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                  reverse: true,
                  itemCount: cubit.allMessages.length,
                  itemBuilder: (context, index) {
                    final message = cubit.allMessages[index];
                    // Apply animation only to the newest message
                    final bool isNewestMessage = index == 0;

                    return AnimatedMessageBubble(
                      message: message,
                      profileUrl: widget.chat.user.profilePicture,
                      animate: isNewestMessage,
                    ).paddingSymmetric(vertical: 10.h);
                  },
                );
              },
            ),
          ),
          CustomMessagesTextField(
            controller: cubit.messageController,
            onSend: () {
              if (cubit.messageController.text.trim().isNotEmpty) {
                cubit.sendMessage(SendMessageRequest(
                  receiverId: widget.chat.user.id,
                  content: cubit.messageController.text,
                ));
              }
            },
          ),
        ],
      ),
    );
  }
}

// AnimatedMessageBubble to handle individual message animations
class AnimatedMessageBubble extends StatefulWidget {
  final Message message;
  final String? profileUrl;
  final bool animate;

  const AnimatedMessageBubble({
    Key? key,
    required this.message,
    this.profileUrl,
    this.animate = false,
  }) : super(key: key);

  @override
  State<AnimatedMessageBubble> createState() => _AnimatedMessageBubbleState();
}

class _AnimatedMessageBubbleState extends State<AnimatedMessageBubble> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    // Create fade animation
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.0, 0.7, curve: Curves.easeOut),
    ));

    final bool isMyMessage = AppConstants.user?.id == widget.message.senderId;
    _slideAnimation = Tween<Offset>(
      begin: isMyMessage ? Offset(0.3, 0.0) : Offset(-0.3, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.0, 0.8, curve: Curves.elasticOut),
    ));

    // Start animation if needed
    if (widget.animate) {
      _controller.forward();
    } else {
      _controller.value = 1.0; // Set to end value for older messages
    }
  }

  @override
  void didUpdateWidget(AnimatedMessageBubble oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Handle animation when props change
    if (widget.animate && !oldWidget.animate) {
      _controller.forward(from: 0.0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: MessageBubble(
              message: widget.message,
              profileUrl: widget.profileUrl,
            ),
          ),
        );
      },
    );
  }
}