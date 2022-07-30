// //import 'dart:html';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:onlybook/bookpage.dart';
// import 'package:onlybook/mp.dart';

// import '../Screens/Login/login_screen.dart';


// class DataSearch extends SearchDelegate{
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [IconButton(onPressed: (){ query="";},
//               icon: Icon(Icons.clear,))];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(onPressed: (){
//       close(context,null);
//     }, icon: AnimatedIcon(
//       color:Colors.purple[900],
//       icon:AnimatedIcons.menu_arrow,
//       progress: transitionAnimation,));
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     return Container(
//       height: 100,
//       width: 100,
//       color: Colors.red,
//     );
//     // throw  Navigator.push(
//     //                                     context,
//     //                                     CupertinoPageRoute(builder: (context) => LoginScreen()),
//     //                                   );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     final suggestionList = query.isEmpty
//      ? Books.recentbooks  
//      : Books.books.where((p)=>p.name.toLowerCase().startsWith(query)).toList();

//     return ListView.builder(itemBuilder: (context,index)=>ListTile(
//       onTap: (){
//        // showResults(context);
//        Navigator.push(
//                                         context,
//                                         CupertinoPageRoute(builder: (context) => BookPage(suggestionList[index])),
//                                       );
//       },
//           leading: Icon(Icons.bookmark,color: Colors.purple[900],),
//           title: RichText(
//             text: TextSpan( 
//               text: suggestionList[index].name.substring(0,query.length),
//               style: TextStyle(color: Colors.black,fontWeight:FontWeight.w500),
//               children: [
//                 TextSpan( 
//               text: suggestionList[index].name.substring(query.length),
//               style: TextStyle(color: Colors.black54,)),
//               ]
//             ),
//           ),
//     ),
//     itemCount: suggestionList.length,
//     );
//   }
// }