import 'package:flutter/cupertino.dart';
import 'package:jaynetwork/network/network_exceptions.dart';
import 'package:tailor_app/instance_helper/instances.dart';
import 'package:tailor_app/sign_in_screen/repo.dart';
import 'package:tailor_app/utils/page_route/navigator.dart';
import 'package:tailor_app/widget/progress.dart';

LoginApiRepository _loginRepository = LoginApiRepository();

class SignInProvider extends ChangeNotifier {
  BuildContext _context;
  String userToken;
  String errorMsg='Login Failed';
  CustomProgressIndicator _progressIndicator;

  void initialize(BuildContext context) {
    this._context = context;
    this._progressIndicator = CustomProgressIndicator(this._context);
  }

  void loginUser({@required Map map}) async {
    try {
      _progressIndicator.show();
      final _response = await _loginRepository.loginUser(map: map);
      print('printing first response: $_response');
      _response.when(success: (success, _, statusMessage) async {
        print('printing second response: $_response');
        await _progressIndicator.dismiss();
        showToast(this._context, message: 'Login Successful.');
        PageRouter.gotoNamed(Routes.DASHBOARD, _context);
        notifyListeners();
      }, failure: (NetworkExceptions error, int statusCode,
          String statusMessage) async {
        await _progressIndicator.dismiss();
        print('printing response error: $_response');
        showToast(
            this._context, message: NetworkExceptions.getErrorMessage(error));
        notifyListeners();
      });
    } catch (e) {
      await _progressIndicator.dismiss();
      showToast(_context, message: errorMsg);
    }
  }
}

