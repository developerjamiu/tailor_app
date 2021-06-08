import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:jaynetwork/network/api_result.dart';
import 'package:jaynetwork/network/network_exceptions.dart';
import 'package:tailor_app/error_handler/handler.dart';
import 'package:tailor_app/instance_helper/instances.dart';
import 'package:tailor_app/sign_up_screen/model.dart';

import 'model.dart';


class LoginApiRepository {
  Future<dynamic> loginUser({String email,String password}) async {
    final map={
      "email":email,
      "password":password
    };
    try {
      print('running');
      print('Print $email and $password');
      final _response =
      await networkClient.makePostRequest('login', data: map);
      print('print response: $_response');
      final _finalData = LoginModel.fromJson(_response.data);
      print('repo calls $_response');

      preferencesHelper.saveValue(key: 'firstname', value: _finalData.details.user.firstname);
      preferencesHelper.saveValue(key: 'email', value: _finalData.details.user.email);
      print('printing m..f..ing ${_finalData.details.user.firstname}');
      print('printing m..f..ing ${_finalData.details.user.email}');
      print('printing m..f..ing ${_finalData.details.user.type} type');

      return ApiResponse.success(
          statusMessage: _response.statusMessage,
          data: _finalData,
          statusCode: _response.statusCode);
    } catch (e) {
      return handleNetworkException(e);
    }
  }
}