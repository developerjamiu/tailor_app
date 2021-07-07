import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tailor_app/utils/colors.dart';
import 'package:tailor_app/utils/page_route/navigator.dart';
import 'package:tailor_app/widget/text_view_widget.dart';

class SlideScreen extends StatelessWidget {
  final String image;
  final String svg;
  final String text1;
  final String text2;
  final Color color;
  final Color textColor;

  SlideScreen({
    @required this.image,
    @required this.svg,
    @required this.text1,
    @required this.text2,
    @required this.color, this.textColor});

  int currentIndexPage=0;
  int pageLength=5;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
      children: [
        Container(
          height: 600,
          decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage(image),
                fit: BoxFit.fill,
              )
          ),
        ),

        Center(
          child: DotsIndicator(
            dotsCount: pageLength,
            position: double.parse(currentIndexPage.toString()),
            decorator: DotsDecorator(
                color: AppColor.white,
                activeColor: AppColor.purple,
                size: Size.square(8.0),
                activeSize: Size.square(8.0)),
          ),
        ),
        Positioned(
          bottom: 0,
          child: SvgPicture.asset(svg,color: color,),
        ),

        Positioned(
          bottom: 100,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextViewWidget(
                  textAlign: TextAlign.center,
                  text: text1,
                  color: textColor,
                  textSize: 30,
                  fontWeight: FontWeight.bold,),
                SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.only(left:12.0,right: 12.0),
                  child: TextViewWidget(
                    textAlign: TextAlign.center,
                    text: text2,
                    color: textColor, textSize: 17,
                    fontWeight: FontWeight.w200,),
                ),
                SizedBox(height: 20,),
                InkWell(
                  onTap: ()=>PageRouter.gotoNamed(Routes.LOGIN, context),
                    child: TextViewWidget(
                        text: 'Next', textSize: 21,
                        fontWeight: FontWeight.bold,
                        color: textColor))
              ],
            ),
          ),
        ),
      ],
        ),
    );
  }
}
