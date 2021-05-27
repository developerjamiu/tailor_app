
import 'package:flutter/cupertino.dart';
import 'package:jaynetwork/network/api_result.dart';
import 'package:jaynetwork/network/network_exceptions.dart';
import 'package:tailor_app/instance_helper/instances.dart';

import 'model.dart';

class SignUpApiRepository {
  Future<ApiResponse<dynamic>> signUp({@required Map data}) async {
    try {
      print('inside here');
      final response =
      await networkClient.makePostRequest("register", data: data);
      print(response);
      return ApiResponse.success(data: SignUpModel.fromJson(response.data));
    } catch (e) {
      return ApiResponse.failure(error: NetworkExceptions.handleResponse(e));
    }
  }
}
