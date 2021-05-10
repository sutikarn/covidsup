class LoginReponse {
  String tokenType;
  String accessToken;
  String refreshToken;
  int expiredIn;

  LoginReponse(
      {this.tokenType, this.accessToken, this.refreshToken, this.expiredIn});

  LoginReponse.fromJson(Map<String, dynamic> json) {
    tokenType = json['tokenType'];
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    expiredIn = json['expiredIn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tokenType'] = this.tokenType;
    data['accessToken'] = this.accessToken;
    data['refreshToken'] = this.refreshToken;
    data['expiredIn'] = this.expiredIn;
    return data;
  }
}