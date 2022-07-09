import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flappy_search_bar_ns/flappy_search_bar_ns.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome,',
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold)),
                      ),
                      Text(
                        'Steve',
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400)),
                      )
                    ],
                  ),
                ),
                Material(
                  elevation: 20,
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Colors.transparent,
                          offset: Offset(0.0, 3.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ], borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Icon(Icons.notification_important)),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),

            Container(
              width: 600,
              height: 50,
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              decoration: BoxDecoration(
                  color: Colors.black12,
                  border: Border.all(
                    color: Colors.black26,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Row(
                children: [
                  Icon(Icons.search),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Search"),
                ],
              ),
            ),

            SizedBox(height: 20),

            Text(
              'Categories',
              style:
                  GoogleFonts.roboto(fontSize: 15, fontWeight: FontWeight.w500),
            ),

            SizedBox(height: 15),

            // Container(
            //   height: 20,
            //   color: Colors.white,
            // ),
            Container(
                height: 70,
                //color: Colors.white,
                child: ListView(scrollDirection: Axis.horizontal, children: [
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    categoriesWidget(
                      "CSE",
                      Icons.map_outlined,
                      Colors.yellow,
                    ),
                    categoriesWidget(
                      "ECE",
                      Icons.time_to_leave,
                      Colors.red,
                    ),
                    categoriesWidget(
                      "EBE",
                      Icons.medical_services,
                      Colors.cyan,
                    ),
                    categoriesWidget(
                      "EEE",
                      Icons.directions_walk,
                      Colors.yellow,
                    ),
                    categoriesWidget(
                      "MECH",
                      Icons.privacy_tip_outlined,
                      Colors.red,
                    ),
                  ]),
                ])),

            SizedBox(height: 15),

            Text(
              'Recommendations',
              style:
                  GoogleFonts.roboto(fontSize: 15, fontWeight: FontWeight.w500),
            ),

            SizedBox(height: 15),

            Expanded(
              child: Container(
                // height: 210,
                //   width: 200,
                //color: Colors.white,
                //   width: 200,

                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 1),
                    itemCount: books.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return Container(
                        margin: EdgeInsets.all(10),
                        // height: 50,
                        // width: 20,
                        alignment: Alignment.center,
                        child: Text(books[index]["name"]),
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(15)),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget categoriesWidget(String text, IconData icon, Color color) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),

      height: 70,
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 70,
      // color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          Text(text),
        ],
      ),
    );
  }
}

final List<Map> books = [
  {
    "url":
        "https://rukminim1.flixcart.com/image/416/416/regionalbooks/r/e/f/mathematics-rd-sharma-class-8th-original-imaecqrggjqt3dhs.jpeg?q=70",
    "name": "R.D. Sharma",
    "price": "Rs 250"
  },
  {
    "url":
        "https://rukminim1.flixcart.com/image/416/416/regionalbooks/r/e/f/mathematics-rd-sharma-class-8th-original-imaecqrggjqt3dhs.jpeg?q=70",
    "name": "R.D. Sharma",
    "price": "Rs 250"
  },
  {
    "url":
        "https://rukminim1.flixcart.com/image/416/416/regionalbooks/r/e/f/mathematics-rd-sharma-class-8th-original-imaecqrggjqt3dhs.jpeg?q=70",
    "name": "R.D. Sharma",
    "price": "Rs 250"
  },
  {
    "url":
        "https://rukminim1.flixcart.com/image/416/416/regionalbooks/r/e/f/mathematics-rd-sharma-class-8th-original-imaecqrggjqt3dhs.jpeg?q=70",
    "name": "R.D. Sharma",
    "price": "Rs 250"
  },
];
