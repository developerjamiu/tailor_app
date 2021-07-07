import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tailor_app/splashscreen/splashscreen.dart';
import 'package:tailor_app/utils/colors.dart';
import 'package:tailor_app/utils/page_route/navigator.dart';
import 'package:tailor_app/utils/providers/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: AppColor.purple));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: Providers.getProviders,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        routes: Routes.getRoutes,
      ),
    );
  }
}
