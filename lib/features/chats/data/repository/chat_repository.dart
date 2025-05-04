import 'package:brain_tumr_detection_app/core/data/network_services/api_error_handler.dart';
import 'package:brain_tumr_detection_app/features/chats/data/models/get_all_conversations_request.dart';
import 'package:brain_tumr_detection_app/features/chats/data/models/get_all_coversation_response.dart';
import 'package:brain_tumr_detection_app/features/chats/data/models/get_all_messages_conversation_response.dart';
import 'package:brain_tumr_detection_app/features/chats/data/models/message.dart';
import 'package:brain_tumr_detection_app/features/chats/data/models/send_message_request.dart';
import 'package:brain_tumr_detection_app/features/chats/data/remote/chat_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChatRepository {
  ChatDataSource chatDataSource;

  ChatRepository(this.chatDataSource);

  Future<Either<ApiErrorModel, ConversationResponse>> getAllUserConversation(
      GetAllConversationsRequest request) async {
    try {
      final response = await chatDataSource.getUserConversations(request);
      return Right(response);
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  Future<Either<ApiErrorModel, GetAllMessagesConversationResponse>>
      getMessagesOfConversation(
          GetAllConversationsRequest request, int conversationId) async {
    try {
      final response = await chatDataSource.getMessagesOfConversation(
          request, conversationId);

      return Right(response);
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  Future<Either<ApiErrorModel, Message>> sendMessage(
      SendMessageRequest parameters) async {
    try {
      final response = await chatDataSource.sendMessage(parameters);
      return Right(response);
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
}
