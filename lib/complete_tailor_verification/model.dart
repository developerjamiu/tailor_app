import 'dart:io';
import 'package:flutter/cupertino.dart';

class CompleteTailorModel {
  String message;

  CompleteTailorModel({this.message});

  CompleteTailorModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    return data;
  }

  static Map<String, dynamic> completeToJson({
    // @required String token,
    @required String shopName,
    @required String cac,
    @required String shopAddress,
    @required String phone,
    @required String state,
    @required List<String> tags,
    @required String address,
    @required String fabrics,
    @required var file,
  }) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shopname'] = shopName;
    data['cac'] = cac;
    data['shopaddress'] = shopAddress;
    data['phone'] = phone;
    data['state'] = state;
    data['tags'] = tags;
    data['address'] = address;
    data['fabrics'] = fabrics;
    data['logo'] = file;
    return data;
  }
}