enum AppointmentStatus {
  cancelled,
  completed,
  pending,
}

AppointmentStatus fromString(String? value) {
  switch (value?.toLowerCase()) {
    case 'cancelled':
      return AppointmentStatus.cancelled;
    case 'completed':
      return AppointmentStatus.completed;
    default:
      return AppointmentStatus.pending;
  }
}
