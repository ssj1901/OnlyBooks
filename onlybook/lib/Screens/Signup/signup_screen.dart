import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onlybook/Screens/Login/login_screen.dart';
import 'package:onlybook/Screens/details.dart';
// import 'package:flutter_auth/constants.dart';
// import 'package:flutter_auth/responsive.dart';
import 'package:onlybook/constants.dart';
import 'package:onlybook/responsive.dart';
import 'package:onlybook/services/database.dart';
import '../../components/already_have_an_account_acheck.dart';
import '../../components/background.dart';
//import 'components/signup_form.dart';
//import 'components/socal_sign_up.dart';

class SignUpScreen extends StatefulWidget {
  final Function() onClickedSignIn;

  SignUpScreen({Key? key, required this.onClickedSignIn}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formkey = GlobalKey<FormState>();
  var email, password;
  @override
  Widget build(BuildContext context) {
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
              height: ht * 0.6,
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
                  height: ht * 0.5,
                  width: wt * 0.8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: ht * 0.05,
                      ),
                      Center(
                        child: Text(
                          "OnlyBooks",
                          style: GoogleFonts.pacifico(
                              color: Colors.black,
                              fontSize: 50,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        height: ht * 0.04,
                      ),
                      // Container(
                      //   padding: EdgeInsets.only(left: 1),
                      //   child: Text('Create an Account',style: GoogleFonts.poppins(color: Colors.black,fontSize:24,fontWeight: FontWeight.w700),),
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0),
                        child: Text(
                          'Create an Account',
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0),
                        child: Text(
                          'Lets Get Started',
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                      SizedBox(
                        height: ht * 0.02,
                      ),
                      Container(
                        width: wt * 0.83,
                        child: TextFormField(
                          key: _formkey,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          cursorColor: kPrimaryColor,
                          //       onSaved: (email) {},
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(fontSize: 14),
                            hintText: "Your email",
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(defaultPadding),
                              child: Icon(Icons.person),
                            ),
                          ),
                          validator: (value) =>
                              value!.isEmpty ? 'Email cannot be empty' : null,
                          onChanged: (val) {
                            email = val;
                          },
                        ),
                      ),
                      Container(
                        width: wt * 0.83,
                        padding: const EdgeInsets.symmetric(
                            vertical: defaultPadding),
                        child: TextFormField(
                          textInputAction: TextInputAction.done,
                          obscureText: true,
                          cursorColor: kPrimaryColor,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(fontSize: 14),
                            hintText: "Your password",
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(defaultPadding),
                              child: Icon(Icons.lock),
                            ),
                          ),
                          validator: (value) =>
                              value!.length < 6 ? 'Password too short' : null,
                          onChanged: (val) {
                            password = val;
                          },
                        ),
                      ),
                      const SizedBox(height: defaultPadding / 2),
                      Container(
                        width: wt * 0.83,
                        child: ElevatedButton(
                          // onPressed: () {
                          //   Navigator.push(
                          //     context,
                          //     CupertinoPageRoute(builder: (context) => Navig()),
                          //   );
                          //},
                          // onPressed: () {
                          //   AuthService().addUser(name, password).then((val) {
                          //     print(name);
                          //     print(password);
                          //     print("Success");
                          //   });
                          onPressed: signUp,

                          // Navigator.push(
                          //   context,
                          //   CupertinoPageRoute(builder: (context) {
                          //     return DetailsPage();
                          //   }),
                          // );
                          //},

                          child: Text(
                            "Sign Up".toUpperCase(),
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                      const SizedBox(height: defaultPadding),
                      Center(
                        //    padding: const EdgeInsets.only(left: 8.0),
                        child: RichText(
                            text: TextSpan(
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                                text: 'Already have an account? ',
                                children: [
                              TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = widget.onClickedSignIn,
                                  text: "Log In",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary))
                            ])),
                      )
                      // AlreadyHaveAnAccountCheck(
                      //   login: false,
                      //   press: () {
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //         builder: (context) {
                      //           return LoginScreen();
                      //         },
                      //       ),
                      //     );
                      //   },
                      // ),
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

  Future signUp() async {
    // final isValid = _formkey.currentState!.validate();
    // if (!isValid) return;
    try {
      UserCredential result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      await DatabaseService(uid: user!.uid).updateEmail(email);
      await DatabaseService(uid: user.uid).updatePassword(password);
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
