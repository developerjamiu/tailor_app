
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:tailor_app/sign_in_screen/provider.dart';
import 'package:tailor_app/sign_up_screen/provider.dart';

import '../user_provider.dart';

class Providers {
  static List<SingleChildWidget> getProviders = [
    ChangeNotifierProvider<SignUpProviders>(create: (_) => SignUpProviders()),
    ChangeNotifierProvider<UserSignUpProvider>(create: (_) => UserSignUpProvider()),
    ChangeNotifierProvider<UserLoginProvider>(create: (_) => UserLoginProvider()),
    ChangeNotifierProvider<SignInProvider>(create: (_) => SignInProvider()),
  ];
}
