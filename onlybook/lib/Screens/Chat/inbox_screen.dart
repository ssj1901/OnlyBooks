// import 'package:flutter/material.dart';
// import 'package:onlybook/Models/message_model.dart';
// import 'package:onlybook/Screens/Chat/chat_screen.dart';

// class InboxScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
// backgroundColor: Colors.purple[900],
// //    brightness: Brightness.dark,
// elevation: 8,
// leading: IconButton(
//   icon: Icon(Icons.arrow_back),
//   color: Colors.white,
//   onPressed: () {
//     Navigator.pop(context);
//   },
// ),
// title: Text(
//   'Inbox',
//   style: TextStyle(
//     color: Colors.white,
//   ),
// ),
//         // actions: <Widget>[
//         //   IconButton(
//         //     icon: Icon(Icons.search),
//         //     color: Colors.white,
//         //     onPressed: () {},
//         //   ),
//         // ],
//       ),
//       body: ListView.builder(
//         itemCount: chats.length,
//         itemBuilder: (BuildContext context, int index) {
//           final Message chat = chats[index];
//           return GestureDetector(
//             onTap: () => Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (_) => ChatScreen(
//                   user: chat.sender,
//                 ),
//               ),
//             ),
//             child: Container(
//               padding: EdgeInsets.symmetric(
//                 horizontal: 20,
//                 vertical: 15,
//               ),
//               child: Row(
//                 children: <Widget>[
//                   Container(
//                     padding: EdgeInsets.all(2),
//                     decoration: chat.unread
//                         ? BoxDecoration(
//                             borderRadius: BorderRadius.all(Radius.circular(40)),
//                             border: Border.all(
//                               width: 2,
//                               color: Theme.of(context).primaryColor,
//                             ),
//                             // shape: BoxShape.circle,
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.grey.withOpacity(0.5),
//                                 spreadRadius: 2,
//                                 blurRadius: 5,
//                               ),
//                             ],
//                           )
//                         : BoxDecoration(
//                             shape: BoxShape.circle,
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.grey.withOpacity(0.5),
//                                 spreadRadius: 2,
//                                 blurRadius: 5,
//                               ),
//                             ],
//                           ),
//                     child: CircleAvatar(
//                       radius: 35,
//                       // backgroundImage: AssetImage(chat.sender.imageUrl),
//                     ),
//                   ),
//                   Container(
//                     width: MediaQuery.of(context).size.width * 0.65,
//                     padding: EdgeInsets.only(
//                       left: 20,
//                     ),
//                     child: Column(
//                       children: <Widget>[
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: <Widget>[
//                             Row(
//                               children: <Widget>[
//                                 Text(
//                                   chat.sender.name,
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 chat.sender.isOnline
//                                     ? Container(
//                                         margin: const EdgeInsets.only(left: 5),
//                                         width: 7,
//                                         height: 7,
//                                         decoration: BoxDecoration(
//                                           shape: BoxShape.circle,
//                                           color: Theme.of(context).primaryColor,
//                                         ),
//                                       )
//                                     : Container(
//                                         child: null,
//                                       ),
//                               ],
//                             ),
//                             Text(
//                               chat.time,
//                               style: TextStyle(
//                                 fontSize: 11,
//                                 fontWeight: FontWeight.w300,
//                                 color: Colors.black54,
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Container(
//                           alignment: Alignment.topLeft,
//                           child: Text(
//                             chat.text,
//                             style: TextStyle(
//                               fontSize: 13,
//                               color: Colors.black54,
//                             ),
//                             overflow: TextOverflow.ellipsis,
//                             maxLines: 2,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'ChatRoom.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  Map<String, dynamic>? userMap;
  List<QueryDocumentSnapshot<Map<String, dynamic>>>? userList;
  List<String> toUserList = [];
  List<String> toUserIDList = [];
  bool isLoading = false;
  final TextEditingController _search = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addObserver(this);
    setStatus("Online");
    onSearch();
  }

  void setStatus(String status) async {
    await _firestore.collection('users').doc(_auth.currentUser!.uid).update({
      "status": status,
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // online
      setStatus("Online");
    } else {
      // offline
      setStatus("Offline");
    }
  }

  String chatRoomId(String user1, String user2) {
    if (user1[0].toLowerCase().codeUnits[0] >
        user2.toLowerCase().codeUnits[0]) {
      return "$user1$user2";
    } else {
      return "$user2$user1";
    }
  }

  void onSearch() async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    setState(() {
      isLoading = true;
    });

    await _firestore
        .collection('chatroom')
        .where('users', arrayContains: _auth.currentUser!.displayName!)
        .get()
        .then((value) {
      setState(() {
        userList = value.docs;
        isLoading = false;
      });
      for (int i = 0; i < userList!.length; ++i) {
        if (userList![i].data()['users'][0] != _auth.currentUser!.displayName!)
          toUserList.insert(i, userList![i].data()['users'][0]);
        else
          toUserList.insert(i, userList![i].data()['users'][1]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[900],
        //    brightness: Brightness.dark,
        elevation: 8,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Inbox',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: isLoading
          ? Center(
              child: Container(
                height: size.height / 20,
                width: size.height / 20,
                child: CircularProgressIndicator(),
              ),
            )
          : Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                userList != null
                    ? SizedBox(
                        height: size.height * 0.6,
                        child: ListView.builder(
                          itemCount: userList!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              child: ListTile(
                                dense: true,
                                visualDensity: VisualDensity(vertical: 3),
                                onTap: () {
                                  String roomId = chatRoomId(
                                      _auth.currentUser!.displayName!,
                                      toUserList[index]);

                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => ChatRoom(
                                        chatRoomId: roomId,
                                        toUserName: toUserList![index],
                                      ),
                                    ),
                                  );
                                },
                                leading: Icon(Icons.account_box,
                                    color: Colors.purple[900]),
                                title: Text(
                                  toUserList[index],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                trailing:
                                    Icon(Icons.chat, color: Colors.purple[900]),
                              ),
                            );
                          },
                        ),
                      )
                    : Container(),
              ],
            ),
    );
  }
}
