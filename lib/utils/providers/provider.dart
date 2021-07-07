
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:tailor_app/complete_tailor_verification/provider.dart';
import 'package:tailor_app/customers_management/customer/provider.dart';
import 'package:tailor_app/otp/provider.dart';
import 'package:tailor_app/sign_in_screen/provider.dart';
import 'package:tailor_app/sign_up_screen/provider.dart';
import 'package:tailor_app/tailor_category/category_model/provider.dart';
import 'package:tailor_app/tailor_category/upload_image/provider.dart';
import 'package:tailor_app/utils/helper/timer_helper.dart';

import '../user_provider.dart';

class Providers {
  static List<SingleChildWidget> getProviders = [
    ChangeNotifierProvider<SignUpProviders>(create: (_) => SignUpProviders()),
    ChangeNotifierProvider<UtilityProvider>(create: (_) => UtilityProvider()),
    ChangeNotifierProvider<SignInProvider>(create: (_) => SignInProvider()),
    ChangeNotifierProvider<OtpProviders>(create: (_) => OtpProviders()),
    ChangeNotifierProvider<TailorCategoryProvider>(create: (_) => TailorCategoryProvider()),
    ChangeNotifierProvider<UploadImageProvider>(create: (_) => UploadImageProvider()),
    ChangeNotifierProvider<CompleteTailorAccountProvider>(create: (_) => CompleteTailorAccountProvider()),
    ChangeNotifierProvider<CustomersProvider>(create: (_) => CustomersProvider()),
  ];
}
