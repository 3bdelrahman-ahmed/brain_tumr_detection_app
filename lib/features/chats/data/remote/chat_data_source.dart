import 'package:brain_tumr_detection_app/features/chats/data/models/get_all_conversations_request.dart';
import 'package:brain_tumr_detection_app/features/chats/data/models/get_all_coversation_response.dart';
import 'package:brain_tumr_detection_app/features/chats/data/models/get_all_messages_conversation_response.dart';
import 'package:brain_tumr_detection_app/features/chats/data/models/message.dart';
import 'package:brain_tumr_detection_app/features/chats/data/models/send_message_request.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/data/network_services/api_service.dart';
import '../../../../foundations/app_urls.dart';

@injectable
class ChatDataSource {
  Future<ConversationResponse> getUserConversations(
      GetAllConversationsRequest request) async {
    final response = await AppDio()
        .get(path: AppUrls.getUserChats, queryParams: request.toJson());
    return ConversationResponse.fromJson(response.data);
  }

  Future<GetAllMessagesConversationResponse> getMessagesOfConversation(
      GetAllConversationsRequest request, int conversationId) async {
    final response = await AppDio().get(
        path: "${AppUrls.getUserConversationMessage}$conversationId",
        queryParams: request.toJson());

    return GetAllMessagesConversationResponse.fromJson(response.data);
  }

  Future<Message> sendMessage(SendMessageRequest message) async {
    final response =
        await AppDio().post(path: AppUrls.sendMessage, data: message.toJson());
    return Message.fromJson(response.data);
  }
}
