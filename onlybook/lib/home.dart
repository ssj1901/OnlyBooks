import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:onlybook/Screens/Chat/inbox_screen.dart';
import 'package:onlybook/Screens/Sell%20Page/sellpage.dart';
import 'package:onlybook/Screens/categories/categorytile.dart';
import 'package:onlybook/bookpage.dart';
import 'package:onlybook/components/search.dart';
import 'package:onlybook/constants.dart';
import 'bookmodel.dart';

//var data;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var branch, username, year;
  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  //final user = FirebaseAuth.instance.currentUser!;
  // final docUser =
  //     FirebaseFirestore.instance.collection('users').doc("${user!.uid}").get();
  @override
  void initState() {
    super.initState();
  }

  //   asyncTasks();
  // }

  Widget build(BuildContext context) {
    double wt = MediaQuery.of(context).size.width;
    double ht = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          TopPart(ht),
          Positioned(
            top: ht * 0.21,
            child: Container(
              padding: EdgeInsets.only(left: 10),
              height: ht * 0.9,
              width: wt,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: ht * 0.05),
                      Container(
                        margin: EdgeInsets.fromLTRB(5, 0, 10, 0),
                        height: ht * 0.2,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.topRight,
                              colors: [
                                Color(0xFFc9d6ff),
                                Color(0XFFe2e2e2),
                                // Color(0XFFffffff)
                              ],
                            ),
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin: EdgeInsets.only(left: 10),
                                width: wt * 0.4,
                                child: SvgPicture.asset(
                                    "assets/images/sellbook.svg")),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Want to Sell",
                                  style: GoogleFonts.ubuntu(
                                      fontSize: 23,
                                      color: kPrimaryColor,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text("Your Books?",
                                    style: GoogleFonts.ubuntu(
                                        fontSize: 18,
                                        color: kPrimaryColor,
                                        fontWeight: FontWeight.w600)),
                                SizedBox(
                                  height: 15,
                                ),
                                InkWell(
                                  onTap: () {
                                    Route route = CupertinoPageRoute(
                                        builder: (context) => SellPage());
                                    Navigator.push(context, route)
                                        .then(onGoBack);
                                  },
                                  child: Container(
                                    height: ht * 0.05,
                                    width: wt * 0.3,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.transparent,
                                          offset: Offset(2.0, 2.0), //(x,y)
                                          blurRadius: 2.0,
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                        child: Text("Sell",
                                            style: GoogleFonts.ubuntu(
                                                fontSize: 17,
                                                color: kPrimaryColor,
                                                fontWeight: FontWeight.w600))),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: ht * 0.02),
                      Text(
                        'Categories',
                        style: GoogleFonts.lato(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: ht * 0.02),
                      Categories(ht, wt),
                      SizedBox(
                        height: ht * 0.02,
                      ),
                      Text(
                        'Recommendations',
                        style: GoogleFonts.lato(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: ht * 0.02),
                      Recommended(ht, wt),
                      SizedBox(height: ht * 0.2),
                    ]),
              ),
            ),
          ),
          SearchBar(ht, wt),
        ],
      ),
    );
  }

  // Widget Recc(double ht,double wt){
  //   return StreamBuilder<QuerySnapshot>(stream:,builder:(context) )
  // }

  Widget Recommended(double ht, double wt) {
    return FutureBuilder(
        future: _fetch(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done)
            return Text("Loading");
          return StreamBuilder<List<Books>>(
              stream: readrecommendBooks(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final books = snapshot.data!;
                  return Container(
                    height: ht * 0.35,
                    width: wt,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        //     crossAxisCount: 1, childAspectRatio: 3),
                        itemCount: books.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) =>
                                        BookPage(books[index])),
                              );
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: Colors.white,
                              elevation: 2,
                              margin: EdgeInsets.all(8),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                // height: ht * 0.1,
                                width: wt * 0.45,
                                alignment: Alignment.center,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      height: ht * 0.2,
                                      decoration: BoxDecoration(
                                          // color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                          child: Image.network(
                                        books[index].imgPath,
                                        fit: BoxFit.contain,
                                      )),
                                    ),
                                    // Text(
                                    //   books[index].price,
                                    //   style: TextStyle(
                                    //       fontSize: 9, fontWeight: FontWeight.w300),
                                    // ),
                                    SizedBox(
                                      height: ht * 0.01,
                                    ),
                                    Text(
                                      books[index].title,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: ht * 0.01,
                                    ),
                                    Text(
                                      "Rs ${books[index].price}",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(
                                      height: ht * 0.015,
                                    ),
                                    Text(
                                      "- ${books[index].author}",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),

                    // ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              });
        });
  }

  Widget Categories(double ht, double wt) {
    return Container(
        height: ht * 0.14,
        //color: Colors.black,
        child: ListView(scrollDirection: Axis.horizontal, children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            categoriesWidget("CSE", 'assets/programmingcomputer.json', ht, wt
                //  Colors.yellow,
                ),
            categoriesWidget("ECE", 'assets/bulb.json', ht, wt
                //  Colors.red,
                ),
            categoriesWidget("EBE", 'assets/biomedical.json', ht, wt
                //  Colors.cyan,
                ),
            categoriesWidget("EEE", 'assets/electronics.json', ht, wt
                //  Colors.yellow,
                ),
            categoriesWidget("MECH", 'assets/mechanic.json', ht, wt
                //  Colors.red,
                ),
          ]),
        ]));
  }

  Widget SearchBar(double ht, double wt) {
    return Positioned(
      top: ht * 0.18,
      child: InkWell(
        onTap: () {
          // showSearch(context: context, delegate: DataSearch());
        },
        child: Container(
          margin: EdgeInsets.fromLTRB(wt * 0.08, 0, 0, 0),
          width: wt * 0.85,
          height: 50,
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.black26,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child:
              // CupertinoSearchTextField(
              //   backgroundColor: Colors.white,
              //   borderRadius:BorderRadius.all(Radius.circular(20)),
              //   onChanged: (values){
              //     showSearch(context: context, delegate: DataSearch());
              //   },
              // )
              Row(
            children: [
              Icon(Icons.search),
              SizedBox(
                width: 10,
              ),
              Text("Search"),
            ],
          ),
        ),
      ),
    );
  }

  Widget TopPart(double ht) {
    return Container(
      padding: EdgeInsets.all(10),
      height: ht,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: ht * 0.05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome',
                      style: GoogleFonts.ubuntu(
                          textStyle: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple[900])),
                    ),
                    FutureBuilder(
                        future: _fetch(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState != ConnectionState.done)
                            return Text("Loading");
                          return Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              username,
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.purple[900])),
                            ),
                          );
                        }),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Buy and Sell Books',
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400)),
                    ),
                  ],
                ),
              ),
              Material(
                elevation: 20,
                // color: Colors.transparent,
                borderRadius: BorderRadius.circular(30),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(builder: (context) => InboxScreen()),
                    );
                  },
                  child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Colors.transparent,
                          offset: Offset(2.0, 2.0), //(x,y)
                          blurRadius: 2.0,
                        ),
                      ], borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Icon(
                        Icons.chat,
                        color: Colors.purple[900],
                      )),
                ),
              ),
            ],
          ),
          // SizedBox(
          //   height: 20,
          // ),
        ],
      ),
    );
  }

  Widget categoriesWidget(String branch, String url, double ht, double wt) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(builder: (context) => Categorytile(branch)),
        );
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 10),
        color: Colors.white,
        shadowColor: Colors.grey.shade400,
        elevation: 2,
        child: Container(
          height: ht * 0.12,
          width: wt * 0.26,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: ht * 0.08,
                  child: Lottie.asset(url, fit: BoxFit.cover)),
              Text(
                branch,
                style: GoogleFonts.lato(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _fetch() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser!;
    if (firebaseUser != null)
      await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser.uid)
          .get()
          .then((value) {
        username = value.data()!['FirstName'];
        year = value.data()!['Year'];
        branch = value.data()!['Branch'];
        print(year);
        print(username);
        print(branch);
      });
  }

  Stream<List<Books>> readrecommendBooks() => FirebaseFirestore.instance
      .collection('books')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Books.fromJson(doc.data())).toList());
}






