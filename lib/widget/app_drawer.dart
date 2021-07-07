import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tailor_app/utils/colors.dart';
import 'package:tailor_app/utils/page_route/navigator.dart';
import 'package:tailor_app/utils/page_route/route.dart';
import 'package:tailor_app/widget/text_view_widget.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key key}) : super(key: key);

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 150, bottom: 120,left: 150),
      child: Drawer(
        child: ListView(
          children: [
            ListTile(
            onTap: ()=>PageRouter.gotoNamed(Routes.TAILOR_CATEGORY, context),
              leading: SvgPicture.asset('assets/measuring_tape.svg'),
              title: TextViewWidget(
                text: 'TailorCategory',
                textSize: 18,
                fontWeight: FontWeight.w400,
                color: AppColor.black,),)
          ],
        ),
      ),
    );
  }
}
