import 'package:flutter/cupertino.dart';
import 'package:jaynetwork/network/api_result.dart';
import 'package:tailor_app/complete_tailor_verification/model.dart';
import 'package:tailor_app/error_handler/handler.dart';
import 'package:tailor_app/instance_helper/instances.dart';
import 'package:dio/dio.dart';

class CompleteTailorRepo {
  Future<ApiResponse<dynamic>> completeTailorAccount(
      {@required FormData map, @required String queryToken}) async {
    print('print query token repo:$queryToken');
    print('print formData map repo:$map');
    try {

      final response = await networkClient.makePostRequest(
          "complete?token=$queryToken", data: map);
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
}
