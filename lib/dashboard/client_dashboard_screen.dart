import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tailor_app/utils/colors.dart';
import 'package:tailor_app/widget/purple_backgroud_widget.dart';
import 'package:tailor_app/widget/text_view_widget.dart';

class ClientDashboard extends StatefulWidget {
  const ClientDashboard({Key key}) : super(key: key);

  @override
  _ClientDashboardState createState() => _ClientDashboardState();
}

class _ClientDashboardState extends State<ClientDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PurpleBackgroundWidget(),
            Row(
              children: [
                SizedBox(width: 20,),
                Icon(Icons.account_circle,size: 70,),
                SizedBox(width: 20,),
                TextViewWidget(
                    text: 'Princess Divine',
                    color: AppColor.black,
                    textSize: 23,
                    fontWeight: FontWeight.w500),
              ],
            ),
            SizedBox(height: 35,),
            Container(
              height: 150,
              decoration: BoxDecoration(
                  color: AppColor.purple,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SvgPicture.asset(
                              'assets/balance.svg'),
                          SizedBox(height: 4,),
                          Expanded(
                            child: TextViewWidget(
                                text: 'Current Balance',
                                color: AppColor.black,
                                textSize: 17,
                                textAlign: TextAlign.center
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SvgPicture.asset('assets/workdone.svg'),
                          SizedBox(height: 4,),
                          Expanded(
                            child: TextViewWidget(
                                text: 'Total Workdone',
                                color: AppColor.black,
                                textSize: 17,
                                textAlign: TextAlign.center
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Column(
                        children: [
                          SvgPicture.asset(
                              'assets/measurement.svg'),
                          Expanded(
                            child: TextViewWidget(
                              text: 'Share Measurement',
                              color: AppColor.black,
                              textSize: 15,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 450,
              decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        itemContainer(
                            text: 'Measurement',
                            color: Colors.amber,
                            svg: 'assets/measuring_tape.svg',
                            screen: Scaffold()
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        itemContainer(
                            text: 'Invoice',
                            // color: Colors.amber,
                            svg: 'assets/new_invoice.svg',
                            screen: Scaffold()
                        ),
                        itemContainer(
                            text: 'Progress Status',
                            svg: 'assets/progress.svg',
                            screen: Scaffold()
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        itemContainer(
                            text: 'Payment Plan',
                            svg: 'assets/payment_plan.svg',
                            screen: Scaffold()
                        ),
                        itemContainer(
                          text: 'Gallery',
                          svg: 'assets/gallery.svg',
                          screen: Scaffold(),

                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget itemContainer({
    String text, String svg, Widget screen,Color color})=>InkWell(
    onTap: ()=>Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => screen),
    ),
    child: Container(
      height: 100,
      width: 130,
      decoration: BoxDecoration(
          border: Border.all(color: AppColor.textColor),
          borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          children: [
            SvgPicture.asset(
              svg,
              color: color,),
            Expanded(
              child: TextViewWidget(
                  text: text,
                  textSize: 18,
                  color: AppColor.black),
            )
          ],
        ),
      ),
    ),
  );
}
