import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onlybook/bookmodel.dart';
import 'package:onlybook/constants.dart';
import 'package:onlybook/services/database.dart';

class SellBook extends StatefulWidget {
  final Books book;
  SellBook(this.book);

  @override
  State<SellBook> createState() => _SellBookState();
}

class _SellBookState extends State<SellBook> {
  @override
  Widget build(BuildContext context) {
    double wt = MediaQuery.of(context).size.width;
    double ht = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(20),
        height: ht * 0.1,
        color: Colors.grey.shade100,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          // Text("Rs ${widget.book.price}",
          //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
          InkWell(
            onTap: () async {
              final collection = FirebaseFirestore.instance.collection('books');
              await collection
                  .doc(widget.book.bookid) // <-- Doc ID to be deleted.
                  .update({'Sold': 'true'});
              await showDialog(
                context: context,
                builder: (BuildContext context) => _buildPopup(context),
              );
              Navigator.pop(context);
            },
            child: Container(
                height: ht * 0.3,
                width: wt * 0.35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green,
                ),
                child: Center(
                  child: Text(
                    "Sold",
                    style: GoogleFonts.lato(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                )),
          ),
          InkWell(
            onTap: () async {
              final collection = FirebaseFirestore.instance.collection('books');
              collection
                  .doc(widget.book.bookid) // <-- Doc ID to be deleted.
                  .delete() // <-- Delete
                  .then((_) => print('Deleted'))
                  .catchError((error) => print('Delete failed: $error'));
              await showDialog(
                context: context,
                builder: (BuildContext context) => _buildDeletePopup(context),
              );
              Navigator.pop(context);
            },
            child: Container(
                height: ht * 0.3,
                width: wt * 0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green,
                ),
                child: Center(
                  child: Text(
                    "Delete",
                    style: GoogleFonts.lato(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                )),
          )
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
                  child: widget.book.imgPath == ""
                      ? Image.network(
                          'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg?20200913095930')
                      : Image.network(
                          widget.book.imgPath,
                          fit: BoxFit.contain,
                        ),
                ),
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
              detailcard(wt, ht, Icons.person, "Sold By", widget.book.seller),
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

  Widget _buildPopup(BuildContext context) {
    return new AlertDialog(
      title: const Text('Book SuccessFully Sold'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        // children: <Widget>[
        //   Text("Hello"),
        // ],
      ),
      actions: <Widget>[
        new InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: Center(
                child: Text(
                  'OK',
                  style: GoogleFonts.lato(color: Colors.white, fontSize: 17),
                ),
              ),
            )),
      ],
    );
  }

  Widget _buildDeletePopup(BuildContext context) {
    return new AlertDialog(
      title: const Text('Book SuccessFully Deleted'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        // children: <Widget>[
        //   Text("Hello"),
        // ],
      ),
      actions: <Widget>[
        new InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: Center(
                child: Text(
                  'OK',
                  style: GoogleFonts.lato(color: Colors.white, fontSize: 17),
                ),
              ),
            )),
      ],
    );
  }
}
