
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:jaynetwork/network/api_result.dart';
import 'package:tailor_app/error_handler/handler.dart';
import 'package:tailor_app/instance_helper/instances.dart';

import 'model.dart';

class TailorCategoryRepo{

  CategoryModel categoryModel;
  TailorCategoryRepo({this.categoryModel});

  Future<ApiResponse<dynamic>> tailorCategory({@required String queryToken})
  async{

    try {
      print('printing token on category $queryToken');
      final response = await tailorNetworkClient.makeGetRequest(
          "category?token=$queryToken");
      print('printing boomba $response');
      final decodedData = jsonDecode(response.data);
      final _finalData = CategoryModel.fromJson(response.data);
      print('printing final data $_finalData');
      // print("printing the final data:${_finalData.category}");

      // categoryModel =_finalData;
      return ApiResponse.success(
          statusCode: response.statusCode,
          data: _finalData,
          statusMessage: response.statusMessage);
    } catch (e) {
      return handleNetworkException(e);
    }
  }
}