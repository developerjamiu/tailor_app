import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:jaynetwork/network/api_result.dart';
import 'package:tailor_app/complete_tailor_verification/model.dart';
import 'package:tailor_app/error_handler/handler.dart';
import 'package:tailor_app/instance_helper/instances.dart';
import 'package:dio/dio.dart';
import 'dart:io';
import 'package:http/http.dart' as http;


class CompleteTailorRepo{
Future<dynamic> completeTailorAccount({
  @required Map map,@required String queryToken}) async {

  print('print query token repo:$queryToken');
  print('print formData map repo:$map');
  final token = {
    'token': queryToken
  };
  try {
    FormData formData = FormData.fromMap(map);
    final response =
    await networkClient.makePostRequest("complete",
        data: formData,queryParameters:token,
        options: new Options(headers: {
          "Content-Disposition": "form-data",
          "Content-Type": "multipart/form-data",
        }));
    print('printing boomba $response');
    print('booomba formData $formData');
    final _finalData = CompleteTailorModel.fromJson(response.data);
    print('printing final data $_finalData');
    print("printint the final data:${_finalData.message}");
    return ApiResponse.success(
        statusCode: response.statusCode,
        data: _finalData,
        statusMessage: response.statusMessage);
  } catch (e) {
    return handleNetworkException(e);
    }
  }

}
