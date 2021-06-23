import 'package:flutter/cupertino.dart';

class OtpModel {
  String message;
  User user;

  OtpModel({this.message, this.user});

  OtpModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }

  static Map<String, dynamic> otpToJson({
    String token,
    @required int otp,
    @required String ref,
  }) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ref'] = ref;
    data['otp'] = otp;
    data['token'] = token;
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
