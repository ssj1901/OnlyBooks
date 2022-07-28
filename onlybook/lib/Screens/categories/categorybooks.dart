import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../bookpage.dart';
import '../../mp.dart';

class CategoryBooks extends StatefulWidget {
  final index1, index2, sub;

  CategoryBooks(this.index1, this.index2, this.sub);

  @override
  State<CategoryBooks> createState() => _CategoryBooksState();
}

class _CategoryBooksState extends State<CategoryBooks> {
  @override
  Widget build(BuildContext context) {
    double wt = MediaQuery.of(context).size.width;
    double ht = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
            children: [
              // SizedBox(
              //   height: ht * 0.02,
              // ),
              Container(
                height: ht * 0.13,
                padding: EdgeInsets.only(top: 20),
                color: Colors.white,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back)),
                    SizedBox(
                      width: wt * 0.07,
                    ),
                    Text(
                      "${widget.sub} Books for Sem ${widget.index1} and ${widget.index2}",
                      style: GoogleFonts.lato(fontSize: 22),
                    ),
                  ],
                ),
              ),
              // SizedBox(
              //   height: ht * 0.005,
              // ),
              Container(
                height: ht,
                width: wt,
                child: Center(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                      height: ht,
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 0.6),
                          itemCount: Books.books.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) =>
                                          BookPage(Books.books[index])),
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
                                  height: ht * 0.3,
                                  // width: 20,
                                  alignment: Alignment.center,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                Books.books[index].imgPath)),
                                      ),
                                      Text(
                                        Books.books[index].date,
                                        style: TextStyle(
                                            fontSize: 9,
                                            fontWeight: FontWeight.w300),
                                      ),
                                      SizedBox(
                                        height: ht * 0.01,
                                      ),
                                      Text(
                                        Books.books[index].name,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: ht * 0.01,
                                      ),
                                      Text(
                                        "Rs ${Books.books[index].price}",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      SizedBox(
                                        height: ht * 0.015,
                                      ),
                                      Text(
                                        "- ${Books.books[index].author}",
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
                    ),
                    // ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
