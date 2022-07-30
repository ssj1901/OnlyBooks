import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onlybook/bookmodel.dart';

class BookPage extends StatefulWidget {
  final Books book;
  BookPage(this.book);

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  @override
  Widget build(BuildContext context) {
    double wt = MediaQuery.of(context).size.width;
    double ht = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(20),
        height: ht * 0.1,
        color: Colors.grey.shade100,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("Rs ${widget.book.price}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
          Container(
              height: ht * 0.3,
              width: wt * 0.35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green,
              ),
              child: Center(
                child: Text(
                  "Chat",
                  style: GoogleFonts.lato(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ))
        ]),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          height: ht,
          width: wt,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back)),
              Container(
                color: Colors.grey.shade200,
                height: ht * 0.3,
                width: wt,
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: Image.network(widget.book.imgPath)),
              ),
              SizedBox(
                height: ht * 0.03,
              ),
              Text(
                widget.book.title,
                style:
                    GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: ht * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    " - ${widget.book.author}",
                    style: GoogleFonts.lato(
                        fontSize: 10, fontWeight: FontWeight.w400),
                  ),
                  // Text(
                  //   widget.book.price,
                  //   style: GoogleFonts.lato(
                  //       fontSize: 10, fontWeight: FontWeight.w300),
                  // ),
                ],
              ),
              SizedBox(
                height: ht * 0.01,
              ),
              Divider(
                thickness: 2,
              ),
              SizedBox(
                height: ht * 0.01,
              ),
              detailcard(wt, ht, Icons.person, "Sold By", widget.book.author),
              detailcard(wt, ht, Icons.date_range, "Year", widget.book.year),
              detailcard(wt, ht, Icons.book, "Course Code", widget.book.course),
            ],
          ),
        ),
      ),
    );
  }

  Widget detailcard(
      double wt, double ht, IconData icon, String title, String subt) {
    return Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Icon(
              icon,
              size: 30,
              color: Colors.purple[900],
            ),
            SizedBox(
              width: wt * 0.03,
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                title,
                style:
                    GoogleFonts.lato(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              Text(
                subt,
                style:
                    GoogleFonts.lato(fontSize: 12, fontWeight: FontWeight.w400),
              ),
            ])
          ],
        ));
  }
}
