
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
    message = json['message'];
    firstName = json['firstname'];
    lastName = json['lastname'];
    email = json['email'];
    country = json['country'];
    accountType = json['type'];
    phone = json['phone'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

   static Map<String, dynamic> toJson(
      {String phone,
        String country,String accountType,String firstName,String lastName,
        String email, String password,String cPassword}) {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['firstname'] = firstName;
    data['lastname'] = lastName;
    data['phone'] = phone;
    data['country'] = country;
    data['type'] = accountType;
    data['email'] = email;
    data['password'] = password;
    data['cpass'] = cPassword;
    // if (user != null) {
    //   data['user'] = user.toJson();
    // }
    return data;
  }
}

class User {
  String accessToken;
  String tokenType;
  int expiresIn;

  User({this.accessToken, this.tokenType, this.expiresIn});

  User.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    data['expires_in'] = this.expiresIn;
    return data;
  }
}