//  FutureBuilder(
//         future: _fetch(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState != ConnectionState.done)
//             return Text("Loading");
//           return StreamBuilder<List<Books>>(
//               stream: readrecommendBooks(),
//               builder: (context, snapshot) {
//                 if (snapshot.hasData) {
//                   final books = snapshot.data!;
//                   return Container(
//                     height: ht * 0.35,
//                     width: wt,
//                     child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                         //     crossAxisCount: 1, childAspectRatio: 3),
//                         itemCount: books.length,
//                         itemBuilder: (BuildContext ctx, index) {
//                           return InkWell(
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 CupertinoPageRoute(
//                                     builder: (context) =>
//                                         BookPage(books[index])),
//                               );
//                             },
//                             child: Card(
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10)),
//                               color: Colors.white,
//                               elevation: 2,
//                               margin: EdgeInsets.all(8),
//                               child: Container(
//                                 padding: EdgeInsets.all(10),
//                                 // height: ht * 0.1,
//                                 width: wt * 0.45,
//                                 alignment: Alignment.center,
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Container(
//                                       margin: EdgeInsets.only(bottom: 10),
//                                       height: ht * 0.2,
//                                       decoration: BoxDecoration(
//                                           // color: Colors.grey,
//                                           borderRadius:
//                                               BorderRadius.circular(10)),
//                                       child: Center(
//                                           child: Image.network(
//                                         books[index].imgPath,
//                                         fit: BoxFit.contain,
//                                       )),
//                                     ),
//                                     // Text(
//                                     //   books[index].price,
//                                     //   style: TextStyle(
//                                     //       fontSize: 9, fontWeight: FontWeight.w300),
//                                     // ),
//                                     SizedBox(
//                                       height: ht * 0.01,
//                                     ),
//                                     Text(
//                                       books[index].title,
//                                       maxLines: 1,
//                                       overflow: TextOverflow.ellipsis,
//                                       style: TextStyle(
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.w500),
//                                     ),
//                                     SizedBox(
//                                       height: ht * 0.01,
//                                     ),
//                                     Text(
//                                       "Rs ${books[index].price}",
//                                       style: TextStyle(
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.w700),
//                                     ),
//                                     SizedBox(
//                                       height: ht * 0.015,
//                                     ),
//                                     Text(
//                                       "- ${books[index].author}",
//                                       maxLines: 1,
//                                       overflow: TextOverflow.ellipsis,
//                                       style: TextStyle(
//                                           fontSize: 10,
//                                           fontWeight: FontWeight.w400),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           );
//                         }),

//                     // ),
//                   );
//                 } else {
//                   return Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//               });
//         });