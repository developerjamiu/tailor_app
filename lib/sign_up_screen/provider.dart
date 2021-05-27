//
// import 'package:flutter/cupertino.dart';
// import 'package:jaynetwork/network/network_exceptions.dart';
// import 'package:tailor_app/instance_helper/instances.dart';
// import 'package:tailor_app/otp/otp_screen.dart';
// import 'package:tailor_app/sign_up_screen/repo.dart';
// import 'package:tailor_app/tailor_category/tailor_category_screen.dart';
// import 'package:tailor_app/utils/page_route/navigator.dart';
//
// final SignUpApiRepository _repository = SignUpApiRepository();
//
// class SignUpProviders extends ChangeNotifier {
//   BuildContext _context;
//   // CustomProgressIndicator _progressIndicator;
//   String _statusMessage;
//
//   void init(BuildContext context) {
//     this._context = context;
//     // this._progressIndicator = CustomProgressIndicator(this._context);
//   }
//
//   void signUp({@required Map map}) async {
//     try {
//       final _response = await _repository.signUp(data: map);
//       _response.when(success: (success, _, message) async {
//         showToast(this._context, message: 'SignUp Successful.');
//         Navigator.of(_context).pushReplacementNamed(Routes.DASHBOARD);
//         notifyListeners();
//       }, failure: (NetworkExceptions error, int statusCode,
//           String statusMessage) async {
//         showToast(this._context,
//             message: NetworkExceptions.getErrorMessage(error));
//         _statusMessage=statusMessage;
//         notifyListeners();
//       });
//     } catch (e) {
//       showToast(_context, message: e.toString());
//     }
//   }
// }

import 'dart:async';
import 'dart:convert';
import 'package:tailor_app/utils/app_url.dart';
import 'package:tailor_app/utils/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:tailor_app/sign_up_screen/model.dart';


enum Status {
  NotLoggedIn,
  NotRegistered,
  LoggedIn,
  Registered,
  Authenticating,
  Registering,
  LoggedOut
}

class SignUpProviders with ChangeNotifier {

  Status _loggedInStatus = Status.NotLoggedIn;
  Status _registeredInStatus = Status.NotRegistered;

  Status get loggedInStatus => _loggedInStatus;
  Status get registeredInStatus => _registeredInStatus;
  var response;

  Future<Map<String, dynamic>> register(
      String email, String password,
      String passwordConfirmation,
      String firstName,
      String lastName,
      String country,
      String accountType,
      String phone,
      ) async {

    final Map<String, dynamic> registrationData = {

        "firstname":firstName,
        "lastname":lastName,
        "country":country,
        "type":accountType,
        "phone":phone,
        "email":email,
        "password":password,
        "cpass":passwordConfirmation
    };


    _registeredInStatus = Status.Registering;
    notifyListeners();
    print('jhgyjtgug');
    return await http.post(AppUrl.register,
        body: json.encode(registrationData),
        headers: {'Content-Type': 'application/json'})
        .then(onValue)
        .catchError(onError);
  }

  Future<FutureOr> onValue(response) async {
    var result;
    final Map<String, dynamic> responseData = json.decode(response.body);

    if (response.statusCode == 200) {

      var userData = responseData[''];

      SignUpModel authUser = SignUpModel.fromJson(userData);

      UserPreferences().saveSignUpUser(authUser);
      result = {
        'status': true,
        'message': 'Registration Success!',
      };
    } else {

      result = {
        'status': false,
        'message': 'Registration failed',
      };
    }

    return result;
  }

  static onError(error) {
    print("the error is $error.detail");
    return {'message': 'Unsuccessful Request', 'data': error};
  }

}

