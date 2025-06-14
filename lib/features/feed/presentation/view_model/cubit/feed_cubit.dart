import 'package:bloc/bloc.dart';
import 'package:brain_tumr_detection_app/features/feed/data/models/comments_model.dart';
import 'package:brain_tumr_detection_app/features/feed/data/models/posts_response_model.dart';
import 'package:brain_tumr_detection_app/features/feed/data/models/toggle_save_model.dart';
import 'package:brain_tumr_detection_app/features/feed/data/repo/feed_repository.dart';
import 'package:brain_tumr_detection_app/foundations/app_constants.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../../../data/models/add_comments_model.dart';
import '../../../data/models/delete_comment_model.dart';
import '../../../data/models/delete_post_model.dart';
import '../../../data/models/toggle_like_model.dart';
part 'feed_state.dart';

@singleton
class FeedCubit extends Cubit<FeedState> {
  final FeedRepository repository;

  FeedCubit({required this.repository}) : super(FeedInitial());

  final ScrollController feedScrollController = ScrollController();

  PostsResponseModel? posts;
  bool isFabOpen = false;

  int cursor = 0;

  Future<void> fetchFeed() async {
    posts = null; // Reset posts to fetch fresh data
    cursor = 0; // Reset cursor to start from the beginning
    emit(FeedLoading());
    final result = await repository
        .getPosts(PostsRequestModel(cursor: posts?.nextCursor ?? cursor));
    result.fold(
      (error) {
        emit(FeedError());
      },
      (feed) {
        posts = feed;
        emit(FeedLoaded());
      },
    );
  }

  final ScrollController scrollController = ScrollController();

  // fetch more posts when the user scrolls to the bottom using cursor write new fn
  Future<void> fetchMorePosts() async {
    if (posts == null || posts!.nextCursor == 0) return;

    emit(FeedLoading());

    final result = await repository.getPosts(PostsRequestModel(
      cursor: posts!.nextCursor!,
    ));

    result.fold(
      (error) {
        emit(FeedError());
      },
      (feed) {
        // Stop if no new posts or same cursor returned
        if (feed.posts == null ||
            feed.posts!.isEmpty ||
            feed.nextCursor == posts!.nextCursor) {
          posts!.nextCursor = 0; // No more pages
          emit(FeedLoaded());
          return;
        }

        posts!.posts!.addAll(feed.posts!);
        posts!.nextCursor = feed.nextCursor;
        emit(FeedLoaded());
      },
    );
  }

// singleR listeners

  Future<void> onPostUpdates(List<dynamic>? arguments) async {
    if (arguments == null || arguments.isEmpty) return;

    try {
      final messageData = arguments[0] as Map<String, dynamic>;

      final postId = messageData['postId'];
      final likesCount = messageData['likesCount'];
      final commentsCount = messageData['commentsCount'];

      final index = posts!.posts!.indexWhere((post) => post.id == postId);

      if (index != -1) {
        final post = posts!.posts![index];
        post.commentsCount = commentsCount;
        post.likesCount = likesCount;
        posts!.posts![index] = post;

        emit(PostUpdated(postId: postId));
      }
    } catch (e) {
      print("Error parsing incoming message posts: $e");
    }
  }

  Future<void> toggleLikePost(String postId) async {
    // toggle it manualyfirt
    final index = posts!.posts!.indexWhere((p) => p.id == postId);
    if (index != -1) {
      posts!.posts![index].isLiked = !posts!.posts![index].isLiked!;
    }
    emit(FeedLoading());
    final result =
        await repository.toggleLike(ToggleLikeRequestModel(postId: postId));
    result.fold(
      (error) {
        emit(FeedError());
      },
      (post) {
        final index = posts!.posts!.indexWhere((p) => p.id == postId);
        if (index != -1) {
          posts!.posts![index].isLiked = post.isLiked;
        }
        emit(ToogleLikeSuccess(postId: postId, isLiked: post.isLiked!));
      },
    );
  }

  Future<void> toggleSavePost(String postId) async {
    // toggle it manualyfirt
    final index = posts!.posts!.indexWhere((p) => p.id == postId);
    if (index != -1) {
      posts!.posts![index].isSaved = !posts!.posts![index].isSaved!;
    }
    emit(ToogleSaveLoading());
    final result =
        await repository.toggleSave(ToggleSaveRequestModel(postId: postId));
    result.fold(
      (error) {
        emit(FeedError());
      },
      (post) {
        final index = posts!.posts!.indexWhere((p) => p.id == postId);
        if (index != -1) {
          posts!.posts![index].isSaved = post.isSaved;
        }
        emit(ToogleSaveSuccess(postId: postId, isSaved: post.isSaved!));
      },
    );
  }

  CommentsResponseModel? comments;
  List<Comment> postComments = [];
  Future<void> fetchPostComments(String postId) async {
    comments = null; // Reset comments to fetch fresh data
    postComments = []; // Reset post comments to fetch fresh data
    emit(CommmentsLoading());
    final result = await repository.fetchPostComments(
      CommentsRequestModel(cursor: comments?.nextCursor ?? 0, postId: postId),
    );
    result.fold(
      (error) {
        emit(CommmentsError());
      },
      (comments) {
        this.comments = comments;
        postComments = comments.data ?? [];
        emit(CommmentsLoaded());
      },
    );
  }

  Future<void> deleteComment(String commentId) async {
    emit(DeleteCommentLoading());
    final result = await repository.deleteComment(
      DeleteCommentRequestModel(commentId: commentId),
    );
    result.fold(
      (error) {
        emit(DeleteCommentError());
      },
      (response) {
        // Remove the comment from the postComments list
        postComments
            .removeWhere((comment) => comment.id.toString() == commentId);
        emit(DeleteCommentSuccess(commentId: response.commentId.toString()));
      },
    );
  }

  Future<void> openFabGroup() async {
    isFabOpen = !isFabOpen;
    emit(FabChangeState(isFabOpen));
  }

  // add comments logic
  TextEditingController commentController = TextEditingController();

  Future<void> addComment(String postId) async {
    if (commentController.text.trim().isEmpty) return;

    emit(AddCommentLoading());
    final result = await repository.addComment(
      AddCommentsRequestModel(
        postId: postId,
        comment: commentController.text.trim(),
      ),
    );
    result.fold(
      (error) {
        emit(AddCommentError());
      },
      (comment) {
        postComments.insert(
            0,
            Comment(
              id: comment.id,
              text: commentController.text,
              createdAt: DateTime.now().toIso8601String(),
              userId: AppConstants.user!.id,
              userName: AppConstants.user!.fullName,
              userProfilePicture: AppConstants.user!.profilePicture,
            ));

        emit(AddCommentSuccess(comment: comment.id.toString()));
        commentController.clear();
      },
    );
  }

  validateComment(String comment) {
    commentController.text = comment;
    emit(CommentTextChanged(commentController.text.trim().isNotEmpty));
  }

  Future<void> deletePost(String postId) async {
    emit(DeletePostLoading());
    final result = await repository.deletePost(
      DeletePostRequestModel(postId: postId),
    );
    result.fold(
      (error) {
        emit(DeletePostError());
      },
      (response) {
        posts!.posts!.removeWhere((post) => post.id == postId);
        emit(DeletePostSuccess(postId: response.postId.toString()));
      },
    );
  }


  // add post 
  TextEditingController postTitleController = TextEditingController();
  TextEditingController postContentController = TextEditingController();
}
