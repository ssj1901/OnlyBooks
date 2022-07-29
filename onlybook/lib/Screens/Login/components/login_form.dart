import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onlybook/bottomnavbar.dart';
import 'package:onlybook/home.dart';
import 'package:onlybook/services/authservice.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../Signup/signup_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  var name, password, token;
  @override
  Widget build(BuildContext context) {
    double wt = MediaQuery.of(context).size.width;
    double ht = MediaQuery.of(context).size.height;
    return Form(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 7),
        height: ht * 0.5,
        width: wt*0.8,
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: ht*0.1,),
            // Container(
            //   padding: EdgeInsets.only(left: 1),
            //   child: Text('Create an Account',style: GoogleFonts.poppins(color: Colors.black,fontSize:24,fontWeight: FontWeight.w700),),
            // ),
            Padding(
              padding: const EdgeInsets.only(left:6),
              child: Text('Welcome Back',style: GoogleFonts.poppins(color: Colors.black,fontSize:27,fontWeight: FontWeight.w700),),
            ),
            Padding(
              padding: const EdgeInsets.only(left:6.0),
              child: Text('Please enter your details',style: GoogleFonts.poppins(color: Colors.white,fontSize:14,fontWeight: FontWeight.w300),),
            ),
            SizedBox(height: ht*0.05,),
            Container(
              width: wt *0.83,
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                cursorColor: kPrimaryColor,
                onSaved: (email) {},
                decoration: InputDecoration(
                  hintStyle: TextStyle(fontSize: 14),
                  hintText: "Your email",
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: Icon(Icons.person),
                  ),
                ),
                onChanged: (val) async {
                  name = val;
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.setString('email', val);
                },
              ),
            ),
            Container(
              width: wt*0.83,
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: TextFormField(
                textInputAction: TextInputAction.done,
                obscureText: true,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  hintStyle:TextStyle(fontSize: 14),
                  hintText: "Your password",
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: Icon(Icons.lock),
                  ),
                ),
                onChanged: (val) {
                  password = val;
                },
              ),
            ),
            const SizedBox(height: defaultPadding / 2),
            Container(
              width: wt*0.83,
              child: ElevatedButton(
                // onPressed: () {
                //   Navigator.push(
                //     context,
                //     CupertinoPageRoute(builder: (context) => Navig()),
                //   );
                // },
                onPressed: () {
              print(name + " "+password);
              AuthService().login(name, password).then((val) {
                if (val.data['success']) {
                  token = val.data['token'];
                  print("Success");
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Navig();
                    },
                  ),
                );
                }
              });
            },
                child: Text("Sign In".toUpperCase(),style: TextStyle(fontSize: 15),),
              ),
            ),
            const SizedBox(height: defaultPadding),
            AlreadyHaveAnAccountCheck(
              login: true,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
