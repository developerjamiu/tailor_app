import 'package:flutter/material.dart';
import 'package:tailor_app/splashscreen/slide_screen.dart';
import 'package:tailor_app/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  int currentIndexPage;
  int pageLength;
  // Timer _pageViewAutoAnimateTimer;
  // PageController pageController = PageController();

  @override
  void initState() {
    currentIndexPage = 0;
    pageLength = 4;
    // _pageViewAutoAnimateTimer = Timer.periodic(
    //   const Duration(seconds: 5),
    //       (timer) {
    //     if (currentIndexPage != pageLength - 1) {
    //       pageController.animateToPage(
    //         currentIndexPage + 1,
    //         duration: const Duration(milliseconds: 400),
    //         curve: Curves.linear,
    //       );
    //     }
    //   },
    // );
    super.initState();
  }

  // @override
  // void dispose() {
  //   _pageViewAutoAnimateTimer.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (value) {
          setState(() => currentIndexPage = value);
        },
        children: [
          SlideScreen(
            textColor: AppColor.white,
            image: 'assets/image1.png',
            text1: 'Secure Storage',
            text2: 'We store all your data on secure cloud storage.So you\n will never lose your data,even if you lose your phone. \nYou can retrieve the data from any Android Phone.',
            svg: 'assets/rectangle1.svg',
            color: AppColor.purple,),
          SlideScreen(
            textColor: AppColor.white,
            image: 'assets/image2.png',
            text1: 'Design Sharing',
            text2: 'Share your gallery with your tailor and invite him to make\n the design of your choice.',
            svg: 'assets/rectangle1.svg',
            color: AppColor.topGreen,),
          SlideScreen(
            textColor: AppColor.white,
            image: 'assets/image3.png',
            text1: 'Fabric Management',
            text2: 'Manage and maintain your digital images on the basis\n of color, weave, blend, quality, price.',
            svg: 'assets/rectangle1.svg',
            color: AppColor.textColor,),
          SlideScreen(
            textColor: AppColor.black,
            image: 'assets/image4.png',
            text1: 'Manage Tailors',
            text2: 'Sizary app is specially designed for Tailors to manage\n their Tailor Shop. This includes, Order Management,\n Customer Management,Measurement Management etc.',
            svg: 'assets/rectangle1.svg',
            color: AppColor.white,),
          SlideScreen(
            textColor: AppColor.white,
            image: 'assets/image5.png',
            text1: 'YourFit',
            text2: 'Remove the confusion for your customers by making\n their fit choice more simple',
            svg: 'assets/rectangle1.svg',
            color: AppColor.brown,),
        ],
      ),
    );
  }
}
