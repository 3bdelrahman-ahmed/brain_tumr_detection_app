import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'feed_state.dart';
@injectable 
class FeedCubit extends Cubit<FeedState> {
  FeedCubit() : super(FeedInitial());

  final ScrollController feedScrollController =  ScrollController();

}
