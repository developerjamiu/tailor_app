
import 'package:flutter/cupertino.dart';
import 'package:jaynetwork/network/network_exceptions.dart';
import 'package:tailor_app/instance_helper/instances.dart';
import 'package:tailor_app/otp/repo.dart';
import 'package:tailor_app/sign_up_screen/model.dart';
import 'package:tailor_app/utils/helper/timer_helper.dart';
import 'package:tailor_app/utils/page_route/navigator.dart';
import 'package:tailor_app/utils/page_route/route.dart';
import 'package:tailor_app/widget/progress.dart';

import 'model.dart';

OtpApiRepository _repository = OtpApiRepository();

class OtpProviders extends ChangeNotifier {
  BuildContext _context;
  CustomProgressIndicator _progressIndicator;

  void init(BuildContext context) {
    this._context = context;
    this._progressIndicator = CustomProgressIndicator(this._context);
  }

  void verifyOtp({@required String token,@required Map map}) async {
    try {
      _progressIndicator.show();

      final _response = await _repository.verify(data:map,queryToken: token);
      print('jkfjkjkfjk');
      print('jkfjkjkfjk $_response');
      _response.when(success: (success, data, __) async {
        await _progressIndicator.dismiss();
        showToast(this._context, message: success.message);
        String _prefType = await preferencesHelper.getStringValues(key: 'type');
        print('printing account type here $_prefType');
        if(_prefType != null && _prefType == 'client')
          PageRouter.gotoNamed(Routes.DASHBOARD, _context);
        else
        PageRouter.gotoNamed(Routes.TAILOR_OTP_SUCCESSFUL, _context);
        notifyListeners();
      }, failure: (NetworkExceptions error, _, statusMessage) {
        _progressIndicator.dismiss();
        showToast(this._context,
            message: NetworkExceptions.getErrorMessage(error));
      });
      notifyListeners();
    } catch (e) {
      _progressIndicator.dismiss();
      debugPrint('Error: $e');
    }
  }

  void resendOtp(UtilityProvider utilityProvider,{@required String token,@required Map map}) async {
    try {
      _progressIndicator.show();
      final _response = await _repository.verify(data: map,queryToken: token);
      _response.when(success: (OtpModel success, data, __) async {
        await _progressIndicator.dismiss();
        showToast(this._context, message: success.message);
        print('resend successful');
        utilityProvider.startTimer(timeLimit: 4);
        PageRouter.gotoNamed(Routes.DASHBOARD, _context);
        notifyListeners();
      }, failure: (NetworkExceptions error, _, statusMessage) {
        _progressIndicator.dismiss();
        showToast(this._context,
            message: NetworkExceptions.getErrorMessage(error));
      });
      notifyListeners();
    } catch (e) {
      _progressIndicator.dismiss();
      debugPrint('Error: $e');
    }
  }
}