import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'mp.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double wt = MediaQuery.of(context).size.width;
    double ht = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          TopPart(ht),
        
            Positioned(
              top: ht*0.21,
              child: Container(
                padding: EdgeInsets.only(left:10),
                height: ht*0.9,
                width: wt,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    SizedBox(height:ht*0.06),
                    Text(
                  'Categories',
                  style:
                      GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                  SizedBox(height:ht*0.02),
                  Categories(ht, wt),
                  SizedBox(height: ht*0.02,),
                  Text(
                  'Recommendations',
                  style:
                      GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                 SizedBox(height: ht*0.02),

                Recommended(ht)
          
                  ]
                ),
              ),
            ),
            SearchBar(ht, wt),
      ],
      ),
    );
  }

  Widget Recommended(double ht) {
    return SingleChildScrollView(
                scrollDirection:Axis.vertical,
                  child: Container(
                    height: ht*0.4,                
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 0.6),
                        itemCount: Books.books.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return InkWell(
                            onTap: (){},
                            child: Card(
                              shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10) ),
                              color: Colors.white,
                              elevation: 2,
                              margin: EdgeInsets.all(8),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                height: ht*0.3,
                                // width: 20,
                                alignment: Alignment.center,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      height: ht*0.2,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: Image.network(Books.books[index].imgPath),
                                    ),
                                    
                                    Text(Books.books[index].date,style: TextStyle(fontSize: 9,fontWeight:FontWeight.w300),),
                                    SizedBox(height: ht*0.01,),
                                    Text(Books.books[index].name,maxLines:1,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 12,fontWeight:FontWeight.w500),),
                                    SizedBox(height: ht*0.01,),
                                    Text("Rs ${Books.books[index].price}",style: TextStyle(fontSize: 18,fontWeight:FontWeight.w700),),
                                    SizedBox(height: ht*0.015,),
                                    Text("- ${Books.books[index].author}",maxLines:1,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 10,fontWeight:FontWeight.w400),),
                                  ],
                                ),
                                
                              ),
                            ),
                          );
                        }),
                  ),
               // ),
              );
  }

  Widget Categories(double ht, double wt) {
    return InkWell(
      onTap:(){},
      child: Container(
                    height: ht*0.14,
                    //color: Colors.black,
                    child: ListView(scrollDirection: Axis.horizontal, children: [
                      Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                        categoriesWidget(
                          "CSE",
                          'assets/programmingcomputer.json',
                          ht,wt
                        //  Colors.yellow,
                        ),
                        categoriesWidget(
                          "ECE",
                          'assets/bulb.json',
                          ht,wt
                        //  Colors.red,
                        ),
                        categoriesWidget(
                          "EBE",
                          'assets/biomedical.json',ht,wt
                        //  Colors.cyan,
                        ),
                        categoriesWidget(
                          "EEE",
                          'assets/electronics.json',ht,wt
                        //  Colors.yellow,
                        ),
                        categoriesWidget(
                          "MECH",
                          'assets/mechanic.json',ht,wt
                        //  Colors.red,
                        ),
                      ]),
                    ])),
    );
  }

  Widget SearchBar(double ht, double wt) {
    return Positioned(
            top: ht*0.18,
          child:Container(
                margin: EdgeInsets.fromLTRB(wt*0.08, 0,0, 0),
                width: wt*0.85,
                height: 50,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black26,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                  
                  child: CupertinoSearchTextField(
                    backgroundColor: Colors.white,
                    borderRadius:BorderRadius.all(Radius.circular(20)),
                    onChanged: (){},
                  ) 
                // Row(
                //   children: [
                //     Icon(Icons.search),
                //     SizedBox(
                //       width: 10,
                //     ),
                //     Text("Search"),
                //   ],
                // ),
              ),);
  }

  Widget TopPart(double ht) {
    return Container(
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

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: ht*0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome,',
                          style: GoogleFonts.ubuntu(
                              textStyle: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold,color: Colors.purple[900])),
                        ),
                        Text(
                          'Steve',
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w400,color: Colors.purple[900])),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          'Buy and Sell Books',
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400)),
                        ),
                      ],
                    ),
                  ),
                  Material(
                    elevation: 20,
                   // color: Colors.transparent,
                    borderRadius: BorderRadius.circular(30),
                    child: InkWell(
                      onTap: (){},
                      child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            boxShadow: [
                            BoxShadow(
                              color: Colors.transparent,
                              offset: Offset(2.0, 2.0), //(x,y)
                              blurRadius: 2.0,
                            ),
                          ], 
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                          child: Icon(Icons.chat,color: Colors.purple[900],)),
                    ),
                  ),
                ],
              ),
              // SizedBox(
              //   height: 20,
              // ),
            ],
        ),
        );
  }

  Widget categoriesWidget(String text, String url,double ht,double wt) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10),
      color: Colors.white,
      shadowColor: Colors.grey.shade400,
      elevation: 2,
      child: Container(    
        height: ht*0.12,
        
        width: wt*0.26,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: ht*0.08,
              child: Lottie.asset(url,fit: BoxFit.cover)),
            Text(text,style: GoogleFonts.lato(fontWeight: FontWeight.w500),),
          ],
        ),
      ),
    );
  }
}

