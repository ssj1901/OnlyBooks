import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:camera/camera.dart';
import 'camera_page.dart';

class sellPage extends StatefulWidget {
  const sellPage({Key? key}) : super(key: key);

  @override
  State<sellPage> createState() => _sellPageState();
}

class _sellPageState extends State<sellPage> {
  // File? image;
  // Future pickImage() async {
  //  try{
  //   final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if (image == null) return;
  //   final imageTemporary = File(image.path);
  //   setState(() =>this.image = imageTemporary);
  // } on PlatformException catch (e) {
  //   print('failed $e');
  // }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue,
      child: Center(
        child:Container(
          height:300,
          width:300,
          color: Colors.white,
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: ()async{
                  await availableCameras().then((value) => Navigator.push(context,
                MaterialPageRoute(builder: (_) => CameraPage(cameras: value))));
                },
                child: Container(
                  height: 40,
                  width: 200,
                  color: Colors.grey,
                  child: Text('camera'),
                ),
              ),
              SizedBox(height: 10,),
              InkWell(
                onTap: () async {},
                child: Container(
                  height: 40,
                  width: 200,
                  color: Colors.blue,
                  child: Text('gallery'),
                ),
              ),
            ],
          )
        )
      ),
    );
  }
}