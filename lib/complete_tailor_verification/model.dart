import 'dart:io';
import 'package:flutter/cupertino.dart';

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:tailor_app/utils/helper/helper.dart';

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
    @required String token,
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
    data['token'] = token;
    return data;
  }

  static Future<FormData> updateStoreImage({
    @required String token,
    @required String shopName,
    @required String cac,
    @required String shopAddress,
    @required String phone,
    @required String state,
    @required List<String> tags,
    @required String address,
    @required String fabrics,
    @required File logo,
  }) async {
    var byteData = logo.absolute;
    List<int> imageData = byteData.readAsBytesSync();
    MultipartFile multipartFile = new MultipartFile.fromBytes(
      imageData,
      filename: generateKey(15),
      contentType: MediaType("image", "jpg"),
    );

    FormData formData = FormData.fromMap({
      'shopname':shopName,
      'cac':cac,
      'shopaddress':shopAddress,
      'phone':phone,
      'state':state,
      'tags':tags,
      'address':address,
      'fabrics':fabrics,
      'logo':multipartFile,

    });
    return formData;
  }
}