// final List<Map> books = [
//   {
//     "url":
//         "https://rukminim1.flixcart.com/image/416/416/regionalbooks/r/e/f/mathematics-rd-sharma-class-8th-original-imaecqrggjqt3dhs.jpeg?q=70",
//     "name": "R.D. Sharma",
//     "price": "Rs 250"
//   },
//   {
//     "url":
//         "https://rukminim1.flixcart.com/image/416/416/regionalbooks/r/e/f/mathematics-rd-sharma-class-8th-original-imaecqrggjqt3dhs.jpeg?q=70",
//     "name": "R.D. Sharma",
//     "price": "Rs 250"
//   },
//   {
//     "url":
//         "https://rukminim1.flixcart.com/image/416/416/regionalbooks/r/e/f/mathematics-rd-sharma-class-8th-original-imaecqrggjqt3dhs.jpeg?q=70",
//     "name": "R.D. Sharma",
//     "price": "Rs 250"
//   },
//   {
//     "url":
//         "https://rukminim1.flixcart.com/image/416/416/regionalbooks/r/e/f/mathematics-rd-sharma-class-8th-original-imaecqrggjqt3dhs.jpeg?q=70",
//     "name": "R.D. Sharma",
//     "price": "Rs 250"
//   },
//   {
//     "url":
//         "https://rukminim1.flixcart.com/image/416/416/regionalbooks/r/e/f/mathematics-rd-sharma-class-8th-original-imaecqrggjqt3dhs.jpeg?q=70",
//     "name": "R.D. Sharma",
//     "price": "Rs 250"
//   },
//   {
//     "url":
//         "https://rukminim1.flixcart.com/image/416/416/regionalbooks/r/e/f/mathematics-rd-sharma-class-8th-original-imaecqrggjqt3dhs.jpeg?q=70",
//     "name": "R.D. Sharma",
//     "price": "Rs 250"
//   },
//   {
//     "url":
//         "https://rukminim1.flixcart.com/image/416/416/regionalbooks/r/e/f/mathematics-rd-sharma-class-8th-original-imaecqrggjqt3dhs.jpeg?q=70",
//     "name": "R.D. Sharma",
//     "price": "Rs 250"
//   },
//   {
//     "url":
//         "https://rukminim1.flixcart.com/image/416/416/regionalbooks/r/e/f/mathematics-rd-sharma-class-8th-original-imaecqrggjqt3dhs.jpeg?q=70",
//     "name": "R.D. Sharma",
//     "price": "Rs 250"
//   },
  
// ];
