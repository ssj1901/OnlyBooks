// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlybook/Screens/Profile/SizeConfig.dart';
import 'package:onlybook/bookpage.dart';
import 'package:onlybook/mp.dart';

void main() => runApp(Profile());

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
                title: 'Nick Fury',
              ),
            );
          },
        );
      },
    );
  }
}

class ProfileFirst extends StatefulWidget {
  ProfileFirst({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ProfileFirstState createState() => _ProfileFirstState();
}

class _ProfileFirstState extends State<ProfileFirst> {
  @override
  Widget build(BuildContext context) {
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
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        height: 11 * SizeConfig.heightMultiplier,
                        width: 22 * SizeConfig.widthMultiplier,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/profileimg.png"))),
                      ),
                      SizedBox(
                        width: 5 * SizeConfig.widthMultiplier,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Steve Sam Jacob",
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
                          Text(
                            "Computer Science Engineering",
                            style: TextStyle(
                              //white70
                              color: Colors.black87,
                              fontSize: 1.9 * SizeConfig.textMultiplier,
                            ),
                          ),
                          Text(
                            "6th Semester",
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
                      Container(
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
                            "EDIT PROFILE",
                            style: TextStyle(
                                // color: Colors.white60,
                                color: Colors.black87,
                                fontSize: 1.8 * SizeConfig.textMultiplier),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
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
                        "Books Bought",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 2.2 * SizeConfig.textMultiplier),
                      ),
                    ),
                    SizedBox(
                      height: 3 * SizeConfig.heightMultiplier,
                    ),
                    Container(
                      height: 37 * SizeConfig.heightMultiplier,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          _myAlbumCard(
                              "assets/travelfive.png",
                              "assets/traveltwo.png",
                              "assets/travelsix.png",
                              "assets/travelthree.png",
                              "+178",
                              "Semester 4"),
                          _myAlbumCard(
                              "assets/travelsix.png",
                              "assets/travelthree.png",
                              "assets/travelfour.png",
                              "assets/travelfive.png",
                              "+18",
                              "Semester 5"),
                          _myAlbumCard(
                              "assets/travelfive.png",
                              "assets/travelsix.png",
                              "assets/traveltwo.png",
                              "assets/travelone.png",
                              "+1288",
                              "Semester 6"),
                          SizedBox(
                            width: 10 * SizeConfig.widthMultiplier,
                          ),
                        ],
                      ),
                    ),
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
                          Text(
                            "View All",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 1.7 * SizeConfig.textMultiplier),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 3 * SizeConfig.heightMultiplier,
                    ),
                    Recommended(context),
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
    );
  }

  _myAlbumCard(String asset1, String asset2, String asset3, String asset4,
      String more, String name) {
    return Padding(
      padding: const EdgeInsets.only(left: 40.0),
      child: Container(
        height: 37 * SizeConfig.heightMultiplier,
        width: 60 * SizeConfig.widthMultiplier,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(color: Colors.grey, width: 0.2)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      (Books.books[0].imgPath),
                      height: 27 * SizeConfig.imageSizeMultiplier,
                      width: 27 * SizeConfig.imageSizeMultiplier,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Spacer(),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      (Books.books[2].imgPath),
                      height: 27 * SizeConfig.imageSizeMultiplier,
                      width: 27 * SizeConfig.imageSizeMultiplier,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 1 * SizeConfig.heightMultiplier,
              ),
              Row(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      (Books.books[3].imgPath),
                      height: 27 * SizeConfig.imageSizeMultiplier,
                      width: 27 * SizeConfig.imageSizeMultiplier,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Spacer(),
                  Stack(
                    // overflow: Overflow.visible,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          (Books.books[4].imgPath),
                          height: 27 * SizeConfig.imageSizeMultiplier,
                          width: 27 * SizeConfig.imageSizeMultiplier,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        child: Container(
                          height: 27 * SizeConfig.imageSizeMultiplier,
                          width: 27 * SizeConfig.imageSizeMultiplier,
                          decoration: BoxDecoration(
                              color: Colors.black38,
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Center(
                            child: Text(
                              more,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 2.5 * SizeConfig.textMultiplier,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 10.0, top: 2 * SizeConfig.heightMultiplier),
                child: Text(
                  name,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 2 * SizeConfig.textMultiplier,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _favoriteCard(String s) {
    return Padding(
      padding: const EdgeInsets.only(left: 40.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Image.asset(
          s,
          height: 20 * SizeConfig.heightMultiplier,
          width: 70 * SizeConfig.widthMultiplier,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

Widget Recommended(BuildContext context) {
  return Container(
    height: 35 * SizeConfig.heightMultiplier,
    // width: 30 * SizeConfig.heightMultiplier,
    child: GridView.builder(
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, childAspectRatio: 1.4),
        itemCount: Books.books.length,
        itemBuilder: (BuildContext ctx, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (context) => BookPage(Books.books[index])),
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
                height: SizeConfig.heightMultiplier * 30,
                width: SizeConfig.widthMultiplier * 10,
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      height: SizeConfig.heightMultiplier * 15,
                      decoration: BoxDecoration(
                          // color: Colors.grey,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Image.network(Books.books[index].imgPath)),
                    ),
                    Text(
                      Books.books[index].date,
                      style:
                          TextStyle(fontSize: 9, fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier,
                    ),
                    Text(
                      Books.books[index].name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier,
                    ),
                    Text(
                      "Rs ${Books.books[index].price}",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 1.5,
                    ),
                    Text(
                      "- ${Books.books[index].author}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
  );
}
