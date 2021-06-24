import 'package:flutter/cupertino.dart';

// class LoginModel {
//   User user;
//
//   LoginModel({this.user});
//
//   LoginModel.fromJson(Map<String, dynamic> json) {
//     user = json['user'] != null ? new User.fromJson(json['user']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.user != null) {
//       data['user'] = this.user.toJson();
//     }
//     return data;
//   }
//
//   static Map<String, dynamic> toLoginJson(
//       {@required String email, @required String password}) {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['email'] = email;
//     data['password'] = password;
//     return data;
//   }
// }

// class User {
//   String accessToken;
//   String tokenType;
//   int expiresIn;
//   Users users;
//   List<Null> recent;
//
//   User(
//       {this.accessToken,
//         this.tokenType,
//         this.expiresIn,
//         this.users,
//         this.recent});
//
//   User.fromJson(Map<String, dynamic> json) {
//     accessToken = json['access_token'];
//     tokenType = json['token_type'];
//     expiresIn = json['expires_in'];
//     users = json['user'] != null ? new Users.fromJson(json['user']) : null;
//     if (json['recent'] != null) {
//       recent = [];
//       json['recent'].forEach((v) {
//         recent.add((v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['access_token'] = this.accessToken;
//     data['token_type'] = this.tokenType;
//     data['expires_in'] = this.expiresIn;
//     if (this.users != null) {
//       data['user'] = this.users.toJson();
//     }
//     if (this.recent != null) {
//       data['recent'] = this.recent.map((v) => v).toList();
//     }
//     return data;
//   }
// }

// class Users {
//   int id;
//   String firstname;
//   String lastname;
//   String phone;
//   String country;
//   String type;
//   int active;
//   String email;
//   Null emailVerifiedAt;
//   String createdAt;
//   String updatedAt;
//   String balance;
//   String invite;
//   Null verified;
//   int customers;
//   String refid;
//   String point;
//
//   Users(
//       {this.id,
//         this.firstname,
//         this.lastname,
//         this.phone,
//         this.country,
//         this.type,
//         this.active,
//         this.email,
//         this.emailVerifiedAt,
//         this.createdAt,
//         this.updatedAt,
//         this.balance,
//         this.invite,
//         this.verified,
//         this.customers,
//         this.refid,
//         this.point});
//
//   Users.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     firstname = json['firstname'];
//     lastname = json['lastname'];
//     phone = json['phone'];
//     country = json['country'];
//     type = json['type'];
//     active = json['active'];
//     email = json['email'];
//     emailVerifiedAt = json['email_verified_at'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     balance = json['balance'];
//     invite = json['invite'];
//     verified = json['verified'];
//     customers = json['customers'];
//     refid = json['refid'];
//     point = json['point'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['firstname'] = this.firstname;
//     data['lastname'] = this.lastname;
//     data['phone'] = this.phone;
//     data['country'] = this.country;
//     data['type'] = this.type;
//     data['active'] = this.active;
//     data['email'] = this.email;
//     data['email_verified_at'] = this.emailVerifiedAt;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['balance'] = this.balance;
//     data['invite'] = this.invite;
//     data['verified'] = this.verified;
//     data['customers'] = this.customers;
//     data['refid'] = this.refid;
//     data['point'] = this.point;
//     return data;
//   }
// }

class LoginModel {
  Details details;
  String email,password;

  LoginModel({this.details,this.email,this.password});

  LoginModel.fromJson(Map<String, dynamic> json) {
    email = json ['email'];
    password = json['password'];
    details =
    json['details'] != null ? new Details.fromJson(json['details']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.details != null) {
      data['details'] = this.details.toJson();
    }
    return data;
  }

  static Map<String, dynamic> toLoginJson(
      {@required String email, @required String password}) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}

class Details {
  String accessToken;
  String tokenType;
  int expiresIn;
  User user;
  List<Null> recent;

  Details(
      {this.accessToken,
        this.tokenType,
        this.expiresIn,
        this.user,
        this.recent});

  Details.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['recent'] != null) {
      recent = [];
      json['recent'].forEach((v) {
        recent.add((v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    data['expires_in'] = this.expiresIn;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    if (this.recent != null) {
      data['recent'] = this.recent.map((v) => v).toList();
    }
    return data;
  }
}

class User {
  int id;
  String firstname;
  String lastname;
  String phone;
  String country;
  String type;
  int active;
  String email;
  Null emailVerifiedAt;
  String createdAt;
  String updatedAt;
  String balance;
  String invite;
  Null verified;
  int customers;
  String refid;
  String point;

  User(
      {this.id,
        this.firstname,
        this.lastname,
        this.phone,
        this.country,
        this.type,
        this.active,
        this.email,
        this.emailVerifiedAt,
        this.createdAt,
        this.updatedAt,
        this.balance,
        this.invite,
        this.verified,
        this.customers,
        this.refid,
        this.point});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    phone = json['phone'];
    country = json['country'];
    type = json['type'];
    active = json['active'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    balance = json['balance'];
    invite = json['invite'];
    verified = json['verified'];
    customers = json['customers'];
    refid = json['refid'];
    point = json['point'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['phone'] = this.phone;
    data['country'] = this.country;
    data['type'] = this.type;
    data['active'] = this.active;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['balance'] = this.balance;
    data['invite'] = this.invite;
    data['verified'] = this.verified;
    data['customers'] = this.customers;
    data['refid'] = this.refid;
    data['point'] = this.point;
    return data;
  }
}