import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlybook/bookmodel.dart';
import 'package:onlybook/bookpage.dart';
import 'package:onlybook/constants.dart';

class Search extends StatefulWidget {
  Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String name = "";
  @override
  Widget build(BuildContext context) {
    double wt = MediaQuery.of(context).size.width;
    double ht = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            title: Container(
              width: wt * 0.8,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(50)),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search), hintText: 'Search...'),
                onChanged: (val) {
                  setState(() {
                    name = val;
                  });
                },
              ),
            )),
        body: StreamBuilder<List<Books>>(
          stream: readBooks(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final books = snapshot.data!;
              // return (snapshots.connectionState == ConnectionState.waiting)
              //     ? Center(
              //         child: CircularProgressIndicator(),
              //       )
              //     :
              return ListView.builder(
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    // var data = snapshots.data!.docs[index].data()
                    //     as Map<String, dynamic>;
                    //var books = readBooks();
                    print(books.length);
                    if (name.isEmpty) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => BookPage(books[index])),
                          );
                        },
                        child: ListTile(
                          title: Text(
                            books[index].title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            // data['Author'],
                            books[index].author,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          leading: Icon(Icons.bookmark, color: kPrimaryColor),
                        ),
                      );
                    }
                    if (books[index]
                        .title
                        .toString()
                        .toLowerCase()
                        .startsWith(name.toLowerCase())) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => BookPage(books[index])),
                          );
                        },
                        child: ListTile(
                          title: Text(
                            //     data['Title'],
                            books[index].title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            //     data['Author'],
                            books[index].author,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          leading: Icon(Icons.bookmark, color: kPrimaryColor),
                        ),
                      );
                    }
                    return Container();
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }

  Stream<List<Books>> readBooks() => FirebaseFirestore.instance
      .collection('books')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => Books.fromJson(doc.data(), doc.id))
          .toList());
}
