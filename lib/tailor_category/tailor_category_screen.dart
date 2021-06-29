import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tailor_app/instance_helper/instances.dart';
import 'package:tailor_app/utils/colors.dart';
import 'package:tailor_app/widget/text_view_widget.dart';
import 'package:provider/provider.dart';
import 'package:tailor_app/tailor_category/upload_image/provider.dart';
import 'package:tailor_app/tailor_category/upload_image/model.dart';

import 'category_model/model.dart';
import 'category_model/provider.dart';


class TailorCategory extends StatefulWidget {
  const TailorCategory({Key key}) : super(key: key);

  @override
  _TailorCategoryState createState() => _TailorCategoryState();
}

class _TailorCategoryState extends State<TailorCategory> {

  TailorCategoryProvider tailorCategoryProvider;
  CategoryModel categoryModel;


  bool iconBarTraditionalWears = false;
  bool iconBarEnglishWears = false;
  bool iconBarMaterial = false;
  UploadImageProvider uploadImageProvider;

  File imageFile;
  File picture;
  var imageString;
  String token,loginToken;

  Future getImage(BuildContext context, bool isCamera) async {
    if (isCamera) {
      var picture = await ImagePicker().getImage(source: ImageSource.camera);
      if (picture != null && picture.path.isNotEmpty && picture.path != null) {
        setState(() {
          imageFile = File(picture.path);
          imageString = imageFile.path.split("/").last;
        });
        uploadImage();
      }
    } else {
      var picture = await ImagePicker().getImage(source: ImageSource.gallery);
      if (picture != null && picture.path.isNotEmpty && picture.path != null) {
        setState(() {
          imageFile = File(picture.path);
          imageString = imageFile.path.split("/").last;
        });
        uploadImage();
      }
    }
  }

  Future<void> _showDialog(BuildContext parentContext) {
    return showDialog(
        context: parentContext,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 8, 8),
                      child: TextViewWidget(
                        text: 'Camera',
                        color: AppColor.black,
                        textSize: 18,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      getImage(parentContext, true);
                    },
                  ),
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, 8, 8, 0),
                      child: TextViewWidget(
                        text: 'Gallery',
                        color: AppColor.black,
                        textSize: 18,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      getImage(parentContext, false);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  void uploadImage()async{
    var map = await UploadImageModel.uploadImageToMap(image: imageFile);
    uploadImageProvider.uploadImage(
        imageData: map,
        token: token);
  }

  void tailorCategory(){
    tailorCategoryProvider.tailorCategoryP(
        token: loginToken);
  }

  @override
  void initState() {
    uploadImageProvider = Provider.of<UploadImageProvider>(context,listen:false);
    uploadImageProvider.init(context);
    tailorCategoryProvider = Provider.of<TailorCategoryProvider>(context,listen:false);
    tailorCategoryProvider.init(context);

    init();
    super.initState();
  }

  init() async {
    token = await preferencesHelper.getStringValues(key: 'token');
    loginToken = await preferencesHelper.getStringValues(key: 'login_token');
    // tailorCategoryProvider.tailorCategoryP(token:token);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        leading: IconButton(
          color:AppColor.textColor,
          icon: Icon(Icons.storage),
          onPressed: ()async=> await _showDialog(context),
      ),
      ),
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
              SizedBox(height:75),
              ElevatedButton(
                onPressed: ()=> tailorCategory(),
                style: TextButton.styleFrom(
                  backgroundColor: AppColor.purple,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextViewWidget(
                    text: 'Category',
                    color: AppColor.white,
                    textSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              // TextViewWidget(text:,textSize:16,color:AppColor.black)

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
