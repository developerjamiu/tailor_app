import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class PurpleBackgroundWidget extends StatelessWidget {
  const PurpleBackgroundWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:Alignment.topRight,
      child: SvgPicture.asset('assets/rectangle.svg'),);
  }
}
