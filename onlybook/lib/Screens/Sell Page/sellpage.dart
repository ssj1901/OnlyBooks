import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants.dart';

class SellPage extends StatefulWidget {
  const SellPage({Key? key}) : super(key: key);

  @override
  State<SellPage> createState() => _SellPageState();
}

class _SellPageState extends State<SellPage> {
  var title, course, price;
  String dropdownValueBranch = 'CSE';
  String dropdownValueYear = '1';
  File? image;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return null;

      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    double wt = MediaQuery.of(context).size.width;
    double ht = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: ht,
        width: wt,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          colors: [
            Color(0xFFc9d6ff),
            Color(0XFFe2e2e2),
            // Color(0XFFffffff)
          ],
        )),
        child: Stack(children: [
          Positioned(
            top: ht * 0.08,
            child: Container(
              padding: EdgeInsets.only(left: wt * 0.11),
              child: Text(
                "What are you Selling?",
                style: GoogleFonts.lato(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.purple[900]),
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              // top: ht * 0.05,
              child: Container(
                width: wt,
                height: ht * 0.78,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: Column(
                  children: [
                    Container(
                      // decoration: BoxDecoration(
                      //     color: Colors.black,
                      //     borderRadius: BorderRadius.circular(100)),
                      //color: Colors.black,
                      height: ht * 0.23,
                      child: Stack(children: [
                        Center(
                          child: Positioned(
                            top: 5,
                            child: Container(
                              height: ht * 0.2,
                              width: wt * 0.45,
                              // color: Colors.black,
                              decoration: BoxDecoration(
                                  // color: Colors.black,
                                  borderRadius: BorderRadius.circular(600)),

                              child: image != null
                                  ? ClipOval(
                                      child: Image.file(
                                        image!,
                                        fit: BoxFit.contain,
                                        //  width: 100,
                                      ),
                                    )
                                  : ClipOval(
                                      child: Image.asset("assets/empty.jpg")),
                            ),
                          ),
                        ),
                        Positioned(
                            top: ht * 0.15,
                            left: wt * 0.58,
                            child: Container(
                              height: ht * 0.07,
                              width: wt * 0.15,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                  border: Border.all(color: Colors.black)),
                              child: IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          _buildPopupDialog(context),
                                    );
                                  },
                                  icon: Icon(Icons.camera_alt)),
                            ))
                      ]),
                    ),
                    Sellingdetails(ht, wt, context),
                  ],
                ),
              ))
        ]),
      ),
    );
  }

  Widget _buildPopupDialog(BuildContext context) {
    return new AlertDialog(
      title: const Text('Select Image'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        // children: <Widget>[
        //   Text("Hello"),
        // ],
      ),
      actions: <Widget>[
        new InkWell(
            onTap: () {
              pickImage(ImageSource.camera);
              Navigator.pop(context);
            },
            child: Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: Center(
                child: Text(
                  'Camera',
                  style: GoogleFonts.lato(color: Colors.white, fontSize: 17),
                ),
              ),
            )),
        new InkWell(
            onTap: () {
              pickImage(ImageSource.gallery);
              Navigator.pop(context);
            },
            child: Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: Center(
                child: Text(
                  'Gallery',
                  style: GoogleFonts.lato(color: Colors.white, fontSize: 17),
                ),
              ),
            )),
      ],
    );
  }

  Widget Sellingdetails(double ht, double wt, BuildContext context) {
    return Center(
      child: Form(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 7),
          height: ht * 0.55,
          width: wt * 0.8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: ht * 0.02,
              ),

              Fields(context, title, "Title", "s"),
              const SizedBox(height: defaultPadding / 2),
              Fields(context, course, "Course", "s"),
              const SizedBox(height: defaultPadding / 2),
              SizedBox(
                height: ht * 0.01,
              ),

              Padding(
                padding: const EdgeInsets.only(left: 6.0),
                child: Text(
                  'Branch:',
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w300),
                ),
              ),

              Container(
                padding: EdgeInsets.only(left: defaultPadding),
                decoration: BoxDecoration(
                    color: kPrimaryLightColor,
                    // border: Border.all(
                    //   color: kPrimaryColor,
                    // ),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                width: MediaQuery.of(context).size.width * 0.83,
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: dropdownValueBranch,
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 0,
                    color: Colors.white,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValueBranch = newValue!;
                    });
                  },
                  items: <String>[
                    'CSE',
                    'ECE',
                    'EEE',
                    'EBE',
                    'MECH',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: TextStyle(color: Colors.black)),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: ht * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 6.0),
                child: Text(
                  'Year:',
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w300),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: defaultPadding),
                decoration: BoxDecoration(
                    color: kPrimaryLightColor,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                width: MediaQuery.of(context).size.width * 0.83,
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: dropdownValueYear,
                  // icon: const Icon(Icons.arrow_circle_down),
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 0,
                    color: Colors.white,
                  ),
                  onChanged: (String? newValue1) {
                    setState(() {
                      dropdownValueYear = newValue1!;
                    });
                  },
                  items: <String>[
                    '1',
                    '2',
                    '3',
                    '4',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: TextStyle(color: Colors.black)),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: ht * 0.01,
              ),
              // Fields(context,branch,"First Name"),
              // Fields(context,sem,"First Name"),
              const SizedBox(height: defaultPadding / 2),
              Fields(context, price, "Price", "s"),
              //  const SizedBox(height: defaultPadding / 1),
              SizedBox(
                height: ht * 0.01,
              ),
              Container(
                width: wt * 0.83,
                child: ElevatedButton(
                  // onPressed: () {
                  //   Navigator.push(
                  //     context,
                  //     CupertinoPageRoute(builder: (context) => Navig()),
                  //   );
                  //},
                  onPressed: () {
                    // AuthService().addUser(name, password).then((val) {
                    //   print(name);
                    //   print(password);
                    //   print("Success");
                    // });

                    // Navigator.push(
                    //   context,
                    //   CupertinoPageRoute(builder: (context) {
                    //     return Navig();
                    //   }),
                    // );
                  },
                  child: Text(
                    "Submit".toUpperCase(),
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget Fields(BuildContext context, var detail, String hintText, var type) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.83,
    child: TextFormField(
      keyboardType: type == "s" ? TextInputType.name : TextInputType.phone,
      textInputAction: TextInputAction.next,
      cursorColor: kPrimaryColor,
      onSaved: (detail) {},
      decoration: InputDecoration(
        hintStyle: TextStyle(fontSize: 14),
        hintText: hintText,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: type == "s" ? Icon(Icons.keyboard) : Icon(Icons.phone),
        ),
      ),
      onChanged: (val) {},
    ),
  );
}
