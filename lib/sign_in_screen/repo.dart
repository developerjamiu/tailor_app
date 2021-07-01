import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:jaynetwork/network/api_result.dart';
import 'package:tailor_app/error_handler/handler.dart';
import 'package:tailor_app/instance_helper/instances.dart';
import 'model.dart';


class LoginApiRepository {
  Future<dynamic> loginUser({@required Map map}) async {
    try {
      print('running');
      final _response =
      await networkClient.makePostRequest('login', data: map);
      print('print responses: $_response');
      final _finalData = LoginModel.fromJson(_response.data);
      print('repo calls $_response');

      preferencesHelper.saveValue(key: 'firstname', value: _finalData.details.user.firstname);
      preferencesHelper.saveValue(key: 'email', value: _finalData.details.user.email);
      preferencesHelper.saveValue(key: 'verified', value: _finalData.details.user.verified);
      preferencesHelper.saveValue(key: 'login_token', value: _finalData.details.accessToken);
      print('printing m..f..ing ${_finalData.details.user.firstname}');
      print('printing m..f..ing ${_finalData.details.user.email}');
      print('printing m..f..ing ${_finalData.details.accessToken} token');
      print('printing m..f..ing ${_finalData.details.user.type} type');
      print('printing m..f..ing ${_finalData.details.user.verified} verified');

      return ApiResponse.success(
          statusMessage: _response.statusMessage,
          data: _finalData,
          statusCode: _response.statusCode);
    } catch (e) {
      return handleNetworkException(e);
    }
  }
}