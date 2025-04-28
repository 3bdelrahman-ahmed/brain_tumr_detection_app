import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
sealed class RigesterScreenState {}

final class RigesterScreenInitial extends RigesterScreenState {}

final class RigesterScreenChangeForm extends RigesterScreenState {
  final int index;

  RigesterScreenChangeForm({required this.index});
}

final class RigesterScreenUpdateScreen extends RigesterScreenState {}

final class RigesterScreenLoadingState extends RigesterScreenState {}

final class RigesterScreenErrorState extends RigesterScreenState {}

final class RigesterScreenSuccessState extends RigesterScreenState {}

final class ClearAuthFieldsState extends RigesterScreenState {}

final class SetClinicLiscenseState extends RigesterScreenState {}

final class SetDoctorLicenseState extends RigesterScreenState {
  final String fileName;

  SetDoctorLicenseState({required this.fileName});

  @override
  List<Object?> get props =>
      [fileName]; // Ensure equality checks are based on fileName
}

final class SelectGenderState extends RigesterScreenState {
  final String gender;

  SelectGenderState({required this.gender});

  @override
  List<Object?> get props =>
      [gender]; // Ensure equality checks are based on gender
}
