class GetDoctorRequestModel {
  int pageSize;
  int pageIndex;
  String search;
  double long;
  double lat;

  GetDoctorRequestModel({
    required this.pageSize,
    required this.pageIndex,
    required this.search,
    required this.long,
    required this.lat,
  });

  factory GetDoctorRequestModel.fromJson(Map<String, dynamic> json) {
    return GetDoctorRequestModel(
      pageSize: json['pageSize'],
      pageIndex: json['pageIndex'],
      search: json['search'],
      long: json['longitude'],
      lat: json['latitude'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pageSize': pageSize,
      'pageIndex': pageIndex,
      'search': search,
      'longitude': long,
      'latitude': lat,
    };
  }
}
