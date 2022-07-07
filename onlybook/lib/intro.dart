import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
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
            //   height: 80,
            //   width:80,
            //   child:ClipRRect(

            //     child: Image(
            //       height: 70,
            //       width: 70,
            //       image:AssetImage('assets/onlybookslogo.jpg'))),
            // )
            Container(
                child: Image(
              colorBlendMode: BlendMode.softLight,
              image: AssetImage('assets/onlybookslogo.jpg'),
            )),

            Text("Discover Your",
                style: GoogleFonts.roboto(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                )),
            Text("Dream Books Here",
                style: GoogleFonts.roboto(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(
              height: 10,
            ),
            Text("Blah blah blah blah blah",
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                )),
            Text("Blah blah blah blah",
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                )),
            SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(builder: (context) => Register()),
                    );
                  },
                  child: Container(
                    height: 50,
                    width: 130,
                    decoration: BoxDecoration(
                        color: Colors.white60,
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
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(builder: (context) => Navig()),
                    );
                  },
                  child: Container(
                    height: 50,
                    width: 130,
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        border: Border.all(
                          color: Colors.white54,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                        // color: Colors.black,
                        ),
                    child: Center(
                        child: Text('Login',
                            style: GoogleFonts.roboto(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ))),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
