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
