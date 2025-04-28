import 'package:bloc/bloc.dart';
import 'package:brain_tumr_detection_app/features/doctors/data/repository/reviews_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../data/models/review.dart';
import '../../data/models/reviews_model.dart';

part 'show_doctors_state.dart';

@injectable
class ShowDoctorsCubit extends Cubit<ShowDoctorsState> {
  ReviewsRepository repository;

  ShowDoctorsCubit(this.repository) : super(ShowDoctorsInitial()) {
    fetchReviews();
  }

  void fetchReviews() async {
    emit(ShowDoctorsLoading());
    try {
      // Simulate network delay
      await Future.delayed(Duration(seconds: 1));

      final List<Reviews> reviews = [
        Reviews(
          id: 1,
          profileImage: "https://via.placeholder.com/150",
          patientName: "Emily Thompson",
          rating: 4.5,
          comment:
              "I can't thank Dr. Sarah Williams enough for the care and attention I received throughout my diagnosis and treatment. they made me feel heard an...",
        ),
        Reviews(
          id: 2,
          profileImage: "",
          patientName: "James Walker",
          rating: 3.2,
          comment:
              "Dr. Sarah Williams exceeded all my expectations. She carefully reviewed...",
        ),
        Reviews(
          id: 3,
          profileImage: "",
          patientName: "James Walker",
          rating: 2.7,
          comment:
              "Dr. Sarah Williams exceeded all my expectations. She carefully reviewed...",
        ),
        Reviews(
          id: 4,
          profileImage: "",
          patientName: "James Walker",
          rating: 4.1,
          comment:
              "Dr. Sarah Williams exceeded all my expectations. She carefully reviewed...",
        ),
      ];

      emit(ShowDoctorsLoaded(reviews));
    } catch (e) {
      emit(ShowDoctorsError("Failed to load reviews"));
    }
  }
}
