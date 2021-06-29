import 'package:flutter/cupertino.dart';
import 'package:jaynetwork/network/network_exceptions.dart';
import 'package:tailor_app/instance_helper/instances.dart';
import 'package:tailor_app/tailor_category/category_model/repo.dart';
import 'package:tailor_app/widget/progress.dart';

TailorCategoryRepo tailorCategory = TailorCategoryRepo();

class TailorCategoryProvider extends ChangeNotifier {
  BuildContext _context;
  CustomProgressIndicator _progressIndicator;
  String queryToken;

  void init(BuildContext context) {
    this._context = context;
    this._progressIndicator = CustomProgressIndicator(this._context);
  }

  void tailorCategoryP({@required String token}) async {
    try {
      _progressIndicator.show();
      final _response = await tailorCategory.tailorCategory(queryToken: token);
      print('print me with response $_response');
      print('print me with response ${_response.statusMessage}');
      print('print me with response ${_response.statusCode}');
      _response.when(success: (success, data, statusMessage) async {
        await _progressIndicator.dismiss();
        print('print me inside tailor squad');
        showToast(this._context, message: statusMessage);
        notifyListeners();
      }, failure: (NetworkExceptions error, _, statusMessage) {
        _progressIndicator.dismiss();
        showToast(this._context,
            message: NetworkExceptions.getErrorMessage(error));
        notifyListeners();
      });
    } catch (e) {
      await _progressIndicator.dismiss();
      notifyListeners();
      print('print catch error here');
      showToast(this._context, message: 'Failed.. Please try again');
    }
  }
}
