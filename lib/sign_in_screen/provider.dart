import 'package:flutter/cupertino.dart';
import 'package:jaynetwork/network/network_exceptions.dart';
import 'package:tailor_app/instance_helper/instances.dart';
import 'package:tailor_app/sign_in_screen/repo.dart';
import 'package:tailor_app/utils/page_route/navigator.dart';
import 'package:tailor_app/widget/progress.dart';

LoginApiRepository _repository = LoginApiRepository();

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
      print('whatever');
      final _response = await _repository.loginUser(map: map);
      print('printing ${_response.toString()}');
      _response.when(success: (success, _, statusMessage) async {
        await _progressIndicator.dismiss();
        print('whatever again');
        showToast(this._context, message: 'Login Successful.');
        PageRouter.gotoNamed(Routes.DASHBOARD, _context);
        notifyListeners();
      }, failure: (NetworkExceptions error, int statusCode,
          String statusMessage) async {
        print('oshodu');
        await _progressIndicator.dismiss();
        notifyListeners();
        showToast(
            this._context, message: error.toString());
        notifyListeners();
      });
    } catch (e) {
      await _progressIndicator.dismiss();
      showToast(_context, message: errorMsg);
    }
  }
}

