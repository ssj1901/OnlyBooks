import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:onlybook/bottomnavbar.dart';
import 'package:onlybook/home.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Color(0xFF2bc0e4),
            Color(0XFFeaecc6),
            // Color(0XFFffffff)
          ],
        )),
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Container(
            //   child: Image.asset('assets/onlybookslogo.jpg'),
            // ),

            Text("Hello Again!",
                style: GoogleFonts.roboto(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                )),
            Text("Welcome back you've been missed!",
                style: GoogleFonts.roboto(
                  fontSize: 22,
                  fontWeight: FontWeight.normal,
                )),
            SizedBox(
              height: 70,
            ),

            Container(
              margin: const EdgeInsets.fromLTRB(50, 10, 50, 0),
              child: TextField(
                keyboardType: TextInputType.number,
                // controller: passwordController,
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  labelText: 'Phone Number',
                ),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => Navig()),
                );
              },
              child: Container(
                margin: const EdgeInsets.fromLTRB(50, 10, 50, 0),
                height: 60,
                // width: 200,
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    border: Border.all(
                      color: Colors.black26,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Center(
                    child: Text('CONTINUE',
                        style: GoogleFonts.roboto(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                        ))),
              ),
            ),
            SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Divider(thickness: 5, color: Colors.black),
              Text("or",
                  style: GoogleFonts.roboto(
                    fontSize: 22,
                    fontWeight: FontWeight.normal,
                  )),
              Divider(thickness: 5, color: Colors.black)
            ]),
            SizedBox(height: 15),
            OutlinedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              onPressed: () {
                // setState(() {
                //   _isSigningIn = true;
                // });

                // setState(() {
                //   _isSigningIn = false;
                // });
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: AssetImage("assets/google_logo.png"),
                      height: 35.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Sign up with Google',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            // InkWell(
            //   onTap: () {},
            //   child: Ink(
            //     color: Color(0xFF397AF3),
            //     child: Padding(
            //       padding: EdgeInsets.all(6),
            //       child: Wrap(
            //         crossAxisAlignment: WrapCrossAlignment.center,
            //         children: [
            //           Icon(Icons.android), // <-- Use 'Image.asset(...)' here
            //           SizedBox(width: 12),
            //           Text('Sign in with Google'),
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
