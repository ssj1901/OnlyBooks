import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:onlybook/Screens/Login/login_screen.dart';
import 'package:onlybook/Screens/Signup/signup_screen.dart';
import 'package:onlybook/bottomnavbar.dart';
import 'package:onlybook/home.dart';
import 'package:onlybook/register.dart';

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    double wt = MediaQuery.of(context).size.width;
    double ht = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
            height: ht,
             width: wt,
         
          child: Stack(
            children: [
              Container(
                //color:Colors.transparent,
                height: ht,
                width:wt,
                child: Image.asset('assets/bg2.jpeg',fit:BoxFit.cover),

              ),
              Container(
                color:Colors.grey.shade200.withOpacity(0.4),
                height: ht,
                width:wt,
              ),
              Center(
                child: Container(
                      height:ht*0.8,
                      width: wt*0.9,
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                             
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Container(
                                    height: ht*0.35,
                                    child: Image(
                                  colorBlendMode: BlendMode.softLight,
                                  image: AssetImage('assets/onlybookslogo.jpg'),
                                )),
                              ),
                              SizedBox(height: 20,),
                              Text("Your One-Stop destination",
                                  style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500
                                  )),
                              Text("For All The",
                                  style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  )),
                              Text("Books You Need",
                                  style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  )),
                              
                              SizedBox(
                                height: 30,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        CupertinoPageRoute(builder: (context) => SignUpScreen()),
                                      );
                                    },
                                    child: Container(
                                      height: ht*0.06,
                                      width: wt*0.6,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                            color: Colors.black26,
                                          ),
                                          borderRadius: BorderRadius.all(Radius.circular(20))),
                                      child: Center(
                                          child: Text('Register',
                                              style: GoogleFonts.roboto(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ))),
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        CupertinoPageRoute(builder: (context) => LoginScreen()),
                                      );
                                    },
                                    child: Container(
                                      height: ht*0.06,
                                      width: wt*0.6,
                                      decoration: BoxDecoration(
                                          color: Colors.black12.withOpacity(0.2),
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.all(Radius.circular(20))
                                          // color: Colors.black,
                                          ),
                                      child: Center(
                                          child: Text('Login',
                                              style: GoogleFonts.roboto(
                                                color: Colors.grey.shade100,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ))),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
              
               ))
              
            ],
          ),
        ),
    );
  }
}
