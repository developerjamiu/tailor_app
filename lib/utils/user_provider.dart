import 'package:flutter/cupertino.dart';
import 'package:tailor_app/sign_in_screen/model.dart';
import 'package:tailor_app/sign_up_screen/model.dart';

class UserSignUpProvider with ChangeNotifier {
  SignUpModel _user = SignUpModel();

  SignUpModel get user => _user;

  void setSignUpUser(SignUpModel user) {
    _user = user;
    notifyListeners();
  }
}

class UserLoginProvider with ChangeNotifier {
  LoginModel _loginModel = LoginModel();

  LoginModel get loginModel => _loginModel;

  void setLoginUser(LoginModel loginModel) {
    _loginModel = loginModel;
    notifyListeners();
  }
}