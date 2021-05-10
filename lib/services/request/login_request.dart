class LoginRequest {
  String cipherText;

  LoginRequest({this.cipherText});

  LoginRequest.fromJson(Map<String, dynamic> json) {
    cipherText = json['cipherText'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cipherText'] = this.cipherText;
    return data;
  }
}