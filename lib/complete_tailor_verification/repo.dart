import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:jaynetwork/network/api_result.dart';
import 'package:tailor_app/complete_tailor_verification/model.dart';
import 'package:tailor_app/error_handler/handler.dart';
import 'package:tailor_app/instance_helper/instances.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class CompleteTailorRepo {
  Future<dynamic> completeTailorAccount(
      {@required FormData map, @required String queryToken}) async {
    print('print query token repo:$queryToken');
    print('print formData map repo:$map');
    final token = {'token': queryToken};
    try {

      final response = await networkClient.makePostRequest("complete",
          data: map,
          queryParameters: token,
          options: new Options(contentType: "multipart/form-data"));
      print('printing boomba $response');
      print('booomba formData $map');
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

  Future<dynamic> completeTailorVerification(
      {Map map, String userToken}) async {
    print('In the split function');

    String baseUrl = "https://sizary.app/api/auth/complete?";

    try {
      var postUri = Uri.parse(baseUrl);
      FormData formData = FormData.fromMap(map);
      var request = await http.post(postUri, body: formData);
      // request.fields['token'] = Provider.of<LoginProviders>(context).userToken;
      request.headers['Content-Type'] = 'multipart/form-data';
      // request.fields['token'] = userToken;
      // request.files.add(await http.MultipartFile.fromPath('file', filePath));

      // var response = await request.send();
      if (request.statusCode == 200) {
        String jsonData = request.toString();
        print(jsonData);
        var decodedData = jsonDecode(jsonData);
        print(decodedData);
        String errorMessage = decodedData["message"] ?? null;
        if (errorMessage == null) {
          return decodedData;
        } else
          return "Failed";
      } else {
        print('failed');
        print(request.statusCode);
        return "Failed";
      }
    } catch (e) {
      print(e);
      return "Failed";
    }
  }
}
