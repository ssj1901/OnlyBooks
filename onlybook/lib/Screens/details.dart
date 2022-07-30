import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onlybook/Screens/detailsForm.dart';
import 'package:onlybook/bottomnavbar.dart';
// import 'package:flutter_auth/constants.dart';
// import 'package:flutter_auth/responsive.dart';
import 'package:onlybook/constants.dart';
import 'package:onlybook/responsive.dart';
import 'package:onlybook/services/database.dart';
import '../../components/background.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  var firstName, lastName, branch, sem, phNum;
  String dropdownValueBranch = 'CSE';
  String dropdownValueYear = '1';
  @override
  Widget build(BuildContext context) {
    final Map userDetails = {};

    double wt = MediaQuery.of(context).size.width;
    double ht = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: ht,
        width: wt,
        child: Stack(
          children: [
            Container(
              //color:Colors.transparent,
              height: ht,
              width: wt,
              child: Image.asset('assets/bg2.jpeg', fit: BoxFit.cover),
            ),
            Container(
              color: Colors.grey.shade200.withOpacity(0.4),
              height: ht,
              width: wt,
            ),
            Center(
                child: Container(
              height: ht * 0.7,
              width: wt * 0.87,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Color(0xFFb993d6).withOpacity(0.8),
                      Color(0XFF8ca6db).withOpacity(0.8),
                      // Color(0XFFffffff)
                    ],
                  )),
              child: Form(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 7),
                  height: ht * 0.7,
                  width: wt * 0.8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: ht * 0.05,
                      ),
                      // Container(
                      //   padding: EdgeInsets.only(left: 1),
                      //   child: Text('Create an Account',style: GoogleFonts.poppins(color: Colors.black,fontSize:24,fontWeight: FontWeight.w700),),
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0),
                        child: Text(
                          'Enter Your Details',
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(
                        height: ht * 0.04,
                      ),
                      Fields(
                          context, userDetails, firstName, "First Name", "f"),
                      const SizedBox(height: defaultPadding / 2),
                      Fields(context, userDetails, lastName, "Last Name", "l"),
                      const SizedBox(height: defaultPadding / 2),
                      SizedBox(
                        height: ht * 0.01,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0),
                        child: Text(
                          'Choose Your Branch:',
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w300),
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.only(left: defaultPadding),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.white,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        width: MediaQuery.of(context).size.width * 0.83,
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: dropdownValueBranch,
                          // icon: const Icon(Icons.arrow_circle_down),
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
                          items: <String>['CSE', 'ECE', 'EEE', 'EBE', 'MECH']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,
                                  style: TextStyle(color: Colors.black)),
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
                          'Choose Your Year:',
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: defaultPadding),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.white,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
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
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValueYear = newValue!;
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
                              child: Text(value,
                                  style: TextStyle(color: Colors.black)),
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
                      Fields(context, userDetails, phNum, "Phone Number", "p"),
                      const SizedBox(height: defaultPadding / 1),
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
                          onPressed: _submit,
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
            ))
          ],
        ),
      ),
    );
  }

  Widget Fields(BuildContext context, Map userDetails, var detail,
      String hintText, var type) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.83,
      child: TextFormField(
        keyboardType: type == "p" ? TextInputType.phone : TextInputType.name,
        textInputAction: TextInputAction.next,
        cursorColor: kPrimaryColor,
        //onSaved: (detail) {},
        decoration: InputDecoration(
          hintStyle: TextStyle(fontSize: 14),
          hintText: hintText,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: type == "p" ? Icon(Icons.phone) : Icon(Icons.person),
          ),
        ),
        onChanged: (val) {
          if (type == "p") phNum = val;
          if (type == "f") firstName = val;
          if (type == "l") lastName = val;
        },
      ),
    );
  }

  Future _submit() async {
    try {
      final user = await FirebaseAuth.instance.currentUser!;

      final docUser =
          FirebaseFirestore.instance.collection('users').doc(user.uid).get();
      //  User? user = result.user;
      await DatabaseService(uid: user.uid).updateFirstName(firstName);
      await DatabaseService(uid: user.uid).updateLastName(lastName);
      await DatabaseService(uid: user.uid).updateBranch(dropdownValueBranch);
      await DatabaseService(uid: user.uid).updateYear(dropdownValueYear);
      await DatabaseService(uid: user.uid).updatePhoneNumber(phNum);
      user.updateDisplayName(firstName);
      Navigator.push(
        context,
        CupertinoPageRoute(builder: (context) => Navig()),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
