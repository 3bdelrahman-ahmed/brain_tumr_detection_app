part of 'feed_cubit.dart';

sealed class FeedState extends Equatable {
  const FeedState();

  @override
  List<Object> get props => [];
}

final class FeedInitial extends FeedState {}

final class FeedLoading extends FeedState {}
final class FeedLoaded extends FeedState {

}
final class FeedError extends FeedState {

}


final class PostUpdated extends FeedState {
  final int postId;

  const PostUpdated({required this.postId});

  @override
  List<Object> get props => [postId,];
}



final class ToogleLikeLoading extends FeedState {

}
final class ToogleLikeSuccess extends FeedState {
  final String postId;
  final bool isLiked;

  const ToogleLikeSuccess({required this.postId, required this.isLiked});

  @override
  List<Object> get props => [postId, isLiked];
}

final class ToogleLikeError extends FeedState {

}


final class ToogleSaveLoading extends FeedState {

}
final class ToogleSaveSuccess extends FeedState {
  final String postId;
  final bool isSaved;

  const ToogleSaveSuccess({required this.postId, required this.isSaved});

  @override
  List<Object> get props => [postId, isSaved];
}

final class ToogleSaveError extends FeedState {

}