import 'package:flutter/material.dart';
//import 'package:shopify/models/constant.dart';

class Books {
  final String name;
  final double price;
  final String author;
  final String imgPath;
  final String date;
  final String semester;
  final String crscode;
  final String seller;

  final int id;

  Books({ required this.name,required this.price,required this.author,required this.imgPath,required this.id,required this.date,required this.crscode,required this.semester,required this.seller});

  static List<Books> books = [
     Books(
       id: 1,
      name: "Principles of Compiler Design",
      date: 'July 10',
      price: 510,
      author: "Alfred Aho and Jeffrey Ullman",
      imgPath: "https://images-na.ssl-images-amazon.com/images/I/41cNAQ38qyL._SX319_BO1,204,203,200_.jpg",
      semester: "6",
      crscode: "CS104",
      seller: "Serah"
    ),
   
     Books(
       id:2,
      name: "Design and Analysis of Algorithms",
      date: 'July 10',
      price: 375,
      author: "S Sridhar",
      imgPath: "https://images-eu.ssl-images-amazon.com/images/I/41R7gJgF3mL._SX198_BO1,204,203,200_QL40_FMwebp_.jpg",
      semester: "6",
      crscode: "CS104",
      seller: "Serah"
    ),
    
     Books(
       id:3,
      name: "Image Processing for Computer Graphics and Vision",
      date: 'July 10',
      price: 750,
      author: "Luiz Velho",
      imgPath: "https://m.media-amazon.com/images/I/41Sf2MmqIUL._SY346_.jpg",
      semester: "6",
      crscode: "CS104",
      seller: "Serah"
    ),

      Books(
       id:4,
      name: "Industrial Economics & Foreign Trade",
      date: 'July 10',
      price: 210,
      author: "Rajesh Kumar R",
      imgPath: "https://images-eu.ssl-images-amazon.com/images/I/51-zLgVNIOL._SX198_BO1,204,203,200_QL40_FMwebp_.jpg",
      semester: "6",
      crscode: "CS104",
      seller: "Serah"
    ),

    Books(
       id:5,
      name: "Python Crash Course",
      date: 'July 10',
      price: 425,
      author: "Eric Matthes",
      imgPath: "https://images-eu.ssl-images-amazon.com/images/I/51j89lmxnpL._SX198_BO1,204,203,200_QL40_FMwebp_.jpg",
      semester: "6",
      crscode: "CS104",
      seller: "Serah"
    ),

    Books(
       id:4,
      name: "Industrial Economics & Foreign Trade",
      date: 'July 10',
      price: 210,
      author: "Rajesh Kumar R",
      imgPath: "https://images-eu.ssl-images-amazon.com/images/I/51-zLgVNIOL._SX198_BO1,204,203,200_QL40_FMwebp_.jpg",
      semester: "6",
      crscode: "CS104",
      seller: "Serah"
    ),
  ];

  static List<Books> recentbooks = [
     Books(
       id: 1,
      name: "Principles of Compiler Design",
      date: 'July 10',
      price: 510,
      author: "Alfred Aho and Jeffrey Ullman",
      imgPath: "https://images-na.ssl-images-amazon.com/images/I/41cNAQ38qyL._SX319_BO1,204,203,200_.jpg",
      semester: "6",
      crscode: "CS104",
      seller: "Serah"
    ),
   
     Books(
       id:2,
      name: "Design and Analysis of Algorithms",
      date: 'July 10',
      price: 375,
      author: "S Sridhar",
      imgPath: "https://images-eu.ssl-images-amazon.com/images/I/41R7gJgF3mL._SX198_BO1,204,203,200_QL40_FMwebp_.jpg",
      semester: "6",
      crscode: "CS104",
      seller: "Serah"
    ),
    
     Books(
       id:3,
      name: "Image Processing for Computer Graphics and Vision",
      date: 'July 10',
      price: 750,
      author: "Luiz Velho",
      imgPath: "https://m.media-amazon.com/images/I/41Sf2MmqIUL._SY346_.jpg",
      semester: "6",
      crscode: "CS104",
      seller: "Serah"
    ),

      
  ];
}

