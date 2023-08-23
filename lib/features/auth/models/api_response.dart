import 'dart:convert';

ApiResponse apiResponseFromJson(String str) => ApiResponse.fromJson(json.decode(str));

String apiResponseToJson(ApiResponse data) => json.encode(data.toJson());

class ApiResponse {
  int status;
  String message;
  var data;

  ApiResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
    status: json["status"],
    message: json["message"],
    data: json["data"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data,
  };
}
