import 'package:bloc/bloc.dart';
import 'package:brain_tumr_detection_app/features/feed/data/models/posts_response_model.dart';
import 'package:brain_tumr_detection_app/features/feed/data/models/toggle_save_model.dart';
import 'package:brain_tumr_detection_app/features/feed/data/repo/feed_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/toggle_like_model.dart';
part 'feed_state.dart';

@singleton
class FeedCubit extends Cubit<FeedState> {
  final FeedRepository repository;
  FeedCubit({required this.repository}) : super(FeedInitial());

  final ScrollController feedScrollController = ScrollController();

  PostsResponseModel? posts;

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
}
