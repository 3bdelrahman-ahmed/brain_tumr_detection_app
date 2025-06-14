part of 'feed_cubit.dart';

sealed class FeedState extends Equatable {
  const FeedState();

  @override
  List<Object> get props => [];
}

final class FeedInitial extends FeedState {}

final class FeedLoading extends FeedState {}

final class FeedLoadingMore extends FeedState {

}

final class FabChangeState extends FeedState {
  final bool isFabOpen;

  FabChangeState(this.isFabOpen);

  @override
  List<Object> get props => [isFabOpen];
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
final class FeedLoaded extends FeedState {}

final class FeedError extends FeedState {}

final class CommmentsLoading extends FeedState {}
final class CommmentsLoaded extends FeedState {
}
final class CommmentsError extends FeedState {}

class CommentTextChanged extends FeedState {
  final bool hasText;

  CommentTextChanged(this.hasText);
}


final class AddCommentLoading extends FeedState {}
final class AddCommentSuccess extends FeedState {
  final String comment;

  const AddCommentSuccess({required this.comment});

  @override
  List<Object> get props => [comment];
}
final class AddCommentError extends FeedState {

}


final class DeleteCommentLoading extends FeedState {}
final class DeleteCommentSuccess extends FeedState {
  final String commentId;

  const DeleteCommentSuccess({required this.commentId});

  @override
  List<Object> get props => [commentId];
}
final class DeleteCommentError extends FeedState {
 
}



final class DeletePostLoading extends FeedState {}
final class DeletePostSuccess extends FeedState {
  final String postId;

  const DeletePostSuccess({required this.postId});

  @override
  List<Object> get props => [postId];
}

final class DeletePostError extends FeedState {
 
}


final class AddPostLoading extends FeedState {}
final class AddPostSuccess extends FeedState {
  final String postId;

  const AddPostSuccess({required this.postId});

  @override
  List<Object> get props => [postId];
}
final class AddPostError extends FeedState {}
