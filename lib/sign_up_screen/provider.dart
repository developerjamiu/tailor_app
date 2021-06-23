
import 'package:flutter/cupertino.dart';
import 'package:jaynetwork/network/network_exceptions.dart';
import 'package:tailor_app/instance_helper/instances.dart';
import 'package:tailor_app/otp/otp_screen.dart';
import 'package:tailor_app/sign_up_screen/model.dart';
import 'package:tailor_app/sign_up_screen/repo.dart';
import 'package:tailor_app/tailor_category/tailor_category_screen.dart';
import 'package:tailor_app/utils/page_route/navigator.dart';
import 'package:tailor_app/widget/progress.dart';

final SignUpApiRepository _repository = SignUpApiRepository();

class SignUpProviders extends ChangeNotifier {
  BuildContext _context;
  CustomProgressIndicator _progressIndicator;
  SignUpModel model;

  void init(BuildContext context) {
    this._context = context;
    this._progressIndicator = CustomProgressIndicator(this._context);
  }

  void signUp({@required Map map}) async {
    try {
      _progressIndicator.show();
      final _response = await _repository.signUp(data: map);
       _response.when(success: (success, _, message) async {
        await _progressIndicator.dismiss();
          print('successfully entered again');

          showToast(this._context, message: 'SignUp Successful.');
        PageRouter.gotoWidget(
            OtpPage(),
            _context);
         String _prefToken = await preferencesHelper.getStringValues(key: 'token');
         print('printing tokens: $_prefToken');
        notifyListeners();
      }, failure: (NetworkExceptions error, int statusCode,
          String statusMessage) async {
         await _progressIndicator.dismiss();
        showToast(this._context,
            message: NetworkExceptions.getErrorMessage(error));
        notifyListeners();
      });
    } catch (e) {
      await _progressIndicator.dismiss();
      showToast(_context, message: 'Sign up failed');
    }
  }
}


