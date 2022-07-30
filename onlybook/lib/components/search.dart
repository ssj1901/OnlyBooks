//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlybook/bookpage.dart';
import 'package:onlybook/bookmodel.dart';

import '../Screens/Login/login_screen.dart';

class DataSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(
            Icons.clear,
          ))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: AnimatedIcon(
          color: Colors.purple[900],
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: Colors.red,
    );
    // throw  Navigator.push(
    //                                     context,
    //                                     CupertinoPageRoute(builder: (context) => LoginScreen()),
    //                                   );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return StreamBuilder<List<Books>>(
      stream: readBooks(),
      builder: (context, snapshots) {
        if (snapshots.hasData) {
          final books = snapshots.data!;
          return ListView.builder(
              itemCount: books.length,
              itemBuilder: (context, index) {
                //  var data = books[index].data()
                //     as Map<String, dynamic>;

                if (query.isEmpty) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => BookPage(books[index])),
                      );
                    },
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
                      books[index].author,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    // leading: CircleAvatar(
                    //   backgroundImage: NetworkImage(data['image']),
                    // ),
                  );
                }
                if (books[index]
                    .title
                    .toString()
                    .toLowerCase()
                    .startsWith(query.toLowerCase())) {
                  return ListTile(
                    onTap: (() {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => BookPage(books[index])),
                      );
                    }),
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
                      books[index].author,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    // leading: CircleAvatar(
                    //   backgroundImage: NetworkImage(data['image']),
                    // ),
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
    );
    // final suggestionList = query.isEmpty
    //     ? Books.recentbooks
    //     : Books.books
    //         .where((p) => p.name.toLowerCase().startsWith(query))
    //         .toList();

    // return ListView.builder(
    //   itemBuilder: (context, index) => ListTile(
    //     onTap: () {
    //       // showResults(context);
    //       Navigator.push(
    //         context,
    //         CupertinoPageRoute(
    //             builder: (context) => BookPage(suggestionList[index])),
    //       );
    //     },
    //     leading: Icon(
    //       Icons.bookmark,
    //       color: Colors.purple[900],
    //     ),
    //     title: RichText(
    //       text: TextSpan(
    //           text: suggestionList[index].name.substring(0, query.length),
    //           style:
    //               TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
    //           children: [
    //             TextSpan(
    //                 text: suggestionList[index].name.substring(query.length),
    //                 style: TextStyle(
    //                   color: Colors.black54,
    //                 )),
    //           ]),
    //     ),
    //   ),
    //   itemCount: suggestionList.length,
    // );
  }

  Stream<List<Books>> readBooks() => FirebaseFirestore.instance
      .collection('books')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Books.fromJson(doc.data())).toList());
}

// class DataSearch extends StatefulWidget {
//   const DataSearch({Key? key}) : super(key: key);

//   @override
//   State<DataSearch> createState() => _DataSearchState();
// }

// class _DataSearchState extends State<DataSearch> {
//   @override
//   Widget build(BuildContext context) {
    
//   }
// }