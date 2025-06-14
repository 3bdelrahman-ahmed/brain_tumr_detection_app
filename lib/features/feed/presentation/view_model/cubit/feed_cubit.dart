import 'package:bloc/bloc.dart';
import 'package:brain_tumr_detection_app/features/feed/data/models/posts_response_model.dart';
import 'package:brain_tumr_detection_app/features/feed/data/repo/feed_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'feed_state.dart';

@injectable
class FeedCubit extends Cubit<FeedState> {
  final FeedRepository repository;

  FeedCubit({required this.repository}) : super(FeedInitial());

  final ScrollController feedScrollController = ScrollController();

  PostsResponseModel? posts;
  bool isFabOpen = false;

  Future<void> fetchFeed() async {
    emit(FeedLoading());
    final result = await repository
        .getPosts(PostsRequestModel(cursor: posts?.nextCursor ?? 0));
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

  void openFabGroup() {
    isFabOpen = !isFabOpen;
    emit(FabChangeState(isFabOpen));
  }
}
