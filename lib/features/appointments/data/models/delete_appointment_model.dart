class DeleteAppointmentRequestModel {
  final int appointmentId;

  DeleteAppointmentRequestModel({required this.appointmentId});
}

class DeleteAppointmentResponseModel {
  final String message;

  DeleteAppointmentResponseModel.fromJson(Map<String, dynamic> json)
      : message = json['message'];
}
