import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tailor_app/utils/colors.dart';
import 'package:tailor_app/widget/text_view_widget.dart';

class TailorCategory extends StatefulWidget {
  const TailorCategory({Key key}) : super(key: key);

  @override
  _TailorCategoryState createState() => _TailorCategoryState();
}

class _TailorCategoryState extends State<TailorCategory> {

  bool iconBarTraditionalWears = false;
  bool iconBarEnglishWears = false;
  bool iconBarMaterial = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left:8.0,right:8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60,),
              TextViewWidget(
                  text: 'Tailor Category',
                  textSize: 25,
                  color: AppColor.black,
                  fontWeight: FontWeight.w600,),
              SizedBox(height: 20),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: AppColor.purple
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left:10,right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextViewWidget(
                        text: 'Traditional Wears',
                        fontWeight: FontWeight.w400,
                        textSize: 18,
                        color: AppColor.white,),
                      iconBarTraditionalWears==false?IconButton(
                        icon: Icon(Icons.add,color: AppColor.white,),
                        onPressed: ()=>setState((){
                          iconBarTraditionalWears = true;
                      }),):IconButton(
                        icon: Icon(
                          Icons.minimize_outlined,color: AppColor.white,),
                        onPressed: ()=>setState((){
                          iconBarTraditionalWears = false;
                        }),)

                    ],
                  ),
                ),
              ),
              iconBarTraditionalWears==false?Container():imageContainer(),
              SizedBox(height: 10),
              Container(
                height: 40,
                decoration: BoxDecoration(
                    color: AppColor.purple
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left:10,right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextViewWidget(
                        text: 'English Wears',
                        fontWeight: FontWeight.w400,
                        textSize: 18,
                        color: AppColor.white,),
                      iconBarEnglishWears==false?IconButton(
                        icon: Icon(Icons.add,color: AppColor.white,),
                        onPressed: ()=>setState((){
                          iconBarEnglishWears = true;
                        }),):IconButton(
                        icon: Icon(
                          Icons.minimize_outlined,color: AppColor.white,),
                        onPressed: ()=>setState((){
                          iconBarEnglishWears = false;
                        }),)

                    ],
                  ),
                ),
              ),
              iconBarEnglishWears==false?Container():imageContainer(),
              SizedBox(height: 10),
              Container(
                height: 40,
                decoration: BoxDecoration(
                    color: AppColor.purple
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left:10,right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextViewWidget(
                        text: 'Material',
                        fontWeight: FontWeight.w400,
                        textSize: 18,
                        color: AppColor.white,),
                      iconBarMaterial==false?IconButton(
                        icon: Icon(Icons.add,color: AppColor.white,),
                        onPressed: ()=>setState((){
                          iconBarMaterial = true;
                        }),):IconButton(
                        icon: Icon(
                          Icons.minimize_outlined,color: AppColor.white,),
                        onPressed: ()=>setState((){
                          iconBarMaterial = false;
                        }),)

                    ],
                  ),
                ),
              ),
              iconBarMaterial==false?Container():imageContainer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget imageContainer()=>SizedBox(
    height: 350,
    child: Container(
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(top: 10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10,
            crossAxisCount: 3,
            mainAxisSpacing: 15,
            mainAxisExtent: 100,),
        itemBuilder: (_, index) => Image.asset('assets/image_mat.png',fit: BoxFit.cover,),
        itemCount:9,
      ),
    ),
  );
}
