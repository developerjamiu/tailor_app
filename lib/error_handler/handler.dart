import 'package:jaynetwork/network/api_result.dart';
import 'package:jaynetwork/network/network_exceptions.dart';
import 'package:tailor_app/sign_in_screen/model.dart';

import 'failed_model.dart';

ApiResponse<dynamic> handleNetworkException(e) {
  try {
    final _response = FailedOrNormalResponsesModel.fromJson(e.response.data);
    return ApiResponse.failure(
      error: NetworkExceptions.getJayNetworkException(e),
      statusMessage: _response.message,
    );
  } catch (_) {
    return ApiResponse.failure(
      error: NetworkExceptions.getJayNetworkException(e),
    );
  }
}
