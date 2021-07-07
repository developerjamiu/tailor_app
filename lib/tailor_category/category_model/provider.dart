import 'package:flutter/cupertino.dart';
import 'package:tailor_app/instance_helper/instances.dart';
import 'package:tailor_app/tailor_category/category_model/model.dart';
import 'package:tailor_app/tailor_category/category_model/repo.dart';
import 'package:tailor_app/widget/progress.dart';

TailorCategoryRepo tailorCategory = TailorCategoryRepo();

class TailorCategoryProvider extends ChangeNotifier {
BuildContext _context;
CustomProgressIndicator _progressIndicator;
String queryToken;
List<Category> categoryModel;

void init(BuildContext context) {
  this._context = context;
  this._progressIndicator = CustomProgressIndicator(this._context);
}

void tailorCategoryP({@required String token}) async {
  try {
    _progressIndicator.show();
    categoryModel = await tailorCategory.tailorCategoryRepo(queryToken: token);
    await _progressIndicator.dismiss();
    // showToast(this._context, message: 'Successfully added a Category');
    notifyListeners();
  } catch (e) {
    await _progressIndicator.dismiss();
    showToast(this._context, message: 'Failed.. Please try again');
    notifyListeners();
  }
}
}