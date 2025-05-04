class GetAllConversationsRequest {
  final int pageSize;
  final int pageIndex;

  GetAllConversationsRequest({
    required this.pageSize,
    required this.pageIndex,
  });

  // Convert object to JSON map
  Map<String, dynamic> toJson() {
    return {
      'pageSize': pageSize,
      'pageIndex': pageIndex,
    };
  }

  // Create object from JSON map
  factory GetAllConversationsRequest.fromJson(Map<String, dynamic> json) {
    return GetAllConversationsRequest(
      pageSize: json['pageSize'] as int,
      pageIndex: json['pageIndex'] as int,
    );
  }
}
