import 'package:bloc/bloc.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/toast_string_extenstion.dart';
import 'package:brain_tumr_detection_app/features/contact_us/data/models/contact_us_model.dart';
import 'package:brain_tumr_detection_app/features/contact_us/data/repo/contact_us_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../generated/l10n.dart';

part 'contact_us_state.dart';

@injectable
class ContactUsCubit extends Cubit<ContactUsState> {
  final ContactUsRepository repository;
  ContactUsCubit({required this.repository}) : super(ContactUsInitial());

  TextEditingController message = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> sendMessage(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      emit(ContactUsLoading());
      final response = await repository
          .sendMessage(ContactUsRequestModel(message: message.text));
      response.fold(
        (error) => emit(ContactUsError()),
        (success) {
          S.of(context).sucessOpertation.showToast();
          Navigator.pop(context);
          emit(ContactUsSuccess());
        },
      );
    }
  }
}
