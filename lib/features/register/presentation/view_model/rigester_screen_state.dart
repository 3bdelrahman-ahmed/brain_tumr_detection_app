import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
sealed class RigesterScreenState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class RigesterScreenInitial extends RigesterScreenState {}

final class RigesterScreenChangeForm extends RigesterScreenState {
  final int index;

  RigesterScreenChangeForm({required this.index});

  @override
  List<Object?> get props => [index];
}

final class RigesterScreenUpdateScreen extends RigesterScreenState {}

final class RigesterScreenLoadingState extends RigesterScreenState {}

final class RigesterScreenErrorState extends RigesterScreenState {}

final class RigesterScreenSuccessState extends RigesterScreenState {}

final class ClearAuthFieldsState extends RigesterScreenState {}

final class SelectGenderState extends RigesterScreenState {
  final String gender;

  SelectGenderState({required this.gender});

  @override
  List<Object?> get props =>
      [gender]; // Ensure equality checks are based on gender
}
