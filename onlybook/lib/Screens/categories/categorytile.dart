import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onlybook/Screens/categories/categorybooks.dart';

class Categorytile extends StatelessWidget {
  final sub;
  Categorytile(this.sub);

  @override
  Widget build(BuildContext context) {
    double wt = MediaQuery.of(context).size.width;
    double ht = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Container(
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
          ),
          Positioned(
            top: ht * 0.1,
            left: wt * 0.3,
            child: Text(
              "Select",
              style: GoogleFonts.lato(
                  fontSize: 36,
                  fontWeight: FontWeight.w300,
                  color: Colors.purple[900]),
            ),
          ),
          Positioned(
            top: ht * 0.14,
            left: wt * 0.5,
            child: Text(
              "Year",
              style: GoogleFonts.lato(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple[900]),
            ),
          ),
          Positioned(
              top: ht * 0.3,
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
                child: Column(
                  children: [
                    SizedBox(
                      height: ht * 0.03,
                    ),
                    Container(
                      height: ht * 0.65,
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 0.8),
                          itemCount: 4,
                          itemBuilder: (BuildContext ctx, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => CategoryBooks(
                                            index + 1,
                                            (index * 2) + 1,
                                            (index * 2) + 2,
                                            sub)));
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
                                      children: [
                                        Text('Year'),
                                        SizedBox(
                                          height: ht * 0.03,
                                        ),
                                        Text(
                                          "${index + 1}",
                                          style: GoogleFonts.lato(
                                              fontSize: 85,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.purple[900]),
                                        ),
                                        SizedBox(
                                          height: ht * 0.04,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Sem ${((index * 2) + 1)}'),
                                            Text('Sem ${((index * 2) + 2)}'),
                                          ],
                                        )
                                      ],
                                    )),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
