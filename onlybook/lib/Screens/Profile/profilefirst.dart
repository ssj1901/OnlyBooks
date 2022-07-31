// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlybook/Screens/Profile/SizeConfig.dart';
import 'package:onlybook/Screens/sellbook/sellbook.dart';
import 'package:onlybook/Screens/soldbook/soldbook.dart';
import 'package:onlybook/bookpage.dart';
import 'package:onlybook/bookmodel.dart';

class Profile extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'HomeScreen App',
              home: ProfileFirst(
                  // title: 'Nick Fury',
                  ),
            );
          },
        );
      },
    );
  }
}

class ProfileFirst extends StatefulWidget {
  ProfileFirst({Key? key}) : super(key: key);

  @override
  _ProfileFirstState createState() => _ProfileFirstState();
}

class _ProfileFirstState extends State<ProfileFirst> {
  var username, branch, fullbranch, year, lastname, uid;
  @override
  Widget build(BuildContext context) {
    double wt = MediaQuery.of(context).size.width;
    double ht = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xffF8F8FA),
      body: Stack(
        // overflow: Overflow.visible,
        children: <Widget>[
          Container(
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
            height: 40 * SizeConfig.heightMultiplier,
            child: Padding(
              padding: EdgeInsets.only(
                  left: 30.0,
                  right: 30.0,
                  top: 10 * SizeConfig.heightMultiplier),
              child: FutureBuilder(
                future: _fetch(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done)
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  return Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            height: 11 * SizeConfig.heightMultiplier,
                            width: 22 * SizeConfig.widthMultiplier,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage("assets/profileimg.png"))),
                          ),
                          SizedBox(
                            width: 5 * SizeConfig.widthMultiplier,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "${username} ${lastname}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 3 * SizeConfig.textMultiplier,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 1 * SizeConfig.heightMultiplier,
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 3 * SizeConfig.heightMultiplier,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: wt * 0.6,
                                child: Text(
                                  fullbranch,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(
                                    //white70
                                    color: Colors.black87,
                                    fontSize: 1.9 * SizeConfig.textMultiplier,
                                  ),
                                ),
                              ),
                              Text(
                                "Year: ${year}",
                                style: TextStyle(
                                  // color: Colors.white70,
                                  color: Colors.black87,
                                  fontSize: 1.9 * SizeConfig.textMultiplier,
                                ),
                              ),
                            ],
                          ),
                          // Column(
                          //   children: <Widget>[
                          //     Text(
                          //       "543",
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontSize: 3 * SizeConfig.textMultiplier,
                          //           fontWeight: FontWeight.bold),
                          //     ),

                          //   ],
                          // ),
                          InkWell(
                            onTap: () {
                              FirebaseAuth.instance.signOut();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  // color: Colors.white60
                                  color: Colors.black38,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Log Out",
                                  style: TextStyle(
                                      // color: Colors.white60,
                                      color: Colors.black87,
                                      fontSize:
                                          1.8 * SizeConfig.textMultiplier),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 35 * SizeConfig.heightMultiplier),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0),
                  )),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          left: 30.0, top: 3 * SizeConfig.heightMultiplier),
                      child: Text(
                        "Books Kept for Selling",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 2.2 * SizeConfig.textMultiplier),
                      ),
                    ),
                    SizedBox(
                      height: 3 * SizeConfig.heightMultiplier,
                    ),
                    ReadSelling(ht, wt),
                    SizedBox(
                      height: 3 * SizeConfig.heightMultiplier,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30.0, right: 30.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Books Sold",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 2.2 * SizeConfig.textMultiplier),
                          ),
                          Spacer(),
                          // Text(
                          //   "View All",
                          //   style: TextStyle(
                          //       color: Colors.grey,
                          //       fontSize: 1.7 * SizeConfig.textMultiplier),
                          // ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 3 * SizeConfig.heightMultiplier,
                    ),
                    ReadSold(ht, wt),
                    // Container(
                    //   height: 20 * SizeConfig.heightMultiplier,
                    //   child:
                    //  ListView(
                    //   scrollDirection: Axis.horizontal,
                    //   children: <Widget>[
                    //     _favoriteCard("assets/travelfive.png"),
                    //     _favoriteCard("assets/travelthree.png"),
                    //     _favoriteCard("assets/travelfive.png"),
                    //     SizedBox(
                    //       width: 10 * SizeConfig.widthMultiplier,
                    //     )
                    //   ],
                    // ),
                    // ),
                    SizedBox(
                      height: 3 * SizeConfig.heightMultiplier,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      //body: Text('data'),
    );
  }

  Widget ReadSold(double ht, double wt) {
    return FutureBuilder(
        future: _fetch(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done)
            return Text("Loading");
          return StreamBuilder<List<Books>>(
              stream: readSoldBooks(),
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
                                        SoldBook(books[index])),
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
                                          child: books[index].imgPath == ""
                                              ? Image.network(
                                                  'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg?20200913095930')
                                              : Image.network(
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

  Widget ReadSelling(double ht, double wt) {
    return FutureBuilder(
        future: _fetch(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done)
            return Text("Loading");
          return StreamBuilder<List<Books>>(
              stream: readSellingBooks(),
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
                        itemCount: books.length < 4 ? books.length : 4,
                        itemBuilder: (BuildContext ctx, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) =>
                                        SellBook(books[index])),
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
                                          child: books[index].imgPath == ""
                                              ? Image.network(
                                                  'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg?20200913095930')
                                              : Image.network(
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

  _fetch() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser!;
    if (firebaseUser != null)
      await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser.uid)
          .get()
          .then((value) {
        username = value.data()!['FirstName'];
        lastname = value.data()!['LastName'];
        year = value.data()!['Year'];
        branch = value.data()!['Branch'];
        uid = firebaseUser.uid;
        if (branch == "CSE") fullbranch = "Computer Science Engineering";
        if (branch == "ECE")
          fullbranch = "Electronics and Communication Engineering";
        if (branch == "EEE")
          fullbranch = "Electrical and Electronics Engineering";
        if (branch == "BME") fullbranch = "Biomedical Engineering";
        if (branch == "ME") fullbranch = "Mechanical Engineering";
        print(year);
        print(username);
        print(branch);
      });
  }

  Stream<List<Books>> readSellingBooks() => FirebaseFirestore.instance
      .collection('books')
      .where('userid', isEqualTo: uid)
      .where('Sold', isEqualTo: 'false')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => Books.fromJson(doc.data(), doc.id))
          .toList());

  Stream<List<Books>> readSoldBooks() => FirebaseFirestore.instance
      .collection('books')
      .where('userid', isEqualTo: uid)
      .where('Sold', isEqualTo: 'true')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => Books.fromJson(doc.data(), doc.id))
          .toList());
}
