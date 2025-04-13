class Report {
  final String patientName;
  final String profileUrl;
  bool isViewed;

  Report({
    required this.patientName,
    required this.profileUrl,
    this.isViewed = false,
  });
}
