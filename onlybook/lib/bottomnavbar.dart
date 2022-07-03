import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'home.dart';
import 'sell.dart';
import 'profile.dart';
import 'package:google_fonts/google_fonts.dart';

class Navig extends StatefulWidget {

  @override
  _NavigState createState() => _NavigState();
}

class _NavigState extends State<Navig> {
  int _currentIndex = 0;
  List<Widget>  _page = [
    Home(),
    Profile(),
  ];
  @override

  Widget build(BuildContext context) {
    var wid = MediaQuery.of(context).size.width;
    var ht = MediaQuery.of(context).size.height;
    return Scaffold(
       body: 
        _page[_currentIndex],
       
         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
              Navigator.push(context, CupertinoPageRoute(
                                                  builder: (context) => sellPage()
                                                      ),);
              });
             },
            tooltip: 'Increment',
            child: Icon(Icons.add),
            elevation: 2.0,
            
          ),
       bottomNavigationBar: BottomNavigationBar(
         selectedLabelStyle: GoogleFonts.poppins(),
         iconSize: 30,
         selectedFontSize: 8,
         selectedItemColor: Colors.blue,
         unselectedItemColor: Colors.black12,
         showSelectedLabels: true,
         showUnselectedLabels: false,
         currentIndex: _currentIndex,
         onTap: (int index){
             setState(() {
            _currentIndex = index;
          });
         },

         items: [
           BottomNavigationBarItem(
             icon: Icon(Icons.home),
             label: 'Home'),
          //  BottomNavigationBarItem(
          //    label: 'Explore',
          //    icon: Icon(Icons.explore)),
           BottomNavigationBarItem(
             label: 'Profile',
             icon: Icon(Icons.person))
         ],
       )
      //  BottomAppBar(
      //    shape: CircularNotchedRectangle(),
      //    notchMargin: 10,
      //    child: Container(
      //      color: Colors.grey[200],
      //      height:70.h,
      //      child: Row(
      //        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //        children: [
      //          Row(
      //            crossAxisAlignment: CrossAxisAlignment.center,
      //            children: [
      //              MaterialButton(onPressed: (){
      //                setState((){
      //                  _currentIndex = 0;
      //                });
      //              },
      //              minWidth: width/2,
      //              child:Icon(
      //                _currentIndex==0?Icons.home_rounded:Icons.home_outlined,
      //                 size: 25.h,
      //                color:_currentIndex==0?Colors.orange:Colors.black,
      //              ),
      //              ),
      //              // Expanded(),
      //              MaterialButton(onPressed: (){
      //                setState((){
      //                  _currentIndex = 1;
      //                });
      //              },
      //              minWidth: width/2,
      //              child:Icon(
      //                _currentIndex==1?Icons.shopping_cart_rounded:Icons.shopping_cart_outlined, size: 25.h,
      //                color:_currentIndex==1?Colors.orange:Colors.black,
                     
      //              ),
      //              ),
      //            ]
      //          ),
      //        ]
      //      )
      //    ),
      //  ),
        
        
    );
  }
}