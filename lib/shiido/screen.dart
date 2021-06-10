import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jaynetwork/jaynetwork.dart';
import 'package:tailor_app/error_handler/handler.dart';
import 'package:tailor_app/instance_helper/instances.dart';

class ShiddoScreen extends StatefulWidget {
  const ShiddoScreen({Key key}) : super(key: key);

  @override
  _ShiddoScreenState createState() => _ShiddoScreenState();
}

class _ShiddoScreenState extends State<ShiddoScreen> {
  File _imageFile;

  String _token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvc2l6YXJ5LmFwcFwvYXBpXC9hdXRoXC9yZWdpc3RlciIsImlhdCI6MTYyMzMyNjc1MCwiZXhwIjoxNjIzMzMwMzUwLCJuYmYiOjE2MjMzMjY3NTAsImp0aSI6Ilc4WFo4UnV2eTByM1FydVoiLCJzdWIiOjIyNiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.NRocsHN1_EKqFzaIZAibtq343YgVrhJnHOu4AUymO84';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sample'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(23.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(_imageFile.toString()),
              SizedBox(height: 23),
              CupertinoButton(
                  color: Colors.green,
                  child: Center(
                    child: Text('Pick Image'),
                  ),
                  onPressed: () => getImage()),
              SizedBox(height: 23),
              CupertinoButton(
                  color: Colors.red,
                  child: Center(
                    child: Text('Submit Data'),
                  ),
                  onPressed: () => _imageFile != null
                      ? submitData()
                      : print('Please pick an image...'))
            ],
          ),
        ),
      ),
    );
  }

  Future getImage() async {
    var picture = await ImagePicker().getImage(source: ImageSource.gallery);
    if (picture != null && picture.path.isNotEmpty && picture.path != null) {
      setState(() => _imageFile = File(picture.path));
      print('Image::::$_imageFile');
    }
  }

//* generate key
  var _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String generateKey(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  void submitData() async {
    var _map = await mapImageAndData();
    uploadImage(map: _map, token: _token);
  }

  Future<ApiResponse<dynamic>> uploadImage(
      {@required FormData map, @required String token}) async {
    try {
      final _response = await networkClient
          .makePostRequest('complete?token=$token', data: map);

      print('Response === ${_response.body}');

      /// Do your normal json decoding here

      return ApiResponse.success(
          statusMessage: _response.statusMessage,
          data: null,

          /// pass the decoded json here
          statusCode: _response.statusCode);
    } catch (e) {
      return handleNetworkException(e);
    }
  }

  Future<FormData> mapImageAndData() async {
    var byteData = _imageFile.absolute;
    List<int> imageData = byteData.readAsBytesSync();
    MultipartFile multipartFile = new MultipartFile.fromBytes(
      imageData,
      filename: generateKey(15),
      contentType: MediaType("image", "jpg"),
    );

    FormData formData = FormData.fromMap({
      'shopname': 'Godspower  shop',
      'cac': '559595',
      'shopaddress': 'Abuja',
      'phone': '08074725983',
      'state': 'Abuja',
      'address': 'Abuja',
      'tags': '["suleja","paulosa"]',
      'fabrics': 'agbada',
      'logo': multipartFile,
    });
    return formData;
  }
}
