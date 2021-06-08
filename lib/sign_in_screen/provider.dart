import 'package:flutter/cupertino.dart';
import 'package:jaynetwork/network/network_exceptions.dart';
import 'package:tailor_app/instance_helper/instances.dart';
import 'package:tailor_app/sign_in_screen/repo.dart';
import 'package:tailor_app/utils/page_route/navigator.dart';

LoginApiRepository _repository = LoginApiRepository();

class SignInProvider extends ChangeNotifier {
  BuildContext _context;
  String userToken;
  String errorMsg='Login Failed';

  void initialize(BuildContext context) {
    this._context = context;
  }

  void loginUser({String email,String password}) async {
    try {
      print('whatever');
      final _response = await _repository.loginUser(email: email,password: password);
      print('printing ${_response.toString()}');
      _response.when(success: (success, _, statusMessage) async {
        print('whatever again');
        showToast(this._context, message: 'Login Successful.');
        PageRouter.gotoNamed(Routes.DASHBOARD, _context);
        notifyListeners();
      }, failure: (NetworkExceptions error, _, statusMessage) async {
        print('oshodu');
        errorMsg=error.toString();
        notifyListeners();
        showToast(
            this._context, message: error.toString());
        notifyListeners();
      });
    } catch (e) {
      // print(e.toString());
      showToast(_context, message: errorMsg);
    }
  }
}

