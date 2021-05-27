
class SignUpModel {
  String message;
  User user;
  String firstName,lastName,email,phone,accountType,country,password,cPassword;

  SignUpModel({
    this.message,
    this.user,this.country,
    this.accountType,this.firstName,this.lastName,
    this.email,this.cPassword,
    this.password,this.phone});

  SignUpModel.fromJson(Map<String, dynamic> json) {
    message = json['message']!= null ? json['message'] : null;
    firstName = json['firstname']!= null ? json['firstname'] : null;
    lastName = json['lastname']!= null ? json['lastname'] : null;
    email = json['email']!= null ? json['email'] : null;
    country = json['country']!= null ? json['country'] : null;
    accountType = json['type']!= null ? json['type'] : null;
    password = json['password']!= null ? json['password'] : null;
    phone = json['phone']!= null ? json['phone'] : null;
    cPassword = json['cpass']!= null ? json['cpass'] : null;
    user = json['user'] != null ? json['user'] : null;
  }

  static Map<String, dynamic> toJson(
      {User user,String message,String phone,
        String country,String accountType,String firstName,String lastName,
        String email, String password,String cPassword,}) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = message;
    data['firstname'] = firstName;
    data['lastname'] = lastName;
    data['phone'] = phone;
    data['country'] = country;
    data['type'] = accountType;
    data['email'] = email;
    data['password'] = password;
    data['cpass'] = cPassword;
    if (user != null) {
      data['user'] = user.toJson();
    }
    return data;
  }
}

class User {
  String accessToken;
  String tokenType;
  int expiresIn;

  User({this.accessToken, this.tokenType, this.expiresIn});

  User.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token']!= null ? json['access_token'] : null;
    tokenType = json['token_type']!= null ? json['token_type'] : null;
    expiresIn = json['expires_in']!= null ? json['expires_in'] : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    data['expires_in'] = this.expiresIn;
    return data;
  }
}
